---
paths:
  - "Slides/**/*.tex"
  - "Quarto/**/*.qmd"
  - "scripts/**/*.R"
---

# Course Knowledge Base: Economía del Desarrollo

## Notation Registry

| Rule | Convention | Example | Anti-Pattern |
|------|-----------|---------|-------------|
| Output | $Y$ aggregate, $y = Y/L$ per-worker | $y = Ak^\alpha$ | Mixing $Y$ and $Q$ for output |
| Capital intensity | $k = K/L$ (per worker), $\tilde{k} = K/(AL)$ (effective) | $\dot{k} = sf(k) - (\delta+n+g)k$ | Using $K$ when $k$ is meant |
| TFP | $A$ for level, $g$ for growth rate $\dot{A}/A = g$ | $Y = AK^\alpha L^{1-\alpha}$ | Using $A$ for both level and growth |
| Convergence | $\beta$-convergence: negative coefficient on $\ln y_0$ | $\gamma_i = \alpha + \beta \ln y_{i,0} + \varepsilon_i$ | Saying "convergence" without specifying $\beta$- vs $\sigma$- |
| Inequality | $G$ for Gini, $s_i$ for income shares | $G \in [0,1]$ | Using $G$ for GDP and Gini in same slide |
| Instrumental variable | $Z$ for excluded instrument | settler mortality $\to Z$ | Calling $Z$ both control and instrument |
| Capital share | $\alpha \approx 1/3$ in Cobb-Douglas | $Y = K^\alpha (AL)^{1-\alpha}$ | Confusing $\alpha$ (share) with $\hat{\alpha}$ (OLS estimate) |

## Symbol Reference

| Symbol | Meaning | Introduced |
|--------|---------|------------|
| $Y$, $y$ | Aggregate output, per-worker output | L1, L3 |
| $K$, $k$ | Capital stock, capital-labor ratio | L3 |
| $A$ | Total factor productivity (TFP) | L3, L4 |
| $s$, $\delta$, $n$, $g$ | Savings rate, depreciation, population growth, TFP growth | L3 |
| $f(k)$ | Production function in intensive form | L3 |
| $\alpha$ | Capital share in Cobb-Douglas ($\approx 1/3$) | L3 |
| $k^*$ | Steady-state capital-labor ratio | L3 |
| $\lambda$ | Speed of convergence $\approx (1-\alpha)(\delta+n+g)$ | L3 |
| $\beta$ | Convergence coefficient (negative = $\beta$-convergence) | L3 |
| $G$ | Gini coefficient | L5 |
| $Z$ | Excluded instrument (e.g., settler mortality) | L6 |
| $\tau$ | Extractiveness of institutions (Acemoglu) | L6 |

## Lecture Progression

| # | Title | Core Question | Key Notation | Key Method |
|---|-------|--------------|-------------|------------|
| 1 | Introducción al desarrollo | ¿Por qué algunos países son ricos y otros pobres? | $y$, PPP | Stylized facts, scatter plots |
| 2 | Malthus y la transición | ¿Por qué escapamos de la trampa maltusiana? | $N$, $w$, $\bar{w}$ | Comparative statics, time series |
| 3 | El modelo de Solow | ¿Cuánto explica la acumulación de capital? | $k^*$, $\lambda$, $\beta$ | Growth accounting, OLS convergence |
| 4 | Ideas y crecimiento | ¿Qué hace especial al conocimiento como factor? | $g_A$, $A(t)$ | Endogenous growth, TFP decomposition |
| 5 | Geografía y desarrollo | ¿Es el clima un determinante del desarrollo? | $G$, geography controls | IV, instrumental variables |
| 6 | Instituciones | ¿Son las instituciones la causa fundamental? | $Z$, $\tau$ | IV (settler mortality, AJR 2001) |
| 7 | Cultura y desarrollo | ¿Importan los valores y la confianza? | trust index, Tabellini | Survey data, OLS with cultural controls |
| 8 | Comercio y globalización | ¿El comercio causa crecimiento? | ToT, NX | Gravity models, RDD |
| 9 | Trampas de pobreza | ¿Existen equilibrios múltiples? | $S(x)$, big push | Non-linear dynamics, RCT |
| 10 | Salud y educación | ¿Cuánto vale invertir en capital humano? | $H$, IRR | RCT, diff-in-diff |
| 11 | Crédito y microfinanzas | ¿Por qué fallan los mercados de crédito? | $\rho$, collateral | Banerjee-Newman model, RCT |
| 12 | Gobierno y fallas | ¿Puede la ayuda externa mejorar instituciones? | ODA, AID | Instrumental variables, natural experiments |

## Empirical Applications

| Application | Paper | Dataset | Lecture(s) | Purpose |
|------------|-------|---------|------------|---------|
| Solow residuals & growth accounting | Easterly & Levine (2001) | PWT 10.0 | L3 | Decompose growth into factor accumulation vs TFP |
| Conditional convergence | Mankiw, Romer & Weil (1992) | PWT 10.0 | L3 | Augmented Solow with human capital |
| Colonial origins of institutions | Acemoglu, Johnson & Robinson (2001) | AJR data (AER) | L6 | IV: settler mortality → institutions → income |
| Geography & malaria burden | Sachs et al. (2001) | CIESIN, WHO | L5 | Tropical climate, disease, and income levels |
| Deworming Kenya | Kremer & Miguel (2004) | PSDP Kenya | L10 | RCT: education externalities of deworming |
| Microcredit India | Banerjee et al. (2015) | Spandana RCT | L11 | Randomized microcredit expansion, Hyderabad |

## Design Principles

| Principle | Evidence | Lectures Applied |
|-----------|----------|-----------------|
| Spanish-first: all text in Spanish | Language consistency reduces cognitive load | All |
| Theory before evidence: show mechanism, then test | Students understand WHY before WHAT | L3, L5, L6, L9 |
| One empirical result per claim: assertion backed by paper + dataset | Prevents unverified "stylized facts" | L3, L5, L6, L10, L11 |
| Visualize distributions, not just means | Inequality and convergence are distributional phenomena | L1, L3, L5 |
| Distinguish correlation vs causation explicitly on every slide | Core meta-lesson of the course | All empirical lectures |

## Anti-Patterns (Don't Do This)

| Anti-Pattern | What Happened | Correction |
|-------------|---------------|-----------|
| Mixing growth accounting and growth theory | Using Solow residuals to "explain" long-run level differences | Solow explains transition dynamics, not steady-state differences; use AJR for levels |
| Confusing $\beta$- and $\sigma$-convergence | Saying "convergence" without specifying type | Always write "$\beta$-convergence" or "$\sigma$-convergence" in full |
| Treating Solow as a theory of poverty | "Solow explains why Africa is poor" | Solow explains transition to steady-state; institutions explain why steady-states differ |
| AJR exclusion restriction confusion | "settler mortality is the instrument for income" | settler mortality $\to$ institutions $\to$ income; NOT settler mortality $\to$ income directly |
| Attributing results to "Duflo" without specificity | She has >100 papers | Always cite specific paper: Banerjee & Duflo (2007), Dupas & Robinson (2013), etc. |

## R Code Pitfalls

| Bug | Impact | Fix |
|-----|--------|-----|
| PWT version drift | `pwt10.0` columns renamed across sub-versions | Pin version in `renv.lock`; always check `names(pwt10.0)` first |
| WDI indicator codes change | Silent `NA` in panel data if code deprecated | Use `WDIsearch()` to verify current code; inspect API response for `NA` |
| Log of zero income | `-Inf` propagates silently through regressions | Use `log1p()` or explicit `filter(y > 0)`; document the drop |
| Gini from LIS vs WDI differ | Inconsistent cross-country comparisons (±5 Gini points) | Document data source explicitly; never mix LIS and WDI Ginis in the same chart |
| HDI not in standard WDI | `WDI("HD.HCI.OVRL")` returns `NA` | Use UNDP API or pre-downloaded HDR Excel data |
