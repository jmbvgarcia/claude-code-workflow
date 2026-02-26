# Plan: Syllabus Design — Bibliography, Data Sources & Assessment

**Date:** 2026-02-25
**Status:** COMPLETED (implemented 2026-02-26)

---

## Context

The course infrastructure is configured (CLAUDE.md, header.tex, SCSS, etc.). Now we need the academic content layer: a comprehensive bibliography organized by lecture, a registry of canonical data sources, and a detailed assessment structure. This plan produced three deliverables that will be used when creating actual lecture content.

---

## Deliverable 1: Bibliography (`Bibliography_base.bib`)

### Textbooks

| Book | Scope | Lectures |
|------|-------|----------|
| Weil, *Economic Growth* (4th ed, Ashraf & Weil, 2025) | Required, Parts I–II | L1–L8 |
| Ray, *Development Economics* (1998) | Required, Part III | L9–L12 |
| Todaro & Smith, *Economic Development* (13th ed) | Supplementary reference | All |

### References by Lecture (~40 entries total)

**Part I — "El misterio del crecimiento" (L1–L4)**

| Lecture | Key References | Role |
|---------|---------------|------|
| L1: Introducción | Deaton (2013) *The Great Escape*; Pritchett (1997) "Divergence, Big Time"; Sala-i-Martin (2006) "World Distribution of Income" | Stylized facts, motivation |
| L2: Malthus | Galor & Weil (2000) "Population, Technology, and Growth" AER; Clark (2007) *A Farewell to Alms*; Galor (2005) "From Stagnation to Growth" *Handbook of Economic Growth* | Unified growth theory, Malthusian model |
| L3: Solow | Solow (1956) QJE; Mankiw, Romer & Weil (1992) QJE; Barro (1991) "Economic Growth in a Cross Section" QJE; Easterly & Levine (2001) "It's Not Factor Accumulation" WBER | Core model, convergence, growth accounting |
| L4: Ideas | Romer (1990) "Endogenous Technological Change" JPE; Jones (1995) "R&D-Based Models" JPE; Lucas (1988) "On the Mechanics of Economic Development" JME | Endogenous growth, TFP, human capital externalities |

**Part II — "El misterio de la desigualdad" (L5–L8)**

| Lecture | Key References | Role |
|---------|---------------|------|
| L5: Geografía | Sachs (2001) "Tropical Underdevelopment" NBER; Diamond (1997) *Guns, Germs, and Steel*; Gallup, Sachs & Mellinger (1999) "Geography and Economic Development" IO | Geography hypothesis, disease burden |
| L6: Instituciones | Acemoglu, Johnson & Robinson (2001) AER; Acemoglu & Robinson (2012) *Why Nations Fail*; Acemoglu, Johnson & Robinson (2002) "Reversal of Fortune" QJE; La Porta et al (1999) "Quality of Government" JLEO; Rodrik, Subramanian & Trebbi (2004) "Institutions Rule" JEG | IV identification, colonial origins, horse race |
| L7: Cultura | Tabellini (2010) "Culture and Institutions" JPE; Guiso, Sapienza & Zingales (2006) "Does Culture Affect Economic Outcomes?" JEP; Nunn & Wantchekon (2011) "The Slave Trade and the Origins of Mistrust in Africa" AER | Trust, cultural persistence, slave trade |
| L8: Comercio | Frankel & Romer (1999) "Does Trade Cause Growth?" AER; Sachs & Warner (1995) "Economic Reform and Global Integration"; Rodriguez & Rodrik (2000) "Trade Policy and Growth: A Skeptic's Guide" | Openness debate, ISI critique |

**Part III — "El misterio del estancamiento" (L9–L12)**

| Lecture | Key References | Role |
|---------|---------------|------|
| L9: Trampas | Sachs (2005) *The End of Poverty*; Kraay & McKenzie (2014) "Do Poverty Traps Exist?" JEP; Banerjee & Duflo (2007) "The Economic Lives of the Poor" JEP; Azariadis & Stachurski (2005) "Poverty Traps" *Handbook of Economic Growth* | Multiple equilibria, S-curves, evidence |
| L10: Salud y educación | Kremer & Miguel (2004) "Worms" Econometrica; Duflo (2001) "Schooling and Labor Market Consequences" AER; Bleakley (2010) "Malaria Eradication in the Americas" AEJ:Applied | RCTs, human capital returns, health externalities |
| L11: Crédito | Banerjee & Newman (1993) "Occupational Choice" JPE; Banerjee et al (2015) "Miracle of Microfinance?" AEJ:Applied; Morduch (1999) "The Microfinance Promise" JEL | Credit market failures, RCT evidence |
| L12: Gobierno | Olken (2007) "Monitoring Corruption" JPE; Burnside & Dollar (2000) "Aid, Policies, and Growth" AER; Easterly, Levine & Roodman (2004) critique of B&D; Fisman & Miguel (2007) "Corruption, Norms, and Legal Enforcement" JPE | Corruption, aid effectiveness, governance |

LatAm-specific references included:
- Edwards (1995) "Trade Policy, Exchange Rates, and Growth" — ISI debate, Chile
- Engerman & Sokoloff (2002) "Factor Endowments, Inequality, and Paths of Development" — colonial institutions in LA

---

## Deliverable 2: Data Sources Registry

**File created:** `.claude/rules/data-sources.md`

Path-scoped rule (applies to `scripts/**/*.R`, `Slides/**/*.tex`, `Quarto/**/*.qmd`) registering every canonical dataset, its R package/access method, key variables, and which lectures use it.

Datasets covered: OWID, Maddison Project 2023, PWT 10.01, WDI, UNDP HDR, Barro-Lee, DHS, CASEN, CEPALSTAT, plus lecture-specific replication datasets (AJR, PSDP Kenya, Spandana RCT).

---

## Deliverable 3: Assessment Structure

### Grading Weights

| Component | Weight | Frequency | AI? |
|-----------|--------|-----------|-----|
| Tareas semanales | 35% | 8 assignments (drop lowest) | Yes, with citation |
| Controles (quizzes) | 25% | 3 quizzes (one per Part) | No |
| Examen final | 30% | 1 cumulative | No |
| Participación | 10% | Ongoing | — |

### Tareas Semanales (8 assignments, hybrid model)

**4 Country-Portfolio assignments** (students pick a developing country in week 1):

| # | After | Assignment | Output |
|---|-------|-----------|--------|
| T1 | L1 | **Country Profile**: Use OWID + WDI to produce a 2-page development profile. Compare to Chile and one OECD country. | Data report with 4+ charts |
| T3 | L3–L4 | **Growth Diagnosis**: Apply Solow model to your country using PWT. Compute steady-state prediction, actual vs predicted income, Solow residual. | R script + 1-page interpretation |
| T6 | L6 | **Institutional Audit**: Using AJR framework, analyze colonial history, institutional quality (WGI), and current income. Does the AJR story fit? | Policy brief (2 pages) |
| T8 | L9–L10 | **Poverty & Policy Report**: Document poverty dynamics (WDI/OWID). Identify one RCT-evaluated intervention. Assess applicability. | Final portfolio synthesis (3 pages) |

**4 Standalone assignments**:

| # | After | Assignment | Output |
|---|-------|-----------|--------|
| T2 | L2 | **Malthusian Transition**: Use Maddison data to plot hockey-stick for 5 countries. When did each escape the trap? | Data visualization + essay (1 page) |
| T4 | L5 | **Geography vs Institutions Debate**: Read Sachs (2001) and AJR (2001). Use Claude to summarize. Write critical comparison in your own words. | AI-assisted paper critique |
| T5 | L7 | **Chile Case Study**: Use CASEN microdata to analyze one dimension of development in Chile. | R analysis + visualization |
| T7 | L11 | **Microfinance Evidence Review**: Use AI to find and summarize 3 RCTs on microfinance from different countries. Does microcredit reduce poverty? | Literature review (2 pages) |

### Controles (3 in-class quizzes, offline, 60 min each)

| Control | After | Content |
|---------|-------|---------|
| C1 | L4 | Part I: Solow diagram, steady-state derivation, capital accumulation limits, Solow vs Romer on ideas |
| C2 | L8 | Part II: AJR identification strategy, geography vs institutions vs culture, essay on two countries with similar geography but different income |
| C3 | L12 | Part III: Poverty traps, S-curve diagram, evidence review, when does aid work |

### Examen Final (cumulative, offline, 3 hours)

- Section A: Short-answer definitions and stylized facts (30%)
- Section B: Model application — diagnose a hypothetical country's development problem (40%)
- Section C: Essay — compare two competing theories using course evidence (30%)

---

## Files Created / Modified

| File | Action | Result |
|------|--------|--------|
| `Bibliography_base.bib` | Expanded | 3 → 42 entries (3 textbooks + 37 papers + 2 LatAm) |
| `.claude/rules/data-sources.md` | Created | Data sources registry with usage map and R packages |
| `MEMORY.md` | Updated | 5 new [LEARN:project] entries |
| `quality_reports/plans/2026-02-25_syllabus-design.md` | Created | This archive |

---

## What This Plan Did NOT Do

- Create actual lecture slides (separate task per lecture)
- Write homework problem sets (depends on lecture content)
- Set up R project with `renv` (infrastructure task)
- Create quiz/exam documents (depends on lecture content)
