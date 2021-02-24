# trying my hand at some generative aRt using jasmines
# by Francisko de Moraes Rezende, 2020-31-01, francisko.rezende@gmail

library(jasmines)
library(dplyr)
library(nord)

use_seed(42) %>% 
  entity_circle(grain = 500) %>% 
  unfold_inside() %>% 
  style_ribbon(palette = 'blood', background = 'wheat')
