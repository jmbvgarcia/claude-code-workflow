# Workflow Quick Reference

**Model:** Contractor (you direct, Claude orchestrates)

---

## The Loop

```
Your instruction
    ↓
[PLAN] (if multi-file or unclear) → Show plan → Your approval
    ↓
[EXECUTE] Implement, verify, done
    ↓
[REPORT] Summary + what's ready
    ↓
Repeat
```

---

## I Ask You When

- **Design forks:** "Option A (fast) vs. Option B (robust). Which?"
- **Code ambiguity:** "Spec unclear on X. Assume Y?"
- **Replication edge case:** "Just missed tolerance. Investigate?"
- **Scope question:** "Also refactor Y while here, or focus on X?"

---

## I Just Execute When

- Code fix is obvious (bug, pattern application)
- Verification (tolerance checks, tests, compilation)
- Documentation (logs, commits)
- Plotting (per established standards)
- Deployment (after you approve, I ship automatically)

---

## Quality Gates (No Exceptions)

| Score | Action |
|-------|--------|
| >= 80 | Ready to commit |
| < 80  | Fix blocking issues |

---

## Non-Negotiables

- **Paths:** `here::here()` for R; `TEXINPUTS=../Preambles:$TEXINPUTS` for LaTeX
- **Seeds:** `set.seed(YYYYMMDD)` once at top for any stochastic R code
- **Figures:** transparent background, 12×5 in (Beamer widescreen), `theme_devecon`
- **Colors:** Deep Navy `#1B2A4A` · Warm Teal `#2A7F8E` · Amber `#D4A843` · Forest Green `#15803d` · Crimson `#b91c1c`
- **Language:** All slide text in Spanish; formulas use standard international notation
- **Data:** PWT 10.0 for macro aggregates; WDI for cross-country comparisons; always document version

---

## Preferences

**Visual:** Transparent background, `theme_devecon`, 300 DPI for static exports
**Reporting:** Concise bullets; details on request; flag near-misses in tolerance checks
**Session logs:** Always (post-plan, incremental, end-of-session)
**Replication:** Flag if ±5% from published estimates; investigate if ±10%

---

## Exploration Mode

For experimental work, use the **Fast-Track** workflow:
- Work in `explorations/` folder
- 60/100 quality threshold (vs. 80/100 for production)
- No plan needed — just a research value check (2 min)
- See `.claude/rules/exploration-fast-track.md`

---

## Next Step

You provide task → I plan (if needed) → Your approval → Execute → Done.
