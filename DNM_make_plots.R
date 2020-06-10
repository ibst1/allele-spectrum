source("make_plots.R")

df <- left_join(read_tsv('./outdata/DNM_groups_no.CpG.status.tsv', col_names = FALSE), read_tsv('./outdata/DNM_groups_not.in.CpG.tsv', col_names = FALSE), by='X1') %>% left_join(., read_tsv('./outdata/DNM_groups_in.CpG.tsv', col_names = FALSE), by="X1")
colnames(df) <- c("X1", "All DNMs", "Non-CpG", "CpG")
makefig(df, "figures/DNMs.png")