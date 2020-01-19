setwd("C:\\Users\\damyp\\Downloads")

df <- read.csv("rdata_Apple.csv")

text_df <- data.frame(rid=1:4, comment=df[c(1:4),6])

install.packages("tidytext")
library(tidytext)
library(dplyer)

text_df %>% unnest_tokens(word,comment,token = "ngrams", n=1)
