if(!require(tidyverse)){
    install.packages("tidyverse")
    library(tidyverse)
}

# Function to make figs
makefig <- function(df, fn){
  df$X1 <- str_replace(str_replace(str_replace(str_replace(df$X1, "^ACGT$", "A<>C,\nG<>T"), "^AGCT$", "A<>G,\nC<>T"), "^CG$", "C<>G"), "^AT$", "A<>T")
  df[,-1] <- lapply(df[,-1], function(x) x/sum(x))
  df <- reshape2::melt(df, id.vars="X1", variable.name="Data")
  ggplot(df, aes(x = reorder(X1, -value), y = value, fill = Data)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(y="Proportion", x="") +
    theme_minimal() + theme(text = element_text(size=11), panel.grid.major.x = element_blank(), legend.title = element_blank()) +
    scale_fill_grey(start = .2, end = .8)
  ggsave(filename = fn, device = png(), width = 11, height = 6, units = "cm")
}

# Make fig: DNM all
df.dnm_all <- read_tsv('./outdata/DNM_groups_no.CpG.status.tsv', col_names = FALSE)
colnames(df.dnm_all) <- c("X1", "DNM class")
makefig(df.dnm_all, "figures/DNMs_all.png")


# Make fig: DNM with and without CpG
df.dnm <- left_join(read_tsv('./outdata/DNM_groups_no.CpG.status.tsv', col_names = FALSE), read_tsv('./outdata/DNM_groups_not.in.CpG.tsv', col_names = FALSE), by='X1') %>% left_join(., read_tsv('./outdata/DNM_groups_in.CpG.tsv', col_names = FALSE), by="X1")
colnames(df.dnm) <- c("X1", "All DNMs", "Non-CpG", "CpG")
makefig(df.dnm, "figures/DNMs.png")

# Make fig: DNM, 1000 genomes, Homo/Pan (fixed)
df.x <- left_join(read_tsv('./outdata/DNM_groups_no.CpG.status.tsv', col_names = FALSE), read_tsv('./outdata/1000genomes_groups.tsv', col_names = FALSE), by='X1') %>% left_join(., read_tsv('./outdata/primates_groups.Pan_troglodytes_fixed.tsv', col_names = FALSE), by="X1")
colnames(df.x) <- c("X1", "DNMs", "All human SNPs", "hg18/Pan tr. (fixed)")
makefig(df.x, "figures/DNM+SNP+Pan_fixed.png")

# Make fig: DNM (not CpG), 1000 genomes, Homo/Pan (fixed)
df.x.exCpG <- left_join(read_tsv('./outdata/DNM_groups_not.in.CpG.tsv', col_names = FALSE), read_tsv('./outdata/1000genomes_groups.tsv', col_names = FALSE), by='X1') %>% left_join(., read_tsv('./outdata/primates_groups.Pan_troglodytes_fixed.tsv', col_names = FALSE), by="X1")
colnames(df.x.exCpG) <- c("X1", "DNMs (except CpG)", "All human SNPs", "hg18/Pan tr. (fixed)")
makefig(df.x.exCpG, "figures/DNM.exCpG+SNP+Pan_fixed.png")

# Make fig: DNM, 1000 genomes, Homo/Pan (all: fixed+polymorphic)
df.xa <- left_join(read_tsv('./outdata/DNM_groups_no.CpG.status.tsv', col_names = FALSE), read_tsv('./outdata/1000genomes_groups.tsv', col_names = FALSE), by='X1') %>% left_join(., read_tsv('./outdata/primates_groups.Pan_troglodytes_all.tsv', col_names = FALSE), by="X1")
colnames(df.xa) <- c("X1", "DNMs", "All human SNPs", "hg18/Pan tr.\n(fixed + polymorphic)")
makefig(df.xa, "figures/DNM+SNP+Pan_all.png")

# Make fig: DNM, 1000 genomes, Homo/Pan (Swedish labels)
df.xs <- left_join(read_tsv('./outdata/DNM_groups_no.CpG.status.tsv', col_names = FALSE), read_tsv('./outdata/1000genomes_groups.tsv', col_names = FALSE), by='X1') %>% left_join(., read_tsv('./outdata/primates_groups.Pan_troglodytes_fixed.tsv', col_names = FALSE), by="X1")
colnames(df.xs) <- c("X1", "DNMs", "Alla mänskliga SNPs", "Människa/\nschimpans")
makefig(df.xs, "figures/DNM+SNP+Pan_fixed__Swe.png")

# Make fig: great apes (fixed)
df.p <- left_join(read_tsv('./outdata/primates_groups.Homo_fixed.tsv', col_names = FALSE), read_tsv('./outdata/primates_groups.Pan_troglodytes_fixed.tsv', col_names = FALSE), by='X1') %>% left_join(., read_tsv('./outdata/primates_groups.Pan_paniscus_fixed.tsv', col_names = FALSE), by="X1") %>% left_join(., read_tsv('./outdata/primates_groups.Gorilla_fixed.tsv', col_names = FALSE), by="X1") %>% left_join(., read_tsv('./outdata/primates_groups.Pongo_abelii_fixed.tsv', col_names = FALSE), by="X1") %>% left_join(., read_tsv('./outdata/primates_groups.Pongo_pygmaeus_fixed.tsv', col_names = FALSE), by="X1")
colnames(df.p) <- c("X1", "Homo/hg18", "Pan troglodytes/hg18", "Pan paniscus/hg18", "Gorilla/hg18", "Pongo abelii/hg18", "Pongo pygmaeus/hg18")
makefig(df.p, "figures/primates_fixed.png")

# Make fig: great apes (all: fixed+polymorphic)
df.pa <- left_join(read_tsv('./outdata/primates_groups.Homo_all.tsv', col_names = FALSE), read_tsv('./outdata/primates_groups.Pan_troglodytes_all.tsv', col_names = FALSE), by='X1') %>% left_join(., read_tsv('./outdata/primates_groups.Pan_paniscus_all.tsv', col_names = FALSE), by="X1") %>% left_join(., read_tsv('./outdata/primates_groups.Gorilla_all.tsv', col_names = FALSE), by="X1") %>% left_join(., read_tsv('./outdata/primates_groups.Pongo_abelii_all.tsv', col_names = FALSE), by="X1") %>% left_join(., read_tsv('./outdata/primates_groups.Pongo_pygmaeus_all.tsv', col_names = FALSE), by="X1")
colnames(df.pa) <- colnames(df.p)
makefig(df.pa, "figures/primates_all.png")

