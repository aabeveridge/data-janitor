#############################
# Wordcloud/Tagcloud Example
#############################

# Text mining package for R
library(tm)

# Tagcloud/wordcloud package for R
library(wordcloud)

# Stemming package for R
library(SnowballC)

# Color palate package for R
library(RColorBrewer)

library(ggplot2)
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


##########################################
## Word Frequency Bar Graph 1
##########################################

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

#wiki.corpus <- Corpus(VectorSource(wiki.docs))
#png(file="wc1.png", width=650, height=650)
#wordcloud(wiki.corpus, random.order=FALSE)
#dev.off()
#rm(wiki.corpus)

# Creates the wordcloud based on default settings for wordcloud() 
# and an unscrubbed corpus 
wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="wc2.png", width=650, height=650)
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=FALSE)
dev.off()
rm(wiki.corpus)

wiki.docs <- removePunctuation(wiki.docs, preserve_intra_word_dashes=TRUE)
wiki.docs <- removeNumbers(wiki.docs)
wiki.corpus <- Corpus(VectorSource(wiki.docs))
wiki.docs <- tolower(wiki.docs)
wiki.docs <- removeWords(wiki.docs, stopwords(kind="SMART"))
wiki.docs <- stripWhitespace(wiki.docs)

wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="wc3.png", width=650, height=650)
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=FALSE)
dev.off()
rm(wiki.corpus)

# Adding random word order to help with comparison
wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="wc4.png", width=650, height=650)
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=TRUE)
dev.off()
rm(wiki.corpus)

# Adding colors
wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="wc5.png", width=650, height=650)
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=TRUE, colors=brewer.pal(12, "Paired"), random.color=FALSE)
dev.off()
rm(wiki.corpus)

# Changing colors
wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="wc6.png", width=650, height=650)
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=TRUE, colors=brewer.pal(8, "Dark2"), random.color=FALSE)
dev.off()
rm(wiki.corpus)

# Changing colors removing randomization
wiki.corpus <- Corpus(VectorSource(wiki.docs))
png(file="wc7.png", width=650, height=650)
wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=FALSE, colors=brewer.pal(8, "Dark2"), random.color=FALSE)
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

##################################
# Cluster Graph
##################################
wiki.corpus <- Corpus(VectorSource(wiki.docs))
dtm <- DocumentTermMatrix(wiki.corpus)
png("./images/cluster1.png", 750, 550)
    plot(dtm, terms=findFreqTerms(dtm, lowfreq=31, highfreq=1000), corThreshold=0.25, 
       attrs=list(node=list(shape = "ellipse", fixedsize = TRUE, fillcolor="lightblue", 
       height="1.5", width="6", fontsize="14.5")))
dev.off()
rm(wiki.corpus)
#wordcloud(wiki.corpus, max.words=200, scale=c(6, 1), random.order=FALSE, colors=brewer.pal(12, "Paired"), random.color=FALSE)
