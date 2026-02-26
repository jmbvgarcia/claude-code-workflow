---
paths:
  - "**/*.R"
  - "Figures/**/*.R"
  - "scripts/**/*.R"
---

# R Code Standards

**Standard:** Senior Principal Data Engineer + PhD researcher quality

---

## 1. Reproducibility

- `set.seed()` called ONCE at top (YYYYMMDD format)
- All packages loaded at top via `library()` (not `require()`)
- All paths relative to repository root
- `dir.create(..., recursive = TRUE)` for output directories

## 2. Function Design

- `snake_case` naming, verb-noun pattern
- Roxygen-style documentation
- Default parameters, no magic numbers
- Named return values (lists or tibbles)

## 3. Domain Correctness

<!-- Customize for your field's known pitfalls -->
- Verify estimator implementations match slide formulas
- Check known package bugs (document below in Common Pitfalls)

## 4. Visual Identity

```r
# --- Development Economics color palette ---
primary_navy   <- "#1B2A4A"   # Deep Navy: headings, primary accents
warm_teal      <- "#2A7F8E"   # Warm Teal: secondary emphasis
accent_amber   <- "#D4A843"   # Amber: highlights, alerts
positive_green <- "#15803d"   # Forest Green: good outcomes, growth
negative_red   <- "#b91c1c"   # Crimson: poverty, bad outcomes
slate_gray     <- "#525252"   # Slate Gray: reference/context
```

### Custom Theme
```r
theme_devecon <- function(base_size = 14) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.title = element_text(face = "bold", color = primary_navy),
      legend.position = "bottom"
    )
}
```

### Figure Dimensions for Beamer
```r
ggsave(filepath, width = 12, height = 5, bg = "transparent")
```

## 5. RDS Data Pattern

**Heavy computations saved as RDS; slide rendering loads pre-computed data.**

```r
saveRDS(result, file.path(out_dir, "descriptive_name.rds"))
```

## 6. Common Pitfalls

<!-- Add your field-specific pitfalls here -->
| Pitfall | Impact | Prevention |
|---------|--------|------------|
| Missing `bg = "transparent"` | White boxes on slides | Always include in ggsave() |
| Hardcoded paths | Breaks on other machines | Use relative paths |
| PWT version drift | `pwt10.0` columns renamed across sub-versions | Pin version in `renv.lock`; check `names(pwt10.0)` |
| WDI indicator codes change | Silent `NA` in panel data | Use `WDIsearch()` to verify codes; inspect for `NA` |
| Log of zero income | `-Inf` propagates silently | Use `log1p()` or explicit `filter(y > 0)`; document |
| Gini from LIS vs WDI differ | Inconsistent comparisons (±5 pts) | Document source; never mix LIS and WDI Ginis in same chart |
| HDI not in standard WDI | `WDI()` returns `NA` | Use UNDP API or pre-downloaded HDR data |

## 7. Line Length & Mathematical Exceptions

**Standard:** Keep lines <= 100 characters.

**Exception: Mathematical Formulas** -- lines may exceed 100 chars **if and only if:**

1. Breaking the line would harm readability of the math (influence functions, matrix ops, finite-difference approximations, formula implementations matching paper equations)
2. An inline comment explains the mathematical operation:
   ```r
   # Sieve projection: inner product of residuals onto basis functions P_k
   alpha_k <- sum(r_i * basis[, k]) / sum(basis[, k]^2)
   ```
3. The line is in a numerically intensive section (simulation loops, estimation routines, inference calculations)

**Quality Gate Impact:**
- Long lines in non-mathematical code: minor penalty (-1 to -2 per line)
- Long lines in documented mathematical sections: no penalty

## 8. Code Quality Checklist

```
[ ] Packages at top via library()
[ ] set.seed() once at top
[ ] All paths relative
[ ] Functions documented (Roxygen)
[ ] Figures: transparent bg, explicit dimensions
[ ] RDS: every computed object saved
[ ] Comments explain WHY not WHAT
```
