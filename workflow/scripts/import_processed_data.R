library(tidyverse)
library(vegan)
set.seed(2023)

phylotypes <- read_tsv("~/Dropbox/MICROBIOME/imap-bioinformatics-mothur/mothur_process/phylotype_analysis/final.pds.wang.pick.tx.shared", 
                   show_col_types = F) %>%
  select(sample_id = Group, starts_with("Phylo")) %>% 
  pivot_longer(-sample_id, names_to = "otu", values_to = "count") %>%
  group_by(sample_id) %>%
  mutate(total = sum(count)) %>%
  filter(total > 0) %>%
  group_by(otu) %>%
  mutate(total = sum(count)) %>%
  filter(total != 0) %>%
  ungroup() %>%
  select(-total)

otus <- read_tsv("~/Dropbox/MICROBIOME/imap-bioinformatics-mothur/mothur_process/otu_analysis/sample.final.0.03.subsample.shared", 
                   show_col_types = F) %>%
  select(sample_id = Group, starts_with("Otu")) %>% 
  pivot_longer(-sample_id, names_to = "otu", values_to = "count") %>%
  group_by(sample_id) %>%
  mutate(total = sum(count)) %>%
  filter(total > 0) %>%
  group_by(otu) %>%
  mutate(total = sum(count)) %>%
  filter(total != 0) %>%
  ungroup() %>%
  select(-total)


asvs <- read_tsv("~/Dropbox/MICROBIOME/imap-bioinformatics-mothur/mothur_process/asv_analysis/final.asv.shared", 
                   show_col_types = F) %>%
  select(sample_id = Group, starts_with("ASV")) %>% 
  pivot_longer(-sample_id, names_to = "otu", values_to = "count") %>%
  group_by(sample_id) %>%
  mutate(total = sum(count)) %>%
  filter(total > 0) %>%
  group_by(otu) %>%
  mutate(total = sum(count)) %>%
  filter(total != 0) %>%
  ungroup() %>%
  select(-total)
