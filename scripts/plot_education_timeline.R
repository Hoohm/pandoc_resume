library(ggplot2)
library(dplyr)
library(stringr)

education = read.csv(snakemake@input[[1]], stringsAsFactors = FALSE, sep=',')

current_year = as.integer(format(Sys.Date(), "%Y"))

education$End[which(education$End == 'Present')] = current_year

education$End = as.integer(education$End)
education$What = factor(education$What,  levels =education$What[order(education$Start)])

p1 <- ggplot(education,aes(x=Start, y=What, color=What))
p1 = p1 + geom_segment(aes(x=Start,xend=End,yend=What),size=5)
p1 = p1 + scale_colour_discrete(guide=guide_legend(override.aes=list(size=8)))
p1 = p1 + theme_minimal()
p1 = p1 + theme(axis.text.x = element_text(angle = 90, hjust = 1, size=12),axis.text.y = element_text(size=8),legend.position="none")
p1 = p1 + scale_x_discrete('',(min(education$Start) : max(education$End)), limits=c(min(education$Start) : max(education$End)))
p1 = p1 + scale_y_discrete('',expand=c(0,2), labels=function(x) str_wrap(x, width =25 ))
p1
ggsave(p1, filename = snakemake@output[[1]], scale = 0.8, height = 4)