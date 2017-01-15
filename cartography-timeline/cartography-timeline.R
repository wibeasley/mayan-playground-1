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
requireNamespace("ggthemes")
# requireNamespace("tidyr") #For converting wide to long
# requireNamespace("mgcv, quietly=TRUE) #For the Generalized Additive Model that smooths the longitudinal graphs.
# requireNamespace("TabularManifest") # devtools::install_github("Melinae/TabularManifest")

# ---- declare-globals ---------------------------------------------------------
options(show.signif.stars=F) #Turn off the annotations on p-values

path_input <- "./cartography-timeline/timeline.csv"


# ---- load-data ---------------------------------------------------------------
ds <- readr::read_csv(path_input) # 'ds' stands for 'datasets'

# ---- tweak-data --------------------------------------------------------------
pattern  <- "^(\\d{3,4})\\s(BCE|CE)$"
ds <- ds %>%
  dplyr::mutate(
    is_bc       = (gsub(pattern, "\\2", date) == "BCE"),
    date        = as.integer(gsub(pattern, "\\1", date)),
    date        = ifelse(is_bc, -date, date),
    y2          = order(-date)
  )


# ---- graph-continuous -------------------------------------------------------------------

ggplot(ds, aes(x=date, y=y2, label=milestone))  +
  geom_point() +
  geom_text(hjust=0, color="tan") +
  scale_x_continuous(breaks=c(-7000,  2000)) +
  coord_cartesian(xlim=c(-6800, 200000)) +
  ggthemes::theme_hc(bgcolor = "darkunica")
  # ggthemes::theme_solarized()


