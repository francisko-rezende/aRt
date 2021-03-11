library(tidyverse)
library(flametree)
library(paletteer)

# purrr::walk(names(nord::nord_palettes), nord::nord_show_palette)


tree_params <- 
  list(
    seed = 69,
    time = 12,
    img_background = nord::nord_palettes$mountain_forms[4],
    # img_palette = "harrypotter::gryffindor",
    # img_palette = "grDevices::Turku",
    img_palette = "pals::kovesi.isoluminant_cgo_70_c39",
    scale = seq(0.8, 1, by = 0.01),
    # scale = 1,
    angle = c(-15, -10, 0, 10, 15, 20)
    )


dat <- flametree_grow(seed = tree_params$seed,
                      time = tree_params$time,
                      scale = tree_params$scale)

img <- flametree_plot(tree = dat,
                      background = tree_params$img_background,
                      palette = tree_params$img_palette)


plot(img)

# flametree_save(plot = img,
#                filename = "gryfy.png",
#                pixels = 10000)