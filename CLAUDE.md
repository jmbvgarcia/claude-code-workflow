# CLAUDE.MD -- Academic Project Development with Claude Code

**Project:** Economía del Desarrollo
**Institution:** Universidad de Santiago de Chile (USACH)
**Branch:** main

---

## Core Principles

- **Plan first** -- enter plan mode before non-trivial tasks; save plans to `quality_reports/plans/`
- **Verify after** -- compile/render and confirm output at the end of every task
- **Single source of truth** -- Beamer `.tex` is authoritative; Quarto `.qmd` derives from it
- **Quality gates** -- nothing ships below 80/100
- **[LEARN] tags** -- when corrected, save `[LEARN:category] wrong → right` to MEMORY.md

---

## Folder Structure

```
EconDesarrollo/
├── CLAUDE.MD                    # This file
├── .claude/                     # Rules, skills, agents, hooks
├── Bibliography_base.bib        # Centralized bibliography
├── Figures/                     # Figures and images
├── Preambles/header.tex         # LaTeX headers
├── Slides/                      # Beamer .tex files
├── Quarto/                      # RevealJS .qmd files + theme
├── docs/                        # GitHub Pages (auto-generated)
├── scripts/                     # Utility scripts + R code
├── quality_reports/             # Plans, session logs, merge reports
├── explorations/                # Research sandbox (see rules)
├── templates/                   # Session log, quality report templates
└── master_supporting_docs/      # Papers and existing slides
```

---

## Commands

```bash
# LaTeX (3-pass, XeLaTeX only)
cd Slides && TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode file.tex
BIBINPUTS=..:$BIBINPUTS bibtex file
TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode file.tex
TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode file.tex

# Deploy Quarto to GitHub Pages
./scripts/sync_to_docs.sh LectureN

# Quality score
python scripts/quality_score.py Quarto/file.qmd
```

---

## Quality Thresholds

| Score | Gate | Meaning |
|-------|------|---------|
| 80 | Commit | Good enough to save |
| 90 | PR | Ready for deployment |
| 95 | Excellence | Aspirational |

---

## Skills Quick Reference

| Command | What It Does |
|---------|-------------|
| `/compile-latex [file]` | 3-pass XeLaTeX + bibtex |
| `/deploy [LectureN]` | Render Quarto + sync to docs/ |
| `/extract-tikz [LectureN]` | TikZ → PDF → SVG |
| `/proofread [file]` | Grammar/typo/overflow review |
| `/visual-audit [file]` | Slide layout audit |
| `/pedagogy-review [file]` | Narrative, notation, pacing review |
| `/review-r [file]` | R code quality review |
| `/qa-quarto [LectureN]` | Adversarial Quarto vs Beamer QA |
| `/slide-excellence [file]` | Combined multi-agent review |
| `/translate-to-quarto [file]` | Beamer → Quarto translation |
| `/validate-bib` | Cross-reference citations |
| `/devils-advocate` | Challenge slide design |
| `/create-lecture` | Full lecture creation |
| `/commit [msg]` | Stage, commit, PR, merge |
| `/lit-review [topic]` | Literature search + synthesis |
| `/research-ideation [topic]` | Research questions + strategies |
| `/interview-me [topic]` | Interactive research interview |
| `/review-paper [file]` | Manuscript review |
| `/data-analysis [dataset]` | End-to-end R analysis |

---

## Beamer Custom Environments

| Environment          | Effect                    | Use Case                  |
|----------------------|---------------------------|---------------------------|
| `definitionbox[T]`   | Navy-bordered titled box  | Formal definitions        |
| `keybox`             | Teal background box       | Key insights & takeaways  |
| `highlightbox`       | Amber accent box          | Alerts & emphasis         |
| `methodbox`          | Navy left-accent box      | Methods & mechanisms      |
| `quotebox`           | Italic amber-accent box   | Economic quotes           |
| `resultbox`          | Amber-bordered box        | Empirical results         |

## Quarto CSS Classes

| Class       | Effect                | Use Case                   |
|-------------|-----------------------|----------------------------|
| `.smaller`  | 85% font size         | Dense content slides       |
| `.smallest` | 80% font size         | Very dense slides/tables   |
| `.positive` | Forest green bold     | Good outcomes, growth      |
| `.negative` | Crimson bold          | Poverty, bad outcomes      |
| `.neutral`  | Slate gray            | Context, caveats           |
| `.compact`  | Reduced spacing       | Equation-heavy slides      |

---

## Current Project State

| Lecture | Beamer | Quarto | Key Content |
|---------|--------|--------|-------------|
| 1: Introducción al desarrollo | `Lecture01_Intro.tex` | -- | Stylized facts, income differences |
| 2: Malthus y la transición | `Lecture02_Malthus.tex` | -- | Malthusian model, demographic transition |
| 3: El modelo de Solow | `Lecture03_Solow.tex` | -- | Steady-state, convergence, MRW |
| 4: Ideas y crecimiento | `Lecture04_Ideas.tex` | -- | Romer, endogenous growth, TFP |
| 5: Geografía y desarrollo | `Lecture05_Geografia.tex` | -- | Sachs, tropics, natural resources |
| 6: Instituciones | `Lecture06_Instituciones.tex` | -- | AJR, colonial origins, institutions |
| 7: Cultura y desarrollo | `Lecture07_Cultura.tex` | -- | Weber, trust, Tabellini |
| 8: Comercio y globalización | `Lecture08_Comercio.tex` | -- | Openness, trade policy, ISI |
| 9: Trampas de pobreza | `Lecture09_Trampas.tex` | -- | Big push, S-curves, equilibria |
| 10: Salud y educación | `Lecture10_SaludEdu.tex` | -- | RCTs, Kremer, Duflo |
| 11: Crédito y microfinanzas | `Lecture11_Credito.tex` | -- | Market failures, microcredit |
| 12: Gobierno y fallas | `Lecture12_Gobierno.tex` | -- | Corruption, aid debate |
