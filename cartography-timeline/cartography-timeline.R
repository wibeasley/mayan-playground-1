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

# path_input <- "./data-phi-free/derived/motor-trend-car-test.rds"
data_string <- '
date,milestone,position_y
6700 BCE,"map of Catal Hyuk - earliest known map",4
3000 BCE,"Babylonian clay tablets including map of present day Iraq",8
3000 BCE,"first map of the moon",13
600 BCE,"Pythagoas determines earth is a sphere",18
200 BCE,"Eratosthenes determines circumpherence of the earth",-5
150 BCE,"Hipparchus creates early system of latitude based on the sun",-12
150 CE,"Ptolemy creates world map with coordinates for 8,000 locations",-3
476 CE,"Roman Empire collapses, scientific cartography halts in Europe",-18
830 CE,"Al-Khwarizmi produces wowrld map partly based on Ptolemy\'s work",-20
1030 CE,"Al-Biruni develops triangulation",20
1375 CE,"Abraham Cresques produces world map using portolan maps",2
1569 CE,"Gerardus Mercator publishes his first projection for navigation",15
1730 CE,"sextant developed",0
1763 CE,"John Harrison develops acurate clock for determining longitude at sea",5
1802 CE,"Nathaniel Bowditch\'s The New American Practical Navigator is first published",10
1884 CE,"International Meridian Conference chooses Greenwich as prime meridian",-8
1990 CE,"high-quality maps produced from aerial and satellite imagery and GIS and GPS developed",-15
2000 CE,"the space shuttle Endeavour maps more then 80 percent of the earth\'s surface in 10 days",-10
'

# ---- load-data ---------------------------------------------------------------
ds <- readr::read_csv(data_string, TRUE, skip=1) # 'ds' stands for 'datasets'

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
  geom_text(hjust=0) +
  scale_x_continuous(breaks=c(-7000,  2000)) +
  coord_cartesian(xlim=c(-6800, 200000)) #+
  # ggthemes::theme_solarized()


