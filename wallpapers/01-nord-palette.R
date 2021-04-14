# script created for making wallpapers for my computed using djnavarro's jasmines
# package
# by francisko de moraes rezende, 2020-02-08, francisko.rezende@gmail.com


# loading packages --------------------------------------------------------

library(jasmines)
library(tidyverse)
library(nord)

# coding wallpapers -------------------------------------------------------


bkg <- nord_palettes$polarnight[2]


(use_seed(42) %>%
  entity_circle(grain = 100) %>%
  unfold_loop(radius = .5) %>%
  style_ribbon(
    background = bkg,
    palette = palette_manual(nord_palettes$aurora),
    alpha = .5, type = 'curve'
  ) -> plot)

(use_seed(42) %>%
  entity_gaussian(grain = 100) %>%
  unfold_breeze(iterations = 10) %>%
  style_walk(
    background = bkg,
    palette = palette_manual(nord_palettes$aurora),
    alpha = .5
  ) -> plot_2)

(use_seed(69) %>%
  entity_gaussian(grain = 10000) %>%
  unfold_warp(iterations = 10) %>%
  style_ribbon(
    background = bkg,
    palette = palette_manual(nord_palettes$aurora),
    alpha = .5
  ) -> plot_2)



  export_image(plot_2,
    filename = here::here('img', 'web.png'),
    dpi = 600,
    width = 16,
    height = 9
  )
# 
# use_seed(42) %>%
#   entity_gaussian(grain = 10000) %>% 
#   unfold_warp(scatter = F) %>% 
#   style_ribbon(background = "white", palette = palette_manual(nord_palettes$halifax_harbor))
