setwd("C:\\Users\\Default\\Downloads")
df <- read.csv("rdata_Apple.csv")
mean(df$stars)
sd(df$stars)

mean(df$n_helpful,na.rm=T)
sd(df$n_helpful,na.rm=T)

summary(df$stars) 
summary(df$n_helpful)
df[1,6]
View(df[1,])

a <- "빅데이터와 미래사회"
b <- gsub("빅데이터와","인공지능과",a)
c <- gsub("회","회2",a)
d <- gsub("사회","",a)
df$comment <- gsub("gen", "generation", df$comment)
df$comment <- gsub("they ", "", df$comment)

df1 <- subset(df,subset=(stars<3))
df2 <- subset(df,subset=(stars==3))

df3 <- rbind(df1, df2)
df4 <- subset(df,subset=(stars<=3))

df5 <- subset(df,select=stars)

df6 <- subset(df,select=comment)

df7 <- cbind(df5,df6)

df8 <- subset(df,select=c(stars,comment))

install.packages("wordcloud2")

library(wordcloud2)
df <- read.csv("Apple_word_summary.csv")
df1 <- df[,-1]
wordcloud2(df[,c(2,3)])
wordcloud2(df1)

a <- "현재 페이지는"
b <- "입니다"
c <- "페이지"

for(i in 1:100){
  temp <- paste(a,i,c,b)
  print(temp)
}
install.packages("rvest")
install.packages("stringr")

library(rvest)
library(stringr)
url <- "https://www.amazon.com/Samsung-Galaxy-Buds-Wireless-Earbuds/dp/B07MW48NJM/ref=sr_1_2?crid=21FMGJA9GHYXA&keywords=galaxy+buds&qid=1578460558&sprefix=gala%2Caps%2C413&sr=8-2"
doc <- read_html(url)

title <- doc %>%
  html_node("#title_feature_div") %>%
  html_text() %>%
  str_trim()
title

price <- doc %>%
  html_node("#priceblock_ourprice") %>%
  html_text()
price

install.packages("dplyr")
library(dplyr)
