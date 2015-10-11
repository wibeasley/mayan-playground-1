rm(list=ls(all=TRUE)) #Clear the memory of variables from previous run. This is not called by knitr, because it's above the first chunk.

# @knitr load_sources ------------------------------------------------------------

# @knitr load_packages -----------------------------------------------------------
library(ggplot2) #For graphing
library(magrittr) #Pipes
requireNamespace("knitr", quietly=TRUE)
# requireNamespace("scales", quietly=TRUE) #For formating values in graphs
# requireNamespace("RColorBrewer", quietly=TRUE)
requireNamespace("dplyr", quietly=TRUE)
# requireNamespace("plyr", quietly=TRUE)

# @knitr declare_globals ---------------------------------------------------------
path_input <- "./stuffed-animals/data/animal.csv"

# @knitr load_data ---------------------------------------------------------------
ds_animal <- read.csv(path_input, stringsAsFactors=F) # 'ds' stands for 'dataset'

# @knitr tweak_data --------------------------------------------------------------
ds_possible_ages <- data.frame(age_acquired = 0:7)
ds_age <- ds_animal %>%
  dplyr::group_by(age_acquired) %>%
  dplyr::right_join(ds_possible_ages, by="age_acquired") %>%
  dplyr::summarize(
    animal_count = sum(!is.na(animal_name))
  ) 
# ds_age

# #Define the palettes
# colorCenter <- RColorBrewer::brewer.pal(n=3, name="Pastel1")[2:1]
# names(colorCenter) <- levels(ds$Center)
# colorCenterLight <- adjustcolor(colorCenter, alpha.f=.5)

# @knitr marginals ---------------------------------------------------------------
ggplot(ds_age, aes(x=age_acquired, y=animal_count)) +
  geom_bar(stat="identity")
