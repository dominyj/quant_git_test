# 00_setup_metadata.R
# =============================================================================
# Define Countries and Variables for DBnomics Download
# =============================================================================
# Input:  None
# Output: data/metadata/countries.csv
#         data/metadata/dbnomics_variables.csv
# =============================================================================

# For true reproducibility, restart R session before running:
# .rs.restartR()

rm(list = ls())

# Packages
library(tidyverse)
library(here)
library(countrycode)

# =============================================================================
# Define Countries
# =============================================================================

country_names <- c(
  "Germany",
  "France",
  "Italy",
  "Spain",
  "Netherlands"
)

countries <- tibble(country_name = country_names) |>
  mutate(
    country_code = countrycode(country_name, "country.name", "iso3c")
  )

# =============================================================================
# Define DBnomics Variables
# =============================================================================

dbnomics_variables <- tribble(
  ~source, ~dbnomics_id,                              ~countrycode_type, ~variable_name,      ~description,
  "OECD",  "OECD/QNA/{countrycode}.B1_GE.GPSA.Q",    "iso3c",           "gdp_growth",        "Real GDP growth rate, seasonally adjusted",
  "OECD",  "OECD/MEI/{countrycode}.LRHUTTTT.STSA.Q", "iso3c",           "unemployment_rate", "Harmonized unemployment rate, seasonally adjusted"
)

# =============================================================================
# Save Metadata
# =============================================================================

write_csv(countries, here("data/metadata/countries.csv"))
write_csv(dbnomics_variables, here("data/metadata/dbnomics_variables.csv"))

saveRDS(countries, here("data/metadata/countries.rds"))
saveRDS(dbnomics_variables, here("data/metadata/dbnomics_variables.rds"))
