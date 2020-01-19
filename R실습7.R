tidy_text %>% 
  anti_join(stop_words) %>%
  count(word,sort = TRUE)%>%
  head(100) %>%
  wordcloud2(size = 1.2, color = "random-light", fontFamily = 'Tahoma', minRotation = -pi/2, maxRotation = -pi/2)

library(reshape2)
library(tidytext)
library(dplyr)

tidy_text %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment,sort=TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill=0) %>%
  comparison.cloud(colors = c("orange", "navy"), max.words = 100)
