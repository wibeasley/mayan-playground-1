rm(list=ls(all=TRUE)) #Clear the memory of variables from previous run. This is not called by knitr, because it's above the first chunk.

# ---- load-sources ------------------------------------------------------------
#Load any source files that contain/define functions, but that don't load any other types of variables
#   into memory.  Avoid side effects and don't pollute the global environment.
# source("./SomethingSomething.R")

# ---- load-packages -----------------------------------------------------------
library(ggplot2) #For graphing
library(magrittr) #Pipes
requireNamespace("knitr")
requireNamespace("scales") #For formating values in graphs
requireNamespace("RColorBrewer")
requireNamespace("dplyr")
requireNamespace("tidyr") #For converting wide to long
requireNamespace("mgcv", quietly=TRUE) #For the Generalized Additive Model that smooths the longitudinal graphs.
# requireNamespace("TabularManifest") # devtools::install_github("Melinae/TabularManifest")

# ---- declare-globals ---------------------------------------------------------
options(show.signif.stars=F) #Turn off the annotations on p-values

path_input <- "./william/botswana/data/country-year.csv"

# ---- load-data ---------------------------------------------------------------
ds <- readr::read_csv(path_input) # 'ds' stands for 'datasets'

# ---- tweak-data --------------------------------------------------------------
ds <- ds %>%
  dplyr::filter(country=="Botswana")


# ---- marginals ---------------------------------------------------------------
# Inspect continuous variables
# histogram_continuous(d_observed=ds, variable_name="quarter_mile_in_seconds", bin_width=.5, rounded_digits=1)
# histogram_discrete(d_observed=ds, variable_name="forward_gear_count_f")

# ---- spaghetti ------------------------------------------------------------
g1 <- ggplot(ds, aes(x=year, y=life_expectancy, group=country, color=country)) +
  # geom_smooth(method="loess", span=2) +
  geom_line(alpha=.4) +
  geom_point(shape=1, alpha=.3) +
  theme_light() +
  theme(axis.ticks = element_blank())
g1

# g1 %+% aes(color=carburetor_count_f)
