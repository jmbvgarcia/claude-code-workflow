# Project Memory

Corrections and learned facts that persist across sessions.
When a mistake is corrected, append a `[LEARN:category]` entry below.

---

<!-- Append new entries below. Most recent at bottom. -->

## Workflow Patterns

[LEARN:workflow] Requirements specification phase catches ambiguity before planning → reduces rework 30-50%. Use spec-then-plan for complex/ambiguous tasks (>1 hour or >3 files).

[LEARN:workflow] Spec-then-plan protocol: AskUserQuestion (3-5 questions) → create `quality_reports/specs/YYYY-MM-DD_description.md` with MUST/SHOULD/MAY requirements → declare clarity status (CLEAR/ASSUMED/BLOCKED) → get approval → then draft plan.

[LEARN:workflow] Context survival before compression: (1) Update MEMORY.md with [LEARN] entries, (2) Ensure session log current (last 10 min), (3) Active plan saved to disk, (4) Open questions documented. The pre-compact hook displays checklist.

[LEARN:workflow] Plans, specs, and session logs must live on disk (not just in conversation) to survive compression and session boundaries. Quality reports only at merge time.

## Documentation Standards

[LEARN:documentation] When adding new features, update BOTH README and guide immediately to prevent documentation drift. Stale docs break user trust.

[LEARN:documentation] Always document new templates in README's "What's Included" section with purpose description. Template inventory must be complete and accurate.

[LEARN:documentation] Guide must be generic (framework-oriented) not prescriptive. Provide templates with examples for multiple workflows (LaTeX, R, Python, Jupyter), let users customize. No "thou shalt" rules.

[LEARN:documentation] Date fields in frontmatter and README must reflect latest significant changes. Users check dates to assess currency.

## Design Philosophy

[LEARN:design] Framework-oriented > Prescriptive rules. Constitutional governance works as a TEMPLATE with examples users customize to their domain. Same for requirements specs.

[LEARN:design] Quality standard for guide additions: useful + pedagogically strong + drives usage + leaves great impression + improves upon starting fresh + no redundancy + not slow. All 7 criteria must hold.

[LEARN:design] Generic means working for any academic workflow: pure LaTeX (no Quarto), pure R (no LaTeX), Python/Jupyter, any domain (not just econometrics). Test recommendations across use cases.

## File Organization

[LEARN:files] Specifications go in `quality_reports/specs/YYYY-MM-DD_description.md`, not scattered in root or other directories. Maintains structure.

[LEARN:files] Templates belong in `templates/` directory with descriptive names. Currently have: session-log.md, quality-report.md, exploration-readme.md, archive-readme.md, requirements-spec.md, constitutional-governance.md.

## Constitutional Governance

[LEARN:governance] Constitutional articles distinguish immutable principles (non-negotiable for quality/reproducibility) from flexible user preferences. Keep to 3-7 articles max.

[LEARN:governance] Example articles: Primary Artifact (which file is authoritative), Plan-First Threshold (when to plan), Quality Gate (minimum score), Verification Standard (what must pass), File Organization (where files live).

[LEARN:governance] Amendment process: Ask user if deviating from article is "amending Article X (permanent)" or "overriding for this task (one-time exception)". Preserves institutional memory.

## Skill Creation

[LEARN:skills] Effective skill descriptions use trigger phrases users actually say: "check citations", "format results", "validate protocol" → Claude knows when to load skill.

[LEARN:skills] Skills need 3 sections minimum: Instructions (step-by-step), Examples (concrete scenarios), Troubleshooting (common errors) → users can debug independently.

[LEARN:skills] Domain-specific examples beat generic ones: citation checker (psychology), protocol validator (biology), regression formatter (economics) → shows adaptability.

## Memory System

[LEARN:memory] Two-tier memory solves template vs working project tension: MEMORY.md (generic patterns, committed), personal-memory.md (machine-specific, gitignored) → cross-machine sync + local privacy.

[LEARN:memory] Post-merge hooks prompt reflection, don't auto-append → user maintains control while building habit.

## Meta-Governance

[LEARN:meta] Repository dual nature requires explicit governance: what's generic (commit) vs specific (gitignore) → prevents template pollution.

[LEARN:meta] Dogfooding principles must be enforced: plan-first, spec-then-plan, quality gates, session logs → we follow our own guide.

[LEARN:meta] Template development work (building infrastructure, docs) doesn't create session logs in quality_reports/ → those are for user work (slides, analysis), not meta-work. Keeps template clean for users who fork.

## Project: Economía del Desarrollo (USACH)

[LEARN:project] Course is taught in Spanish at USACH; all slide text in Spanish, formulas use standard international notation. Language policy: Spanish-first for pedagogical text, English for variable names in R code.

[LEARN:project] Color palette: Deep Navy #1B2A4A (headings), Warm Teal #2A7F8E (emphasis/teal), Amber #D4A843 (alerts/highlights), Forest Green #15803d (positive outcomes), Crimson #b91c1c (negative outcomes), Slate Gray #525252 (muted text). SCSS file: `Quarto/dev-econ.scss`.

[LEARN:project] 12 lectures across 3 parts — Part I "El misterio del crecimiento" (L1–L4: intro, Malthus, Solow, Romer), Part II "El misterio de la desigualdad" (L5–L8: geography, institutions, culture, trade), Part III "El misterio del estancamiento" (L9–L12: poverty traps, health/education, credit, governance). All Quarto files pending creation.

[LEARN:project] Textbook split: Weil/Ashraf *Economic Growth* (4th ed, 2025) covers Parts I–II (L1–L8); Ray *Development Economics* (1998) covers Part III (L9–L12). Todaro & Smith is supplementary across all lectures.

[LEARN:project] Assessment philosophy: two complementary channels — Tareas semanales (35%, take-home, AI encouraged with citation+reflection) + Controles/Examen (55%, offline, no AI) + Participación (10%). AI-homework trains collaboration skills; offline exams test conceptual depth. 8 tareas (drop lowest), 3 quizzes (one per Part), 1 final.

[LEARN:project] Country-Portfolio model: students pick a developing country in Week 1 and return to it in T1 (profile), T3 (Solow diagnosis), T6 (institutional audit), T8 (poverty+policy report). Creates continuity across the semester; Chile is the "home" comparison country throughout.

[LEARN:project] Canonical data sources by use case: OWID+WDI for macro stylized facts; Maddison 2023 for long-run/hockey-stick; PWT 10.01 for growth accounting and regressions; Barro-Lee for MRW replication; CASEN for Chile micro exercises; DHS for demographics/health; CEPALSTAT for LatAm-specific poverty lines. Registry in `.claude/rules/data-sources.md`.
