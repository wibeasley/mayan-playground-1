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
    year        = as.integer(gsub(pattern, "\\1", date)),
    year        = ifelse(is_bc, -year, year),
    year_rank   = seq.int(from=min(year), to=max(year), length.out=n()),
    y2          = order(-year)
  )


# ---- graph-continuous -------------------------------------------------------------------
x_point   <- 0
x_date    <- 0.3
x_label   <- 0.6
x_buffer  <- 0.05

ggplot(ds, aes(x=x_point, y=year, label=label_long))  +
  geom_point(shape=1, size=2, color="cyan") +
  geom_text(aes(x=x_label, y=year_rank), hjust=0, color=rgb(255, 0, 255, max=255)) +
  geom_segment(aes(x=x_point, xend=x_label, y=year, yend=year_rank), color="blue") +
  scale_x_continuous(breaks=NULL) +
  scale_y_continuous(breaks=seq(-8000, 2000, 2000)) +
  # scale_colour_solarized("blue") +
  coord_cartesian(xlim=c(x_point-.05, 3), ylim=c(-7000, 2200), expand=FALSE) +
  ggthemes:: theme_solarized_2(light = FALSE) +
  # coord_cartesian(xlim=c(-6800, 200000)) +
  # ggthemes::theme_hc(bgcolor = "darkunica") +
  # ggthemes::theme_solarized()
  labs(x=NULL)


