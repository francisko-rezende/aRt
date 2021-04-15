# devtools::install_github("Ijeamakaanyene/contouR")
library(contouR)
library(tidyverse)

#set up your data
# setup <-  contour_grid(grid_size = 30, point_dist = .25, 
#                      z_method = "runif", z = 10, z_span = 3) %>%
#   contour_shape(radius = 10.2, 
#                 x_center = 20, y_center = 20) 
# 
# # plot your data
# contour_plot(setup$grid_shape) +
#   ggplot2::xlim(1, 25) +
#   ggplot2::ylim(1, 23)


# #set up your data
setup <-  contour_grid(grid_size = 40, point_dist = .25,
                     z_method = "runif", z = 10, z_span = 3) %>%
  contour_shape(radius = 7.4,
                x_center = 26, y_center = 26,
                ring_system = "multiple",
                num_rings = 15)

# plot your data
contour_plot(setup$grid_shape, setup$rings, line_col = "#C0D8D8") +
  ggplot2::xlim(1, 50) +
  ggplot2::ylim(1, 50)

ggsave("wallpapers/contour.png", dpi =120, width = 16, height = 9)



# red ---------------------------------------------------------------------


setup <-  contour_grid(grid_size = 40, point_dist = .25,
                     z_method = "runif", z = 10, z_span = 3, ) %>%
  contour_shape(radius = 7.4,
                x_center = 26, y_center = 26,
                ring_system = "multiple",
                num_rings = 15)

# plot your data
contour_plot(setup$grid_shape, setup$rings, line_col = "#F35953", background_col = "#232E21") +
  ggplot2::xlim(1, 50) +
  ggplot2::ylim(1, 50)

ggsave("wallpapers/contour_red.png", dpi =120, width = 16, height = 9)


# red and blue bkg --------------------------------------------------------



setup <-  contour_grid(grid_size = 40, point_dist = .25,
                     z_method = "runif", z = 10, z_span = 3, ) %>%
  contour_shape(radius = 7.4,
                x_center = 26, y_center = 26,
                ring_system = "multiple",
                num_rings = 15)

# plot your data
contour_plot(setup$grid_shape, setup$rings, line_col = "#F35953") +
  ggplot2::xlim(1, 50) +
  ggplot2::ylim(1, 50)

ggsave("wallpapers/contour_red_blue.png", dpi =120, width = 16, height = 9)
