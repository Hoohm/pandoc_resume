library(ggplot2)
library(dplyr)

languages = read.csv(snakemake@input[[1]], stringsAsFactors = FALSE)
languages$Language = factor(languages$Language, levels = languages$Language)
languages$Frequency = factor(languages$Frequency, levels=c('Daily', 'Weekly', 'Monthly'))

current_year = as.integer(format(Sys.Date(), "%Y"))

languages = languages %>%
  mutate(Years_of_experience = current_year - Started)


p = ggplot(languages, aes(x=Frequency, y=Years_of_experience, color=Language, shape=Language,fill=Language))
p = p +  scale_shape_manual(values=c(20:25,10))
p = p + geom_point(size=3)
p = p + theme_minimal()
p = p +  theme(axis.text.x = element_text(angle = 90, hjust = 1),legend.position="bottom")
p = p + ylab('Years of experience')
ggsave(p, filename = snakemake@output[[1]], scale = 0.3, height = 11, width = 16)
