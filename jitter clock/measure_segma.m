
%% =========================================================
%  JITTER CLOCK - MATLAB VERIFICATION
%  Cadence Virtuoso VCSV Import
%
%  Clock Frequency : 5 GHz
%  Target Edge Jitter: 250 fs RMS
%  Clock Swing     : 0 to 1.2 V
%% =========================================================

clc;
clear;
close all;

%% 1. CLOCK PARAMETERS

Fclk = 5e9;                 % Clock frequency
Tclk = 1/Fclk;              % Clock period = 200 ps

VDD = 1.2;
Vth = VDD/2;                % 50% threshold

Target_Jitter = 250e-15;    % 250 fs RMS

filename = 'jitter.vcsv';

%% 2. READ CADENCE VCSV FILE

opts = detectImportOptions(filename, ...
    'FileType','text', ...
    'Delimiter',',');

opts.CommentStyle = ';';
opts.VariableNamesLine = 0;
opts.DataLines = [1 Inf];

data = readmatrix(filename,opts);

% Remove invalid rows
data = data(all(isfinite(data(:,1:2)),2),:);

time = data(:,1);
vclk = data(:,2);

%% 3. EXTRACT RISING EDGE TIMES

idx = find(vclk(1:end-1) < Vth & ...
           vclk(2:end) >= Vth);

% Linear interpolation for accurate 50% crossing
t_edge = time(idx) + ...
    (Vth-vclk(idx)).* ...
    (time(idx+1)-time(idx))./ ...
    (vclk(idx+1)-vclk(idx));

t_edge = t_edge(:);

N = length(t_edge);

%% 4. GENERATE IDEAL RISING EDGE TIMES

% Assumption: First ideal rising edge occurs at 100 ps.
% Change this value if your clock has a different initial phase.

t_first_ideal = 100e-12;

t_ideal = t_first_ideal + (0:N-1)'*Tclk;

%% 5. CALCULATE EDGE TIMING ERROR

% Absolute timing error relative to ideal clock
jitter = t_edge - t_ideal;

% Remove constant timing offset
Mean_Jitter = mean(jitter);

jitter_centered = jitter - Mean_Jitter;

% RMS edge jitter (population standard deviation)
RMS_Jitter = std(jitter_centered,1);

%% 6. CALCULATE PERIOD JITTER

periods = diff(t_edge);

period_error = periods - Tclk;

Period_Jitter = std(period_error,1);

Expected_Period_Jitter = sqrt(2)*Target_Jitter;

%% 7. DISPLAY FIRST 10 RISING EDGES

fprintf('\n========== FIRST 10 RISING EDGES ==========\n');

disp('First 10 rising edge times (ps):');
disp(t_edge(1:min(10,N))*1e12);

disp('First 10 ideal edge times (ps):');
disp(t_ideal(1:min(10,N))*1e12);

disp('First 10 timing errors (fs):');
disp(jitter(1:min(10,N))*1e15);

fprintf('Mean timing offset = %.3f fs\n', ...
    mean(jitter)*1e15);

%% 8. DISPLAY JITTER RESULTS

fprintf('\n========== JITTER RESULTS ==========\n');

fprintf('Number of rising edges = %d\n',N);

fprintf('Mean Edge Error = %.3f fs\n', ...
    Mean_Jitter*1e15);

fprintf('RMS Edge Jitter = %.3f fs\n', ...
    RMS_Jitter*1e15);

fprintf('Target Edge Jitter = %.3f fs\n', ...
    Target_Jitter*1e15);

fprintf('Period Jitter = %.3f fs\n', ...
    Period_Jitter*1e15);

fprintf('Expected Period Jitter = %.3f fs\n', ...
    Expected_Period_Jitter*1e15);

%% 9. PLOT CLOCK WAVEFORM

figure;

plot(time*1e9,vclk,'LineWidth',1);

grid on;
xlabel('Time (ns)');
ylabel('Clock Voltage (V)');
title('Clock Waveform with Jitter');

%% 10. PLOT EDGE JITTER

figure;

plot(1:N,jitter_centered*1e15,'.-');
hold on;

yline(Target_Jitter*1e15,'r--','+250 fs');
yline(-Target_Jitter*1e15,'r--','-250 fs');

grid on;
xlabel('Rising Edge Number');
ylabel('Timing Error (fs)');
title('Rising Edge Jitter');

%% 11. JITTER HISTOGRAM

figure;

histogram(jitter_centered*1e15,30);

grid on;
xlabel('Edge Jitter (fs)');
ylabel('Count');
title('Edge Jitter Distribution');

%% 12. PERIOD JITTER

figure;

plot(1:length(period_error),period_error*1e15,'.-');

grid on;
xlabel('Clock Period Number');
ylabel('Period Error (fs)');
title('Period Jitter');
