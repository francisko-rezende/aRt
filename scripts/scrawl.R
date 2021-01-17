## Script created for coding along Danielle Navarro's aRt programming videos
## by Francisko de Moraes Rezende, francisko.rezende@gmail.com, 2020-01-17


# preliminaries -----------------------------------------------------------

# check for missing packages and install them if needed

list_of_packages <- c("tidyverse", "ambient", "scico", "here")
new_packages <-
  list_of_packages[!(list_of_packages %in% installed.packages()[, "Package"])]
if (length(new_packages)) {
  install.packages(new_packages)
}

# loading packages

library(tidyverse)
library(ambient)
library(scico)
library(here)

# parameters --------------------------------------------------------------

art_par <- list(
  seed = 2,
  n_paths = 500,
  n_steps = 80
)

# setting up the canvas ---------------------------------------------------

set.seed(art_par$seed)


state <- tibble(
  x = runif(
    n = art_par$n_paths,
    min = 0,
    max = 2
  ),
  y = runif(
    n = art_par$n_paths,
    min = 0,
    max = 2
  )
)


# include path id and step id to state

state <- state %>%
  mutate(
    path_id = 1:art_par$n_paths,
    step_id = 1
  )

# keep track of series of states

art_dat <- state

# create art in a loop ----------------------------------------------------


stop_painting <- FALSE

while (stop_painting == FALSE) {
  # do some painting
  
  state <- state %>% 
    mutate(
      x = x + .1,
      step_id = step_id + 1,
    )
  
  current_step <- last(state$step_id)
  print(current_step)
  
  if(last(state$step_id) >= art_par$n_steps) {
    stop_painting <- TRUE
  }
}
