# wordcloud(words,freq,scale=c(4,.5),min.freq=3,max.words=Inf,
# random.order=TRUE, random.color=FALSE, rot.per=.1,
# colors="black",ordered.colors=FALSE,use.r.layout=FALSE,
# fixed.asp=TRUE, ...)

library(wordcloud)
library(RColorBrewer)

darkcols <- brewer.pal(8, "Dark2")

TermTable <- read.csv('out.txt')
names(TermTable) <- c('Term', 'Freq')
wordcloud(TermTable$Term, TermTable$Freq, min.freq=3, max.words=30, scale=c(3,0.1), colors=darkcols)
