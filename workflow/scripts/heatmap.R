source("workflow/scripts/common.R")
source("workflow/scripts/qiime2R.R")

library(tidyverse)
library(tools)
library(yaml)
library(rhdf5)
library(Matrix)

metadata<-read_q2metadata("resources/sample_metadata.tsv")
ASVs<-read_qza("resources/feature_table.qza")$data
taxonomy<-read_qza("resources/taxonomy.qza")$data %>% parse_taxonomy()

taxasums<-summarize_taxa(ASVs, taxonomy)$Genus

taxa_heatmap(taxasums, metadata, "BodySite")

# ggsave("figures/heatmap.pdf", height=4, width=8, device="pdf")
ggsave("figures/q2r_heatmap.png", height=4, width=8, device="png")
ggsave("figures/q2r_heatmap.svg", height=4, width=8, device="svg")


# source("workflow/scripts/microViz.R")
# # #---------------------------------
# # Heatmap
# htmp <- dietswap %>%
#   ps_mutate(nationality = as.character(nationality)) %>%
#   tax_transform("log2", add = 1, chain = TRUE) %>%
#   comp_heatmap(
#     taxa = tax_top(dietswap, n = 30), grid_col = NA, name = "Log2p",
#     taxon_renamer = function(x) stringr::str_remove(x, " [ae]t rel."),
#     colors = heat_palette(palette = viridis::turbo(11)),
#     row_names_side = "left", row_dend_side = "right", sample_side = "bottom",
#     sample_anno = sampleAnnotation(
#       Nationality = anno_sample_cat(
#         var = "nationality", col = c(AAM = "red", AFR = "green"),
#         box_col = NA, legend_title = "Nationality", size = grid::unit(4, "mm")
#       )
#     )
#   )

# ComplexHeatmap::draw(
#   object = htmp, annotation_legend_list = attr(htmp, "AnnoLegends"),
#   merge_legends = TRUE
# )

# ggsave("figures/microviz_heatmap.png", height=4, width=8, device="png")
# ggsave("figures/microviz_heatmap.svg", height=4, width=8, device="svg")