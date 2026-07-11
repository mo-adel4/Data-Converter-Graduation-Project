# Mixed-Signal Data Converter — Graduation Project

**Department:** Electronics & Communications Engineering — Aswan University
**Track:** Analog IC Design
**Project:** Analog-heavy, mixed-signal Data Converter (ADC/DAC)

---

## 📖 Reference Books

| Book | Author | Focus |
|---|---|---|
| *Design of Analog CMOS Integrated Circuits* | Behzad Razavi | Core analog IC design theory |
| *CMOS Circuit Design, Layout, and Simulation* | R. Jacob Baker | Practical design + layout flow |

> Add data-converter-specific references here later (e.g. Razavi's *Data Conversion System Design*, Maloberti's ADC/DAC book) once you pick a topology.

---

## 🛠️ Tools (Free / Open Source)

Main stack: **IIC-OSIC-TOOLS** (open-source IC design tools, maintained by the IEEE IIC community) — bundles:
- **Xschem** — schematic capture
- **Ngspice** — SPICE simulation
- **Magic** — layout
- **KLayout** — layout viewing/DRC
- **Netgen** — LVS
- **OpenPDKs / SKY130 PDK** — process design kit

Repo: [IIC-OSIC-TOOLS](https://github.com/iic-jku/IIC-OSIC-TOOLS)

> Add any other tool repos you settle on below (formal PDK repos, OpenLane, verification tools, etc.)

---

## 🔗 Useful Links & Repos

| Resource | Description | Link |
|---|---|---|
| SKY130 PDK | Open-source 130nm PDK | https://github.com/google/skywater-pdk |
| efabless / Open MPW | Open silicon shuttle program | https://efabless.com |
| _(add more)_ | | |

---

## 📂 Suggested Repo Structure

```
data-converter-project/
├── README.md
├── docs/              # meeting notes, specs, block diagrams
├── theory/            # hand calcs, derivations (per Razavi/Baker)
├── schematics/         # .sch files (Xschem)
├── simulations/        # testbenches, sim results
├── layout/              # Magic/KLayout files
├── reports/             # weekly/lab reports
└── resources/           # links.md, datasheets, papers
```

---

## 📝 Meeting Log

### Meeting 1 — [date]
- Kickoff meeting for graduation project.
- Project defined: mixed-signal Data Converter (analog-heavy, some digital).
- Decided to work from Razavi + Jacob Baker as core references.
- Tooling decision: use free/open-source EDA tools (IIC-OSIC-TOOLS stack) instead of licensed Cadence.
- Action: set up this GitHub repo as the central hub for resources, links, and progress tracking.
