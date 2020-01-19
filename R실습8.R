setwd("C:\\Users\\damyp\\Downloads")
df <- read.csv("rdata_Apple.csv")

library(tidytext)
library(dplyr)

text_df <- data.frame(rid=1:4, text=df[1:4,]$comment)

df_bigram <- text_df %>% unnest_tokens(word,text,token = "ngrams", n=2)