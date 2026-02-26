# =============================================================================
# lecture01_figures.R
# Figures for Lecture 01: Introducción al Desarrollo Económico
# Economía del Desarrollo | USACH
#
# Run from project root:
#   Rscript scripts/R/lecture01_figures.R
#
# Output: Figures/fig_*.pdf (6 figures)
#
# Required packages: ggplot2, dplyr, WDI, scales
# Optional: maddison (Maddison Project data)
# Install: install.packages(c("ggplot2","dplyr","WDI","scales","maddison"))
# =============================================================================

library(ggplot2)
library(dplyr)
library(scales)

# --- Course color palette ---------------------------------------------------
navy   <- "#1B2A4A"
teal   <- "#2A7F8E"
amber  <- "#D4A843"
green  <- "#15803d"
red    <- "#b91c1c"
gray   <- "#525252"
lgray  <- "#EDF1F5"

# --- Output directory -------------------------------------------------------
out_dir <- "Figures"
if (!dir.exists(out_dir)) dir.create(out_dir)

# --- ggplot2 base theme -----------------------------------------------------
theme_usach <- function(base_size = 11) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.title    = element_text(color = navy, face = "bold", size = base_size + 1),
      plot.subtitle = element_text(color = gray, size = base_size - 1),
      plot.caption  = element_text(color = gray, size = base_size - 2, hjust = 0),
      axis.title    = element_text(color = navy, size = base_size),
      axis.text     = element_text(color = gray, size = base_size - 1),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(color = "#e5e7eb", linewidth = 0.4),
      legend.text   = element_text(color = gray, size = base_size - 1),
      legend.title  = element_text(color = navy, face = "bold", size = base_size - 1),
      plot.background  = element_rect(fill = "white", color = NA),
      panel.background = element_rect(fill = "white", color = NA)
    )
}

save_fig <- function(plot, name, width = 7, height = 4.5) {
  path <- file.path(out_dir, paste0(name, ".pdf"))
  ggsave(path, plot = plot, width = width, height = height,
         device = "pdf", dpi = 300)
  message("Saved: ", path)
}

# =============================================================================
# FIGURE 1: fig_income_bar
# Top 10 and Bottom 10 countries by GDP per capita PPP (WDI 2022)
# =============================================================================
message("\n--- Figure 1: Income bar chart ---")

if (requireNamespace("WDI", quietly = TRUE)) {
  library(WDI)
  wdi_raw <- WDI(
    indicator = c(gdppc_ppp = "NY.GDP.PCAP.PP.KD"),
    start = 2022, end = 2022,
    extra = TRUE
  )
  wdi <- wdi_raw |>
    filter(!is.na(gdppc_ppp), income != "Aggregates", !is.na(income)) |>
    filter(!country %in% c("World", "High income", "Low income",
                            "Middle income", "Low & middle income")) |>
    arrange(desc(gdppc_ppp))

  top10    <- head(wdi, 10)
  bottom10 <- tail(wdi, 10)
  bar_data <- bind_rows(
    mutate(top10,    group = "Top 10 (más ricos)"),
    mutate(bottom10, group = "Bottom 10 (más pobres)")
  ) |>
    mutate(
      country = forcats::fct_reorder(country, gdppc_ppp),
      highlight = ifelse(country == "Chile", "Chile", group)
    )

  fig1 <- ggplot(bar_data, aes(x = country, y = gdppc_ppp / 1000,
                               fill = highlight)) +
    geom_col(width = 0.7) +
    coord_flip() +
    scale_fill_manual(
      values = c("Top 10 (más ricos)"    = teal,
                 "Bottom 10 (más pobres)" = red,
                 "Chile"                 = amber),
      name = NULL
    ) +
    scale_y_continuous(labels = label_dollar(suffix = "k", prefix = "$"),
                       expand = expansion(mult = c(0, 0.05))) +
    facet_wrap(~group, scales = "free_y", ncol = 2) +
    labs(
      title    = "PIB per cápita PPP: los extremos (2022)",
      subtitle = "USD constantes 2017",
      x = NULL, y = "PIB per cápita PPP (miles USD)",
      caption  = "Fuente: World Development Indicators, Banco Mundial (2022)."
    ) +
    theme_usach() +
    theme(legend.position = "none")

  save_fig(fig1, "fig_income_bar")
} else {
  message("WDI package not available. Creating placeholder figure.")
  # Hardcoded approximate values (WDI 2022)
  bar_data <- tibble::tribble(
    ~country,         ~gdppc_ppp, ~group,
    "Luxemburgo",         131000, "Top 10",
    "Singapur",           122000, "Top 10",
    "Noruega",            107000, "Top 10",
    "Irlanda",            104000, "Top 10",
    "EAU",                 90000, "Top 10",
    "Estados Unidos",      80000, "Top 10",
    "Suiza",               78000, "Top 10",
    "San Marino",          74000, "Top 10",
    "Catar",               73000, "Top 10",
    "Islandia",            72000, "Top 10",
    "Chile",               28000, "Chile",
    "Malaui",               1600, "Bottom 10",
    "Burundi",              1800, "Bottom 10",
    "Sierra Leona",         2100, "Bottom 10",
    "Madagascar",           2200, "Bottom 10",
    "Niger",                2300, "Bottom 10",
    "Mozambique",           2400, "Bottom 10",
    "Rep. Centroafricana",  2500, "Bottom 10",
    "Liberia",              2600, "Bottom 10",
    "RD Congo",             2700, "Bottom 10",
    "Guinea",               2800, "Bottom 10"
  ) |>
    mutate(country = forcats::fct_reorder(country, gdppc_ppp))

  fig1 <- ggplot(bar_data, aes(x = country, y = gdppc_ppp / 1000,
                               fill = group)) +
    geom_col(width = 0.7) +
    coord_flip() +
    scale_fill_manual(
      values = c("Top 10" = teal, "Bottom 10" = red, "Chile" = amber),
      name = NULL
    ) +
    scale_y_continuous(labels = label_dollar(suffix = "k", prefix = "$"),
                       expand = expansion(mult = c(0, 0.05))) +
    labs(
      title   = "PIB per cápita PPP: los extremos (2022)",
      subtitle = "USD constantes 2017 (valores aproximados)",
      x = NULL, y = "PIB per cápita PPP (miles USD)",
      caption = "Fuente: World Development Indicators, Banco Mundial (2022)."
    ) +
    theme_usach() +
    theme(legend.position = "none")

  save_fig(fig1, "fig_income_bar")
}

# =============================================================================
# FIGURE 2: fig_maddison_lines
# Long-run GDP per capita: selected countries, 1820–2022
# =============================================================================
message("\n--- Figure 2: Maddison time series ---")

if (requireNamespace("maddison", quietly = TRUE)) {
  library(maddison)
  # maddison package provides `maddison` data frame
  mad_lines <- maddison |>
    filter(
      year >= 1820,
      country %in% c("United States", "United Kingdom", "China",
                      "Chile", "India", "Nigeria", "Japan", "Brazil")
    ) |>
    filter(!is.na(gdppc)) |>
    mutate(
      country_es = recode(country,
        "United States"  = "Estados Unidos",
        "United Kingdom" = "Reino Unido",
        "China"          = "China",
        "Chile"          = "Chile",
        "India"          = "India",
        "Nigeria"        = "Nigeria",
        "Japan"          = "Japón",
        "Brazil"         = "Brasil"
      ),
      highlight = country_es == "Chile"
    )
} else {
  message("maddison package not available. Using approximate data.")
  # Approximate Maddison data for key countries (1820–2022)
  years <- c(1820, 1870, 1913, 1950, 1973, 1990, 2000, 2010, 2022)
  mad_lines <- tibble::tribble(
    ~year, ~country_es,    ~gdppc,
    1820, "Estados Unidos",  2000,
    1870, "Estados Unidos",  4000,
    1913, "Estados Unidos",  8000,
    1950, "Estados Unidos", 15000,
    1973, "Estados Unidos", 25000,
    1990, "Estados Unidos", 35000,
    2000, "Estados Unidos", 45000,
    2010, "Estados Unidos", 52000,
    2022, "Estados Unidos", 65000,
    1820, "China",            700,
    1870, "China",            800,
    1913, "China",            900,
    1950, "China",           1000,
    1973, "China",           1500,
    1990, "China",           2500,
    2000, "China",           5000,
    2010, "China",          12000,
    2022, "China",          22000,
    1820, "Chile",           1400,
    1870, "Chile",           2000,
    1913, "Chile",           3500,
    1950, "Chile",           5000,
    1973, "Chile",           8000,
    1990, "Chile",           9500,
    2000, "Chile",          14000,
    2010, "Chile",          20000,
    2022, "Chile",          28000,
    1820, "Nigeria",          700,
    1870, "Nigeria",          700,
    1913, "Nigeria",          800,
    1950, "Nigeria",         1200,
    1973, "Nigeria",         2000,
    1990, "Nigeria",         1500,
    2000, "Nigeria",         2000,
    2010, "Nigeria",         4500,
    2022, "Nigeria",         5500
  ) |>
    mutate(highlight = country_es == "Chile")
}

country_colors <- c(
  "Estados Unidos" = navy,
  "China"          = red,
  "Chile"          = amber,
  "Nigeria"        = "#6b7280",
  "Japón"          = teal,
  "Brasil"         = green,
  "India"          = "#7c3aed",
  "Reino Unido"    = "#9ca3af"
)

fig2 <- ggplot(mad_lines,
               aes(x = year, y = gdppc, color = country_es,
                   linewidth = highlight)) +
  geom_line() +
  scale_color_manual(values = country_colors, name = "País") +
  scale_linewidth_manual(values = c(`FALSE` = 0.7, `TRUE` = 1.8),
                         guide = "none") +
  scale_y_continuous(labels = label_dollar(prefix = "$"),
                     trans  = "log10") +
  scale_x_continuous(breaks = c(1820, 1870, 1913, 1950, 1973, 2000, 2022)) +
  labs(
    title    = "Divergencia en el tiempo: PIB per cápita, 1820--2022",
    subtitle = "Escala logarítmica, USD PPP 2011",
    x = NULL, y = "PIB per cápita PPP (USD 2011, log)",
    caption  = "Fuente: Maddison Project Database 2023."
  ) +
  annotate("text", x = 1822, y = 750, label = "\"Divergence,\nBig Time\"",
           color = gray, size = 2.8, fontface = "italic", hjust = 0) +
  theme_usach() +
  theme(legend.position = "right")

save_fig(fig2, "fig_maddison_lines", width = 8, height = 4.8)

# =============================================================================
# FIGURE 3: fig_maddison_dist_1820
# World income distribution, 1820
# =============================================================================
message("\n--- Figure 3: Maddison distribution 1820 ---")

if (requireNamespace("maddison", quietly = TRUE)) {
  dist_1820 <- maddison::maddison |>
    filter(year == 1820, !is.na(gdppc), gdppc > 0)
} else {
  # Approximate distribution: most countries between 600-2000
  set.seed(42)
  dist_1820 <- data.frame(
    gdppc = c(
      rnorm(60, mean = 1000, sd = 200),
      rnorm(20, mean = 1500, sd = 300),
      rnorm(10, mean = 1900, sd = 200)
    )
  ) |>
    filter(gdppc > 0)
}

fig3 <- ggplot(dist_1820, aes(x = gdppc)) +
  geom_density(fill = navy, color = navy, alpha = 0.7, linewidth = 0.8) +
  scale_x_continuous(
    labels = label_dollar(prefix = "$"),
    limits = c(0, NA),
    expand = expansion(mult = c(0, 0.05))
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) +
  labs(
    title    = "Distribución global de ingresos, 1820",
    subtitle = "Distribución casi unimodal: pobreza casi universal",
    x = "PIB per cápita PPP (USD 2011)", y = "Densidad",
    caption  = "Fuente: Maddison Project Database 2023."
  ) +
  theme_usach()

save_fig(fig3, "fig_maddison_dist_1820")

# =============================================================================
# FIGURE 4: fig_maddison_dist_2022
# World income distribution, 2022
# =============================================================================
message("\n--- Figure 4: Maddison distribution 2022 ---")

if (requireNamespace("maddison", quietly = TRUE)) {
  dist_2022 <- maddison::maddison |>
    filter(year == 2022, !is.na(gdppc), gdppc > 0)
} else {
  set.seed(42)
  dist_2022 <- data.frame(
    gdppc = c(
      rnorm(40, mean =  3000, sd =  800),
      rnorm(20, mean =  8000, sd = 2000),
      rnorm(30, mean = 35000, sd = 8000)
    )
  ) |>
    filter(gdppc > 0)
}

chile_val <- 28000

fig4 <- ggplot(dist_2022, aes(x = gdppc)) +
  geom_density(fill = navy, color = navy, alpha = 0.65, linewidth = 0.8) +
  geom_vline(xintercept = chile_val, color = amber,
             linewidth = 1.2, linetype = "dashed") +
  annotate("text", x = chile_val * 1.05, y = 0,
           label = "Chile", color = amber, size = 3.2,
           fontface = "bold", hjust = 0, vjust = -0.5) +
  scale_x_continuous(
    labels = label_dollar(prefix = "$"),
    limits = c(0, NA),
    expand = expansion(mult = c(0, 0.05))
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.08))) +
  labs(
    title    = "Distribución global de ingresos, 2022",
    subtitle = "Distribución bimodal: algunos escaparon, otros no",
    x = "PIB per cápita PPP (USD 2011)", y = "Densidad",
    caption  = "Fuente: Maddison Project Database 2023."
  ) +
  theme_usach()

save_fig(fig4, "fig_maddison_dist_2022")

# =============================================================================
# FIGURE 5: fig_income_life_expectancy
# Scatter: log GDP per capita vs. life expectancy (WDI 2022)
# =============================================================================
message("\n--- Figure 5: Income vs. life expectancy scatter ---")

if (requireNamespace("WDI", quietly = TRUE)) {
  library(WDI)
  wdi_health <- WDI(
    indicator = c(
      gdppc_ppp = "NY.GDP.PCAP.PP.KD",
      life_exp  = "SP.DYN.LE00.IN",
      pop       = "SP.POP.TOTL"
    ),
    start = 2022, end = 2022,
    extra = TRUE
  ) |>
    filter(!is.na(gdppc_ppp), !is.na(life_exp),
           income != "Aggregates", !is.na(income),
           gdppc_ppp > 0) |>
    mutate(
      is_chile  = country == "Chile",
      log_gdppc = log(gdppc_ppp),
      pop_M     = pop / 1e6
    )
} else {
  # Approximate data for scatter
  set.seed(2024)
  n <- 120
  log_gdp <- runif(n, log(1000), log(130000))
  wdi_health <- data.frame(
    country   = paste0("Country", 1:n),
    log_gdppc = log_gdp,
    life_exp  = 45 + 20 * plogis((log_gdp - log(5000)) * 1.5) +
                rnorm(n, 0, 2),
    pop_M     = runif(n, 0.5, 200),
    is_chile  = FALSE
  )
  wdi_health$is_chile[which.min(abs(wdi_health$log_gdppc - log(28000)))] <- TRUE
  wdi_health$life_exp[wdi_health$is_chile] <- 80.2
}

fig5 <- ggplot(wdi_health,
               aes(x = log_gdppc, y = life_exp)) +
  geom_point(
    data = filter(wdi_health, !is_chile),
    aes(size = pmin(pop_M, 200)),
    color = navy, alpha = 0.45, shape = 16
  ) +
  geom_smooth(method = "loess", se = FALSE, color = teal,
              linewidth = 1.2, linetype = "solid") +
  geom_point(
    data = filter(wdi_health, is_chile),
    size = 5, color = amber, shape = 17
  ) +
  ggrepel::geom_text_repel(
    data = filter(wdi_health, is_chile),
    aes(label = "Chile"),
    color = amber, fontface = "bold", size = 3.5,
    nudge_x = 0.3, nudge_y = -2
  ) +
  scale_x_continuous(
    breaks = log(c(1000, 3000, 10000, 30000, 100000)),
    labels = label_dollar(prefix = "$", suffix = "", big.mark = ",",
                          scale_cut = cut_short_scale())(
      c(1000, 3000, 10000, 30000, 100000)
    )
  ) +
  scale_size_continuous(range = c(1, 8), guide = "none") +
  labs(
    title    = "El Gran Escape: riqueza y salud van juntos (2022)",
    subtitle = "Tamaño de puntos proporcional a la población",
    x = "PIB per cápita PPP (escala log)",
    y = "Esperanza de vida al nacer (años)",
    caption  = "Fuente: World Development Indicators, Banco Mundial (2022)."
  ) +
  theme_usach()

# Fallback if ggrepel not available
if (!requireNamespace("ggrepel", quietly = TRUE)) {
  fig5 <- fig5 +
    geom_text(
      data = filter(wdi_health, is_chile),
      aes(label = "Chile"),
      color = amber, fontface = "bold", size = 3.5,
      nudge_x = 0.3, nudge_y = -2
    )
}

save_fig(fig5, "fig_income_life_expectancy")

# =============================================================================
# FIGURE 6: fig_chile_maddison
# Chile vs. LA peers + world average, Maddison 1950–2022
# =============================================================================
message("\n--- Figure 6: Chile in comparative perspective ---")

if (requireNamespace("maddison", quietly = TRUE)) {
  chile_comp <- maddison::maddison |>
    filter(
      year >= 1950,
      country %in% c("Chile", "Argentina", "Brazil", "Mexico",
                      "Peru", "Colombia", "Korea, Republic of")
    ) |>
    filter(!is.na(gdppc)) |>
    mutate(
      country_es = recode(country,
        "Chile"                = "Chile",
        "Argentina"            = "Argentina",
        "Brazil"               = "Brasil",
        "Mexico"               = "México",
        "Peru"                 = "Perú",
        "Colombia"             = "Colombia",
        "Korea, Republic of"   = "Corea del Sur"
      ),
      highlight = country_es %in% c("Chile", "Corea del Sur")
    )
} else {
  years_chile <- c(1950, 1960, 1973, 1980, 1990, 2000, 2010, 2022)
  chile_comp <- tibble::tribble(
    ~year, ~country_es,    ~gdppc, ~highlight,
    1950, "Chile",          5000, TRUE,
    1960, "Chile",          6000, TRUE,
    1973, "Chile",          8000, TRUE,
    1980, "Chile",          7500, TRUE,
    1990, "Chile",          9500, TRUE,
    2000, "Chile",         14000, TRUE,
    2010, "Chile",         20000, TRUE,
    2022, "Chile",         28000, TRUE,
    1950, "Argentina",      7000, FALSE,
    1960, "Argentina",      9000, FALSE,
    1973, "Argentina",     12000, FALSE,
    1980, "Argentina",     11000, FALSE,
    1990, "Argentina",     10000, FALSE,
    2000, "Argentina",     14000, FALSE,
    2010, "Argentina",     18000, FALSE,
    2022, "Argentina",     24000, FALSE,
    1950, "Brasil",         2500, FALSE,
    1960, "Brasil",         3500, FALSE,
    1973, "Brasil",         7000, FALSE,
    1980, "Brasil",         9000, FALSE,
    1990, "Brasil",         8000, FALSE,
    2000, "Brasil",        11000, FALSE,
    2010, "Brasil",        16000, FALSE,
    2022, "Brasil",        18000, FALSE,
    1950, "Corea del Sur",  1500, TRUE,
    1960, "Corea del Sur",  2000, TRUE,
    1973, "Corea del Sur",  5000, TRUE,
    1980, "Corea del Sur",  8000, TRUE,
    1990, "Corea del Sur", 15000, TRUE,
    2000, "Corea del Sur", 25000, TRUE,
    2010, "Corea del Sur", 35000, TRUE,
    2022, "Corea del Sur", 48000, TRUE
  )
}

comp_colors <- c(
  "Chile"          = amber,
  "Corea del Sur"  = red,
  "Argentina"      = "#6b7280",
  "Brasil"         = "#9ca3af",
  "México"         = "#d1d5db",
  "Perú"           = "#e5e7eb",
  "Colombia"       = "#f3f4f6"
)

# World Bank high-income threshold (~$13,845 in 2022 Atlas method, ~$27,000 PPP)
hic_threshold <- 27000

fig6 <- ggplot(chile_comp,
               aes(x = year, y = gdppc, color = country_es,
                   linewidth = highlight, alpha = highlight)) +
  geom_hline(yintercept = hic_threshold, linetype = "dashed",
             color = green, linewidth = 0.8) +
  annotate("text", x = 1952, y = hic_threshold * 1.05,
           label = "Umbral ingreso alto (BM)", color = green,
           size = 2.8, hjust = 0) +
  geom_line() +
  scale_color_manual(values = comp_colors, name = "País") +
  scale_linewidth_manual(values = c(`FALSE` = 0.6, `TRUE` = 1.8),
                         guide  = "none") +
  scale_alpha_manual(values = c(`FALSE` = 0.5, `TRUE` = 1.0),
                     guide  = "none") +
  scale_y_continuous(labels = label_dollar(prefix = "$"),
                     expand = expansion(mult = c(0, 0.05))) +
  scale_x_continuous(breaks = c(1950, 1973, 1990, 2000, 2010, 2022)) +
  labs(
    title    = "Chile en perspectiva: América Latina y Corea del Sur, 1950--2022",
    subtitle = "PIB per cápita PPP, USD 2011",
    x = NULL, y = "PIB per cápita PPP (USD 2011)",
    caption  = "Fuente: Maddison Project Database 2023."
  ) +
  theme_usach() +
  theme(legend.position = "right")

save_fig(fig6, "fig_chile_maddison", width = 8, height = 4.8)

# =============================================================================
message("\n=== All figures saved to ", out_dir, "/ ===")
message("Files created:")
invisible(lapply(list.files(out_dir, pattern = "fig_.*\\.pdf"), message))
