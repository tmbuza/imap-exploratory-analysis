library(utils)
library(tidyverse)
library(yaml)
library(rhdf5)
library(Matrix)
library(ape)

source("workflow/scripts/common.R")
source("workflow/scripts/qiime2R.R")

if (!dir.exists("data")){dir.create("data")}

file.copy("~/Dropbox/MICROBIOME/imap-data-processing/data/external/external_ps_objects.rda", "data/processed_data.rda", overwrite = TRUE)

file.copy("~/Dropbox/MICROBIOME/imap-bioinformatics-qiime2/qiime2_process/sample-metadata.tsv", "data/metadata.tsv", overwrite = TRUE)
file.copy("~/Dropbox/MICROBIOME/imap-bioinformatics-qiime2/qiime2_process/feature-table.qza", "data/feature.qza", overwrite = TRUE)
file.copy("~/Dropbox/MICROBIOME/imap-bioinformatics-qiime2/qiime2_process/taxonomy.qza", "data/taxonomy.qza", overwrite = TRUE)
file.copy("~/Dropbox/MICROBIOME/imap-bioinformatics-qiime2/qiime2_process/alpha_diversity/shannon_vector.qza", "data/shannon.qza", overwrite = TRUE)


# Imported for demo only
if (!dir.exists("resources")){dir.create("resources")}

download.file("https://docs.qiime2.org/2018.4/data/tutorials/moving-pictures/table.qza", "resources/feature_table.qza")
download.file("https://data.qiime2.org/2018.4/tutorials/moving-pictures/sample_metadata.tsv", "resources/sample_metadata.tsv")
download.file("https://docs.qiime2.org/2018.4/data/tutorials/moving-pictures/taxonomy.qza", "resources/taxonomy.qza")
download.file("https://docs.qiime2.org/2018.4/data/tutorials/moving-pictures/rooted-tree.qza", "resources/rooted_tree.qza")
download.file("https://docs.qiime2.org/2018.4/data/tutorials/moving-pictures/core-metrics-results/shannon_vector.qza", "resources/shannon_vector.qza")

# Rmd template
if (!dir.exists("bs4_viz_books")){dir.create("bs4_viz_books")}
download.file("https://github.com/yiluheihei/microbiomeMarker/blob/master/vignettes/microbiomeMarker-vignette.Rmd", "bs4_viz_books/markers_analysis.Rmd")


