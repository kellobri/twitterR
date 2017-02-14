# Copyright 2014, 2015, 2016 B23 LABS INC.
#
# NOTICE: All information contained herein is, and remains
# the property of B23 LABS INC. The intellectual and technical concepts contained
# herein are proprietary to B23 LABS INC
# and may be covered by U.S. and Foreign Patents,
# patents in process, and are protected by trade secret or copyright law.
# Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained
# from B23 LABS INC.

library(twitteR)
library(tm)
library(SnowballC)
library(stringr)

api_key <- "twitter.dev"
api_secret <- "twitter.dev"
token <- "twitter.dev"
token_secret <- "twitter.dev"

setup_twitter_oauth(api_key, api_secret, token, token_secret)
2

datetoday <- toString(Sys.Date())
tweets <- searchTwitter("bigdata", n=200, lang="en", since=datetoday)

text <- sapply(tweets, function(x) x$getText())
usableText = str_replace_all(text,"[^[:graph:]]", " ")

corp = Corpus(VectorSource(usableText))
corp <- tm_map(corp, content_transformer(tolower), mc.cores=1)
corp <- tm_map(corp, removePunctuation, mc.cores=1)
corp <- tm_map(corp, removeWords, c("bigdata", "https", stopwords("english")), mc.cores=1)

tdm <- TermDocumentMatrix(corp)

m = as.matrix(tdm)
word_freqs = sort(rowSums(m), decreasing = TRUE)
write.csv(word_freqs, file="/home/admin/TwitterProject1/out.txt")
