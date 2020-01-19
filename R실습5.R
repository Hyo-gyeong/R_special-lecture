setwd("C:\\Users\\damyp\\Downloads")
df <- read.csv("rdata_Apple.csv")

install.packages("tidytext")
library(tidytext)
text_df <- data_frame(rid=1:nrow(df),text=df$comment)
tidy_text <- text_df %>% unnest_tokens(word,text,token = "ngrams", n = 1)

data(stop_words) #불용어(stopword) 사전 가져오기
tidy_text <- tidy_text %>% anti_join(stop_words) #불용어 사전에 있는 단어 제거

library(dplyr)
library(ggplot2)
tidy_text %>%
  count(word,sort=TRUE) %>%
  filter(n > 150) %>%
  mutate(word=reorder(word,n)) %>%
  ggplot(aes(word,n)) + 
  geom_col() + 
  xlab(NULL) +
  coord_flip()