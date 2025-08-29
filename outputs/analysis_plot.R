##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            ~~
##           Performing analysis to generate final plot                     ----
##                                                                            ~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# source cleaned data outputs
source("data_import_cleaning.R")

# subsetting out only rolling averaged nutrient concentrations for plotting
prm_avg_subset <- prm_roll_avg|>
  select(sample_id, sample_date, k_mean, no3_mean, ca_mean, mg_mean, nh4_mean)

q1_avg_subset <- q1_roll_avg |>
  select(sample_id, sample_date, k_mean, no3_mean, ca_mean, mg_mean, nh4_mean)

q2_avg_subset <- q2_roll_avg |>
  select(sample_id, sample_date, k_mean, no3_mean, ca_mean, mg_mean, nh4_mean)

q3_avg_subset <- q3_roll_avg |>
  select(sample_id, sample_date, k_mean, no3_mean, ca_mean, mg_mean, nh4_mean)

bisley_data <- full_join(prm_avg_subset, q1_avg_subset)|>
  full_join(q2_avg_subset)|>
  full_join(q3_avg_subset)


# creating a scalar value to point to the hurricane date in plot
hurricane_date <- ymd("1989-09-18")

#........................plotting results........................

#plot for potassium
k_plot <- ggplot(bisley_data, aes(x = sample_date, y = k_mean, color = sample_id)) +
  geom_line() + #creating a line plot
  geom_vline(xintercept = hurricane_date, linetype = "dashed", color = "red") + # adding a line to mark the date of hurricane hugo
  labs(y = "K (mg/l)") + # adding y label
  theme_minimal() + # background theme
  scale_x_date(position = "top") + # switching the position of the x axis to the top of the graph
  theme(axis.title.x = element_blank(), # removing axis title to bunch graphs together
        legend.position = "none") + # remove legend so it does not repeat
  scale_color_paletteer_d("fishualize::Elagatis_bipinnulata") # adding color theme


# plot for nitrate
no3_plot <- ggplot(bisley_data, aes(x = sample_date, y = no3_mean, color = sample_id))+
  geom_line()+ #creating a line plot
  geom_vline(xintercept = hurricane_date, linetype = "dashed", color = "red") + # adding hurricane
  labs(y = "NO3 (ug/l)") + # adding y label
  theme_minimal() + # background theme
  theme(axis.title.x=element_blank(), # removing axis title to bunch graphs together
        axis.text.x  = element_blank(), #removing date markers
        legend.position = "none") + # remove legend so it does not repeat
  scale_color_paletteer_d("fishualize::Elagatis_bipinnulata") # adding same color theme

# plot for calcium
ca_plot <- ggplot(bisley_data, aes(x= sample_date, y = ca_mean, color = sample_id))+
  geom_line()+ #creating a line plot
  geom_vline(xintercept = hurricane_date, linetype = "dashed", color = "red") + # adding hurricane
  labs(y = "Ca (mg/l)", color = "Site") + # adding y label and relabeling the legend with a better name
  theme_minimal() + # base theme
  theme(axis.title.x=element_blank(),  # removing axis title to bunch graphs together
        axis.text.x  = element_blank()) + #removing date markers)
  scale_color_paletteer_d("fishualize::Elagatis_bipinnulata")


# plot for magnesium
mg_plot <- ggplot(bisley_data, aes(x = sample_date, y = mg_mean, color = sample_id))+
  geom_line() +
  geom_vline(xintercept = hurricane_date, linetype = "dashed", color = "red") + 
  labs(y = "Mg (mg/l)") +
  theme_minimal() +
  theme(axis.title.x=element_blank(), 
        axis.text.x  = element_blank(),
        legend.position = "none") +
  scale_color_paletteer_d("fishualize::Elagatis_bipinnulata")


# plot for ammonium
nh4_plot <- ggplot(bisley_data, aes(x = sample_date, y = nh4_mean, color = sample_id))+
  geom_line()+
  geom_vline(xintercept = hurricane_date, linetype = "dashed", color = "red") +
  theme_minimal() +
  labs(y = "NH4 (ug/l)", x = "Year") +
  theme(legend.position = "none") +
  scale_color_paletteer_d("fishualize::Elagatis_bipinnulata")



#wrapping each plot together
patchwork_plot <- patchwork::wrap_plots(k_plot, no3_plot, ca_plot, mg_plot, nh4_plot,
                                        ncol = 1) + # this is stacking all the plots on top of each other
  plot_layout(heights = c(1, 1, 1, 1, 1)) & #setting all heights to be equal
  theme(panel.spacing = unit(0.1, # smushing the panels together
                             "lines"))  # reducing the spacing between plots)   

# adding title, caption, and tags on each panel
patchwork_plot_final <- patchwork_plot + plot_annotation(tag_levels = "A", #this will add a through e on the panels for reference in caption
                                 title = "Hurricane Effects on Stream Chemistry in Bisley Catchement Streams", # adding overhead title to plot
                                 caption = "Fig. 1. Chemical concentrations in Bisley, Puerto Rico streams before and after Hurricane Hugo (1988-1994), using 10-wk moving averages.\nConcentrations for (a) potassium, (b) nitrate, (c) calcium, (d) magnesium, and (e) ammonium. The vertical lines mark the time of hurricane disturbance.") & theme(plot.tag = element_text(size = 8)) #adding caption to describe the plot and applying the plot tags in the same size and style

ggsave("figs/patchwork_plot.png",
       plot = patchwork_plot_final,
       width = 14,   # in inches
       height = 10)  # adjust to match your rendering
