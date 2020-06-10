if(!require(tidyverse)){
    install.packages("tidyverse")
    library(tidyverse)
}

makefig <- function(df, fn){
  df$X1 <- str_replace(str_replace(str_replace(str_replace(df$X1, "^ACGT$", "A↔C/G↔T"), "^AGCT$", "A↔G/C↔T"), "^CG$", "C↔G"), "^AT$", "A↔T")
  df[,-1] <- lapply(df[,-1], function(x) x/sum(x))
  df <- reshape2::melt(df, id.vars="X1", variable.name="Data")
  ggplot(df, aes(x = reorder(X1, -value), y = value, fill = Data)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(y="Proportion", x="") +
    theme_minimal() + theme(panel.grid.major.x = element_blank()) +
    scale_fill_grey(start = .2, end = .8)
  ggsave(filename = fn, device = png(), width = 12, height = 5, units = "cm")
}


# DNM, Alla SNP, Människa/schimpans (Swedish labels)
df <- left_join(read_tsv('./DNM_groups_no.CpG.status.tsv', col_names = FALSE), read_tsv('./1000genomes_groups.tsv', col_names = FALSE), by='X1') %>% left_join(., read_tsv('./primates_groups.Pan_troglodytes.tsv', col_names = FALSE), by="X1")
colnames(df) <- c("X1", "DNM", "Alla SNP", "Människa/\nschimpans")
makefig(df, "fig_DNM+SNP+Ptr.png")

# DNM, All SNP, Homo/Pan
df <- left_join(read_tsv('./DNM_groups_no.CpG.status.tsv', col_names = FALSE), read_tsv('./1000genomes_groups.tsv', col_names = FALSE), by='X1') %>% left_join(., read_tsv('./primates_groups.Pan_troglodytes.tsv', col_names = FALSE), by="X1")
colnames(df) <- c("X1", "DNM", "All SNP", "Homo/\nPan")
makefig(df, "fig_DNM+SNP+Ptr2.png")

# Apes # https://thenaturalhistorian.com/2020/05/28/chimps-orangutans-and-gorillas-evolved-from-a-common-ancestor-on-noahs-ark/?fbclid=IwAR3j9HdGJG5yuPOQDOYtHfABP43vxvEN3we3TWVPFtrYZkJDfOnIMWJm5VM
df <- left_join(read_tsv('./primates_groups.Pan_troglodytes.tsv', col_names = FALSE), read_tsv('./primates_groups.Pan_paniscus.tsv', col_names = FALSE), by='X1') %>% left_join(., read_tsv('./primates_groups.Gorilla.tsv', col_names = FALSE), by="X1") %>% left_join(., read_tsv('./primates_groups.Pongo_abelii.tsv', col_names = FALSE), by="X1") %>% left_join(., read_tsv('./primates_groups.Pongo_pygmaeus.tsv', col_names = FALSE), by="X1") %>% left_join(., read_tsv('./primates_groups.Homo.tsv', col_names = FALSE), by="X1")
colnames(df) <- c("X1", "Pan troglodytes/\nhg18", "Pan paniscus/\nhg18", "Gorilla/\nhg18", "Pongo abelii/\nhg18", "Pongo pygmaeus/\nhg18", "Homo/\nhg18")
makefig(df, "fig_primates.png")
