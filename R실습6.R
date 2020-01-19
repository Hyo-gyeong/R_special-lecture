install.packages("wordcloud")
library(wordcloud)
library(wordcloud2)
library(dplyr)

#version1
tidy_text %>% 
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word,n,max.words=100))


#version2
tidy_text %>% 
  anti_join(stop_words) %>%
  count(word,sort = TRUE)%>%
  head(100) %>%
  wordcloud2()

#version3
tidy_text %>% 
  anti_join(stop_words) %>%
  count(word,sort = TRUE)%>%
  head(100) %>%
  wordcloud2(size = 1.2, color = "random-light", fontFamily = 'Tahoma', minRotation = -pi/2, maxRotation = -pi/2)

