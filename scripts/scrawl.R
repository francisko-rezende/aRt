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
  n_paths = 700,
  n_steps = 100,
  sz_step = 150,
  sz_slip = 100,
  color = "steelblue",
  palette = "inferno"
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
  ),
  z = 0
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
  # make a step

  step <- curl_noise(
    generator = gen_simplex,
    x = state$x,
    y = state$y,
    z = state$z,
    seed = c(1, 1, 1) * art_par$seed
  )


  # do some painting

  state <- state %>%
    mutate(
      x = x + (step$x / 10000) * art_par$sz_step,
      y = y + (step$y / 10000) * art_par$sz_step,
      z = z + (step$z / 10000) * art_par$sz_slip,
      step_id = step_id + 1,
    )

  # append state to art_dat

  art_dat <- bind_rows(art_dat, state)

  # check if we should stop?

  if (last(state$step_id) >= art_par$n_steps) {
    stop_painting <- TRUE
  }
}


# draw the picture --------------------------------------------------------


pic <-
  ggplot(data = art_dat,
         mapping = aes(
           x = x,
           y = y,
           group = path_id,
           color = step_id
         )) +
  geom_path(size = .5,
            alpha = .5,
            show.legend = FALSE) +
  coord_equal() +
  # scale_color_scico(palette = art_par$palette) +
  scale_color_viridis_c(option = art_par$palette) +
  theme_void() +
  theme(
    panel.background = element_rect(fill = art_par$color,
                                    colour = art_par$color),
    plot.background = element_rect(fill = art_par$color, color = art_par$color)
  ) 

print(pic)


# save the ggplot to a png ------------------------------------------------

pixels_wide <- 3000
pixels_high <- 3000

file_name <-
  art_par %>%
  str_c(collapse = "-") %>%
  str_c("scrawl_", ., ".png")



# ggsave(
#   filename = file_name,
#   path = here("img"),
#   plot = pic,
#   width = pixels_high / 300,
#   height = pixels_wide / 300,
#   dpi = 300
# )
