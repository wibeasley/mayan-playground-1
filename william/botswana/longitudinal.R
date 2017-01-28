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
size_botswana    <- c("TRUE"=3, "FALSE"=.5)

# ---- load-data ---------------------------------------------------------------
ds <- readr::read_csv(path_input) # 'ds' stands for 'datasets'

# ---- tweak-data --------------------------------------------------------------
ds <- ds %>%
  dplyr::mutate(
    is_botswana           = (country=="Botswana"),
    completion            = pmin(completion, 100),
    completion_proportion = completion / 100
  ) %>%
  dplyr::filter(continent=="Africa")


# ---- marginals ---------------------------------------------------------------
# Inspect continuous variables
# histogram_continuous(d_observed=ds, variable_name="quarter_mile_in_seconds", bin_width=.5, rounded_digits=1)
# histogram_discrete(d_observed=ds, variable_name="forward_gear_count_f")

# ---- spaghetti ------------------------------------------------------------
g1 <- ggplot(ds, aes(x=year, y=life_expectancy, group=country, color=country, size=is_botswana)) +
  # geom_smooth(method="loess", span=2) +
  geom_line(alpha=.4, na.rm=TRUE) +
  geom_point(shape=1, alpha=.3, na.rm=TRUE) +
  scale_size_manual(values=size_botswana) +
  theme_light() +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.ticks = element_blank()) +
  theme(legend.position="none") +
  labs(x=NULL, y="Life Expectancy", title="Changes in Life Expectancy")

cat("\n\n### Life Expectancy\n\n")
g1


cat("\n\n### Primary School Completion\n\n")
cat("Primary completion rate is the percentage of students completing the last year of primary school. It is calculated by taking the total number of students in the last grade of primary school, minus the number of repeaters in that grade, divided by the total number of children of official graduation age. The ratio can exceed 100% due to over-aged and under-aged children who enter primary school late/early and/or repeat grades. United Nations Educational, Scientific, and Cultural Organization (UNESCO) Institute for Statistics.")
g1 %+% aes(y=completion_proportion) +
  scale_y_continuous(labels = scales::percent) +
  labs(y="Percent Complete", title="Rates of Completing Primary School")

cat("\n\n### Food Supply\n\n")
cat("The total supply of food available in a country, divided by the population and 365 (the number of days in the year).\n\nKilocalories available, on average, for each person, each day. Calories measures the energy content of the food. The required intake per day varies depending on sveral factors, e.g. activity level, weight, gender and age, but it is normally in the range of 1500-3000 kilocalories per day. One banana contains approximatley 100 kilocalories.\n\nSource: Gapminder and http://www.fao.org/faostat/en/#data/CC")
g1 %+% aes(y=food) +
  scale_y_continuous(labels = scales::comma) +
  labs(y="Daily Kilocalories per Person", title="Food Supply")


cat("\n\n### Population Density\n\n")
cat("The number of people in a country, divided by the amount land area.")
g1 %+% aes(y=population_density) +
  scale_y_continuous(labels = scales::comma) +
  labs(y="Population density (per square km)", title="Population Density")



