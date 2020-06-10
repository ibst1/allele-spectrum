if(!require(tidyverse)){
    install.packages("tidyverse")
    library(tidyverse)
}

makefig <- function(df, fn){
  df$X1 <- str_replace(str_replace(str_replace(str_replace(df$X1, "^ACGT$", "A<>C/G<>T"), "^AGCT$", "A<>G/C<>T"), "^CG$", "C<>G"), "^AT$", "A<>T")
  df[,-1] <- lapply(df[,-1], function(x) x/sum(x))
  df <- reshape2::melt(df, id.vars="X1", variable.name="Data")
  ggplot(df, aes(x = reorder(X1, -value), y = value, fill = Data)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(y="Proportion", x="") +
    theme_minimal() + theme(panel.grid.major.x = element_blank()) +
    scale_fill_grey(start = .2, end = .8)
  ggsave(filename = fn, device = png(), width = 12, height = 5, units = "cm")
}