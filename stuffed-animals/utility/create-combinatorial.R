#These first few lines run only when the file is run in RStudio, !!NOT when an Rmd/Rnw file calls it!!
rm(list=ls(all=TRUE))  #Clear the variables from previous runs.

# @knitr load_sources ------------------------------------------------------------

# @knitr load_packages -----------------------------------------------------------
library(ggplot2)
library(magrittr) #Pipes
requireNamespace("dplyr", quietly=TRUE)
# requireNamespace("plyr", quietly=TRUE)
# requireNamespace("testit", quietly=TRUE)

# @knitr declare_globals ---------------------------------------------------------
path_input <- "./stuffed-animals/data/animal.csv"
path_output <- "./stuffed-animals/data/animal_distance.csv"


# @knitr load_data ---------------------------------------------------------------
ds_animal <- read.csv(path_input, stringsAsFactors=FALSE)
colnames(ds_animal)

# @knitr tweak_data --------------------------------------------------------------
animal_count <- nrow(ds_animal)
index_combinations <- combn(animal_count, 2, simplify = F)

# @knitr combinations -----------------------------------------------------
ds_distance <- data.frame(
    animal_id_1       = sapply(index_combinations, function(x) x[1]), 
    animal_id_2       = sapply(index_combinations, function(x) x[2]), 
    animal_name_1     = NA_character_, 
    animal_name_2     = NA_character_, 
    distance          = NA_real_,
    stringsAsFactors  = FALSE
  ) %>% 
  dplyr::mutate(
    animal_name_1 = ds_animal$animal_name[animal_id_1],
    animal_name_2 = ds_animal$animal_name[animal_id_2]
  )

# @knitr save_to_disk ------------------------------------------------------------
readr::write_csv(ds_distance, path_output)
