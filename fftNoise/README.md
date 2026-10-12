# FFT Noise & pwelch: Signal and Noise Measurement

MATLAB example and reference paper on measuring signal and noise levels from an FFT / `pwelch` spectrum (using a sigma-delta bitstream as the test signal).

## Files

| File | Download |
|------|----------|
| `fftNoise.m` | [Download](./fftNoise.m) |
| `2012fftnoise.pdf` | [download](https://raw.githubusercontent.com/mo-adel4/Data-Converter-Graduation-Project/main/fftNoise/2012fftnoise.pdf) |


## What's inside

- **`2012fftnoise.pdf`**: Paper by Hanspeter Schmid (FHNW/IME, 2012). It explains how windowing (coherent gain, noise gain, scallop loss) affects signal and noise in an FFT, how averaging reduces spectrum variance, and how to correctly read signal RMS, noise density, and band power from MATLAB's `pwelch` output.
- **`fftNoise.m`**: The paper's example script. It simulates a 440.55 Hz sine plus noise, passes it through a first-order sigma-delta modulator, computes an 8x-averaged `pwelch` spectrum with a Blackman-Harris window, then calculates signal magnitude, scallop loss, noise floor, 3rd/5th harmonic distortion, and in-band noise (0 to 2500 Hz). It also plots the PSD.

## Usage

1. Open `fftNoise.m` in MATLAB (needs the Signal Processing Toolbox).
2. Run it. Results print in the Command Window and the spectrum is plotted.
3. Read the PDF alongside it to see why each normalisation step is used.

## Credit

Original paper and script by Hanspeter Schmid, FHNW Institute of Microelectronics.
