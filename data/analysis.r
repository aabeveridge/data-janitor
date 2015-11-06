##############################################
# R code for Word Cloud and Bar Graph Visuals
##############################################

# Text mining package
library(tm)
# Tagcloud/wordcloud package
library(wordcloud)
# Stemming package
library(SnowballC)
# Color palate package
library(RColorBrewer)
# ggplot2 Visualization package
library(ggplot2)
# Table visualization package
library(gridExtra)

# Sets the working directory for the project
setwd("~/data-janitor")

# The Corpus() function from the TM library reads in a directory of 
# text files with DirSource() and converts them to the corpus data 
# type for TM. 
docs.list <- list.files("~/data-janitor/data")
wiki.docs <- as.vector(character(0))

for (i in 1:length(docs.list)){
    d <- read.csv(paste("~/data-janitor/data/", docs.list[i], sep=""))
    wiki.docs <- append(wiki.docs, as.character(d$extract))
}

# This graph is completed prior to scrubbing the text data
wiki.corpus <- Corpus(VectorSource(wiki.docs))
dtm <- DocumentTermMatrix(wiki.corpus)
freq <- data.frame(Total = sort(colSums(as.matrix(dtm)),
                                          decreasing=TRUE))
write.csv(head(freq, 50), "freq2.csv")
freq.data <- read.csv("freq2.csv")
rev(freq.data)
freq.data <- as.data.frame(freq.data)
word.names <- head(freq.data$X, 10)
word.names <- rev(word.names)
word.freq <- head(freq.data$Total, 10)
word.freq <- rev(word.freq)

#wiki.corpus <- Corpus(VectorSource(wiki.docs))
#png(file="wc1.png", width=650, height=650)
#wordcloud(wiki.corpus, random.order=FALSE)
#dev.off()
#rm(wiki.corpus)

# Creates the wordcloud based on default settings for wordcloud() 
# and an unscrubbed corpus 
wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="wc2.png", width=650, height=650)
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=FALSE, rot.per=0)
dev.off()
rm(wiki.corpus)

wiki.docs <- removePunctuation(wiki.docs, preserve_intra_word_dashes=TRUE)
wiki.docs <- removeNumbers(wiki.docs)
wiki.docs <- tolower(wiki.docs)
wiki.docs <- removeWords(wiki.docs, stopwords(kind="SMART"))
wiki.docs <- stripWhitespace(wiki.docs)

wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="wc3.png", width=650, height=650)
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=FALSE, rot.per=0)
dev.off()
rm(wiki.corpus)

# Adding random word order to help with comparison
wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="wc4.png", width=650, height=650)
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=TRUE, rot.per=0)
dev.off()
rm(wiki.corpus)

# Qualitative colors 1
wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="wc5.png", width=650, height=650)
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=TRUE, colors=brewer.pal(8, "Paired"), random.color=FALSE)
dev.off()
rm(wiki.corpus)

# Qualitative colors 2
wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="~/Desktop/wc6.png", width=650, height=400)
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=TRUE, colors=brewer.pal(8, "Dark2", colorblindFriendly=TRUE), random.color=FALSE)
dev.off()
rm(wiki.corpus)

# Sequential colors 1
wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="~/Desktop/wc7.png", width=650, height=650)
par(bg="black")
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=TRUE, colors=brewer.pal(9, "YlOrRd"), random.color=FALSE)
dev.off()
rm(wiki.corpus)

# Sequential colors 2
wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="~/Desktop/wc8.png", width=650, height=650)
par(bg="black")
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=TRUE, colors=brewer.pal(9, "PuBuGn"), random.color=FALSE)
dev.off()
rm(wiki.corpus)


## Changing colors removing randomization
#wiki.corpus <- Corpus(VectorSource(wiki.docs))
#png(file="wc7.png", width=650, height=650)
#wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=FALSE, colors=brewer.pal(8, "Dark2"), random.color=FALSE)
#dev.off()
#rm(wiki.corpus)

##########################################
## Word Frequency Bar Graph 1
##########################################

## Open PNG device and set location to save file
png("freq_plot1.png", 600, 480)

	## Set plot dimensions 
	par(pin=c(4, 4))
	
	## Draw plot
	freq.plot <- barplot(word.freq, names.arg=word.names, horiz=TRUE, 
						 main="Word Frequencies", ylab=NULL, xlab="Frequency", 
						 las=2, axes=FALSE)
	
	# Starting x-axis position for adding frequency totals to bars
	freq.pos <- 0.65		
	
	## Add frequency totals to bars	
	for(i in 1:length(word.freq)) {			
	text(freq.pos, labels=word.freq[i], pos=4, offset=.2)
	freq.pos <- freq.pos + 1.2
	}

	## Add bottom axis and numeric range
	axis(1, at=seq(0, 1200, 100))

## Close PDF device
dev.off()
rm(wiki.corpus)

##########################################
## Word Frequency Bar Graph 2
##########################################

# Word frequency bar graph for after scrubbing the text data
wiki.corpus <- Corpus(VectorSource(wiki.docs))
dtm <- DocumentTermMatrix(wiki.corpus)
freq <- data.frame(Total = sort(colSums(as.matrix(dtm)),
                                          decreasing=TRUE))
write.csv(head(freq, 50), "freq2.csv")
freq.data <- read.csv("freq2.csv")
rev(freq.data)
freq.data <- as.data.frame(freq.data)
word.names <- head(freq.data$X, 10)
word.names <- rev(word.names)
word.freq <- head(freq.data$Total, 10)
word.freq <- rev(word.freq)
## Open PNG device and set location to save file
png("freq_plot2.png", 600, 480)

	## Set plot dimensions 
	par(pin=c(4, 4))
	
	## Draw plot
	freq.plot <- barplot(word.freq, names.arg=word.names, horiz=TRUE, 
						 main="Word Frequencies", ylab=NULL, xlab="Frequency", 
						 las=2, axes=FALSE)
	
	# Starting x-axis position for adding frequency totals to bars
	freq.pos <- 0.65		
	
	## Add frequency totals to bars	
	for(i in 1:length(word.freq)) {			
	text(freq.pos, labels=word.freq[i], pos=4, offset=.2)
	freq.pos <- freq.pos + 1.2
	}

	## Add bottom axis and numeric range
	axis(1, at=seq(0, 1200, 100))

## Close PDF device
dev.off()
rm(wiki.corpus)

