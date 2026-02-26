---
paths:
  - "scripts/**/*.R"
  - "Slides/**/*.tex"
  - "Quarto/**/*.qmd"
---

# Data Sources Registry: Economía del Desarrollo

This rule is automatically loaded when working on R scripts, Beamer slides, or Quarto files. Use it to select the correct dataset and access method for each lecture.

---

## Macro / Cross-Country Data

| Source | Access (R) | Key Variables | Lectures | Notes |
|--------|-----------|---------------|----------|-------|
| **Our World in Data** | `owidR` package or CSV download | GDP per capita, life expectancy, population, Gini, child mortality | L1 (stylized facts), all visualization | Pre-cleaned; best for publication-ready charts |
| **Maddison Project 2023** | `readxl` from downloaded Excel | `gdppc` (real GDP/cap, 2011$), `pop`, years 1–2022 | L1 (long-run), L2 (Malthusian era), L3 (convergence) | 169 countries; goes back to year 1 AD; use for hockey-stick growth chart |
| **Penn World Table 10.01** | `pwt10` R package | `rgdpna`, `ck`, `emp`, `rtfpna`, `hc`, `labsh` | L3 (Solow), L4 (TFP), L5–L6 (regressions) | Pin version via `renv`; national-accounts basis for growth accounting |
| **World Development Indicators** | `WDI` R package | 1400+ indicators; key: `NY.GDP.PCAP.PP.KD`, `SI.POV.GINI`, `SP.DYN.LE00.IN` | All macro lectures | Verify codes with `WDIsearch()` before use; codes change across API versions |
| **UNDP Human Development Report** | Manual CSV from UNDP HDR data portal | HDI, GDI, MPI, IHDI | L1, L10 | Not available via WDI; download directly; `WDI("HD.HCI.OVRL")` returns `NA` |
| **Barro-Lee Education** | `barrolee` R package or manual CSV | Average years of schooling by age/sex, 1950–2015 | L3 (MRW replication), L10 | 5-year intervals; used in MRW-style augmented Solow regressions |

---

## Micro / Household Data

| Source | Access | Key Variables | Lectures | Notes |
|--------|--------|---------------|----------|-------|
| **DHS (Demographic & Health Surveys)** | Registration at dhsprogram.com; `rdhs` R package | Fertility, child mortality, nutrition, immunization, wealth index | L10 (health), L2 (demographics) | 15 LatAm countries available; `rdhs` handles API access |
| **CASEN (Chile)** | Download from Ministerio de Desarrollo Social | Income, poverty, education, health, housing | L1 (Chile), L9 (poverty), L11 (credit) | Chilean household survey; ~200K obs; ideal for "home country" exercises in T5 |
| **CEPAL/ECLAC CEPALSTAT** | Web portal or bulk download | Regional poverty lines, Gini, social indicators for all LatAm | L1, L5, L8 | Use for LatAm-specific poverty definitions (CEPAL lines differ from World Bank $2.15/day) |

---

## Replication Datasets (Lecture-Specific)

| Dataset | Source | Lecture | Paper | Notes |
|---------|--------|---------|-------|-------|
| AJR settler mortality | AER data archive | L6 | Acemoglu, Johnson & Robinson (2001) | Used for IV: settler mortality → institutions → income |
| Worms (PSDP Kenya) | J-PAL dataverse | L10 | Kremer & Miguel (2004) | Deworming RCT; treatment externalities |
| Spandana microcredit | J-PAL dataverse | L11 | Banerjee et al. (2015) | Hyderabad randomized microcredit expansion |

---

## Data Usage Map by Lecture

```
L1  [OWID, Maddison, WDI, CASEN, UNDP-HDR]   — stylized facts, Chile snapshot, income distribution
L2  [Maddison, DHS]                            — long-run population dynamics, demographic transition
L3  [PWT 10.01, Barro-Lee, WDI]               — Solow diagram, growth accounting, MRW replication
L4  [PWT 10.01, WDI]                           — TFP decomposition, R&D expenditure shares
L5  [WDI, OWID, PWT 10.01]                    — geography regressions, malaria burden maps
L6  [AJR replication data, PWT 10.01, WDI]   — settler mortality IV, institutional quality indices
L7  [WVS/EVS (trust items), WDI]              — culture regressions, trust cross-country
L8  [PWT 10.01, WDI, CEPALSTAT]              — trade openness, ISI era data, LatAm trade shares
L9  [WDI, OWID, CASEN]                        — poverty headcounts, S-curves, multiple equilibria data
L10 [DHS, Barro-Lee, WDI, AJR-worms]         — health/education RCT data, schooling returns
L11 [CASEN, WDI, Spandana-RCT]               — credit access, microfinance evidence
L12 [WDI, OWID]                               — aid flows, governance indicators, corruption scores
```

---

## R Package Installation

```r
# Core packages — install once, then pin via renv
install.packages(c(
  "WDI",       # World Development Indicators
  "pwt10",     # Penn World Table 10.01
  "owidR",     # Our World in Data
  "readxl",    # Maddison Project (Excel)
  "rdhs",      # DHS surveys
  "barrolee"   # Barro-Lee education data
))

# Pin after installing
renv::snapshot()
```

---

## Key Code Pitfalls (from knowledge-base-template.md)

| Bug | Fix |
|-----|-----|
| PWT column names change across sub-versions | Always `names(pwt10.0)` first; pin in `renv.lock` |
| WDI indicator codes deprecated silently | Use `WDIsearch()` to verify; inspect for `NA` before analysis |
| HDI not in WDI | Use UNDP HDR portal directly |
| Gini from CEPAL vs WDI differ (~5 points) | Document source explicitly; never mix in same chart |
| Log of zero income | Use `log1p()` or `filter(y > 0)`; document the drop |
