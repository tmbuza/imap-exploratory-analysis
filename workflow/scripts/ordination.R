#---------------------------------
library(phyloseq)
library(dplyr)
library(ggplot2)
library(microbiome)
library(microbiomeMarker)

data(dietswap, package = "microbiome")
# data(shao19, package = "microViz")
# data(GlobalPatterns, package = "phyloseq")
#---------------------------------


# Ordination
ps <- dietswap

ord1 <- ps %>%
  tax_filter(min_prevalence = 0.1, tax_level = "Genus") %>%
  tax_agg("Family") %>%
  tax_transform("clr") %>%
  ord_calc()

ord2 <- ord1 %>% 
  ord_plot(
    plot_taxa = 1:6, colour = "bmi_group", size = 1.5,
    tax_vec_length = 0.325,
    tax_lab_style = tax_lab_style(max_angle = 90, aspect_ratio = 0.5),
    auto_caption = 8) +
   stat_ellipse(aes(linetype = bmi_group, colour = bmi_group), linewidth = 0.3) +
   scale_colour_brewer(palette = "Set1") +
   theme(legend.position = "bottom") +
   coord_fixed(ratio = 0.5, clip = "off") 

# # ggsave("PCoA.pdf", height=4, width=5, device="pdf")
# ggsave("figures/q2r_pcoa.png", height=4, width=5, device="png")
# ggsave("figures/q2r_pcoa.svg", height=4, width=5, device="svg")
