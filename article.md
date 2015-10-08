###**Data Literacy, Statistical Rhetoric, and Information Design**
by Aaron Beveridge

##Introduction
As visual rhetoric and design studies turn their attention to data visualization and infographic media, much work remains to understand quantitative reasoning and statistical analysis as rhetorical constructions. In "Rhetorical Numbers: A Case for Quantitative Writing in the Composition Classroom," Joanna Wolfe argues that rhetorical approaches to quantitative reasoning remain largely overlooked in writing studies classrooms. As Wolfe explains, "Rather than reject quantitative argument out of hand, contemporary rhetoricians need to train their students to recognize the unethical, deceptive, and misleading as well as thoughtful, instightful, and revealing applications of quantitative rhetoric" (454). This article provides examples for how the *choices* made during data mining and statistical analysis effect the final visualization those analyses produce. The use of the term *choice* here suggests more variablility and indeterminacy than what is often implied by the concept of quantitative reasoning. Wolfe explains, however, that 

Rather than focus only on quantitative reasoning, I prefer to use the broader concept of "statistical reasoning" because this allows for both quantitative and qualitative approaches to data. Rhetoric and statistics have a lot in common. Both frameworks provide wide-ranging methods of analysis and knowledge-construction that may be applied to an endless array of topics and content for research. Because of this commonality, the two are active in many (if not all) disciplines in the academy. While rhetoric is often associated with qualitative research, and statistics with quantitative research, they frequently cross over these boundaries. For example, the questions in a survey may be rhetorically constructed to carefully recuce (or account for) participant bias, but the results of that same survey may be analyzed with statistical tools--counting responses, calculating correlations, and graphing results. Or, as a counter example, statistical tools may be used to test a hypothesis against a particular dataset, and then rhetoric is utilized when researchers interpret and communicate their results. While these two examples draw more of a traditional line rhetoric and statistics, in the areas of data literacy and information design, no easy distinction exists. 

The statistical methods used in this article are text mining and natural language processing. These methods are frequently applied to textual analysis. Significant progress has been made in the digital humanities to implement these tools for the reading of literary corpora, but much work remains to bring these tools into writing studies and digital rhetoric. As Bill Hart-Davidson and Jim Ridolfo have argued in their introduction to *Rhetoric and the Digital Humanities*, the digital humanities, rhetoric and writing studies have many shared interests and overlapping concerns. In my forthcoming chapter for *Writing Rhetoric and Circulation Studies* I argue that similar methods 

XXXTurn to discuss the rhetoric of science and Fhaenstock's quote about feedback between science and rhetoric. 

##Methodology
The data visualizations produced below rely on a form of text analysis called text mining or text data mining. Text mining takes raw unstructured text and turns it into structured data that can be statistically analyzed. For this article, a corpus of text documents is constructed from the following Wikipedia pages:

- Composition Studies
- English Studies
- Digital Rhetoric
- Computers and Writing
- Technical Communication
- Writing Across the Curriculum
- Writing about Writing
- Visual Rhetoric
- Media Studies
- Ecocomposition

The text contained in the articles was systematically collected with a data mining application called MassMine. MassMine is funded by the National Endowment for the Humanities, and is an open source software that supports social network data mining for academic research. After collecting the text data from Wikipedia, the data scrubbing and analysis was completed with the open source programming language called R. R is designed specifically for data extraction and statistical analysis, and it is one of the best tools available for making "big data" methodologies accessible to all scholars. While the *amount* of data contained in the 10 Wikipedia pages used for this article does not by any means qualify as "big," the analyses exemplified below nonetheless provide an introduction to "big" methodologies. MassMine is used to collect the data and then R is used to analyze and visualize that data. However, the methods utilized to process the unstructured text and to produce the data visualizations are common among text mining, regardless of the tools being used.

The primary visualizations below are wordclouds or tagclouds. Wordclouds may be some-what out of fashion for visualizing textual analysis. Or, maybe wordclouds are so common that they are no longer thought of as a form of data visualization--especially as more complex analytics have become readily available. However, their commonality is precisely why they are useful for the demonstration that follows. A useful comparison is thinking of wordclouds as similar to a common idomatic expression---seeing a wordcloud is like hearing "it's raining cats and dogs." The individual words that make up the idiom, or the etymology that led to its frequent use, are often not considered in the passing of a conversation. Likewise, with wordclouds, there are many steps between the raw unstructured text and the final wordcloud visualization. Some of the steps require "data scrubbing" or "data janitorial work," and others involve making quantitative choices with how text data is organized and represented. 

A common cloud tool for making wordclouds is [Wordle](http://wordle.net). Cloud data visualization tools provide an accessible way for rhetoric and writing scholars to begin critically approaching data literacy and information design. As Laurie Gries argues, "quote about starting small from Kairos article here." However, it is important that scholars understand the difference between tools like XXXthe timeline tool that LG usesXXX, and tools that do not provide export functionality and open access to the methods that produced that data visualizations. Access remains a key issue in data literacy---from both the perspective of open access to the data itself, and access to the methods that are used to produce data visualizations. 

Finally, all of the code and text data are available [here](https://github.com/aabeveridge/data-janitor) on GitHub. GitHub is a free social coding site that provides support for open development and collaborative coding. By providing access to all of the code and text data that produced the visualizations below, it will hopefully allow other scholars and teachers to modify or build upon the examples below and produce their own practical introductions to quantitative rhetorics and data visualization. Often these subjects can be intimidating for rhetoric and writing scholars who have limited training in statistics and coding, but encouraging open and collaborative development will hopefully allow new projects to draw from or build on previous ones. 

##Data Janitorial Work
In order to build a wordcloud we need to conduct a word frequency analysis. Word frequency analysis counts how many times a unique string of characters, such as "writing," appear in a corpus. Word frequency is the key quantitative component in a wordcloud. The words with the highest frequency are displayed with the largest font, and the words with the lowest frequency are displayed as the smallest font. Keep in mind that computers do not "know" what a word is. Rather, the computer merely locates unique strings of characters and counts how often they repeat. Since individual words are differentiated based on the spaces between the words (spaces between strings of characters), the word "writing," with a comma next to it is a different word than "writing" without a comma. Also, the word "Writing" with a capital "W" is a different string of characters than "writing" with a lowercase "w" because uppercase and lowercase letters are different characters. Therefore, before a word frequency analysis can be completed, the dataset needs to be "cleaned" so that "Writing" and "writing," and "writing" are all counted as three occurances of "writing"---rather than the computer counting them all separately as unique strings of characters. In order to have the three variations of "writing" counted as three occurances of the same word, punctuation is removed from the corpus, and all letters in the corpus are changed to lower case. 

Another, area of data cleaning or scrubbing that needs to occur before we can complete a frequency analysis is the removal of stop words. There is not one universal list of stop words, but a list of stop words removed from text corpora tend to be the words that do not hold semantic value for analysis. Words like "the, and, it, is, there" and so forth are the typical words removed when stop words are removed from corpora. Also, numbers are usually removed as well, unless there are numbers in a corpus that are of particular relevance to an analysis. For example, if there are years like "2015" or "1975" that are important to an analyis, then numbers may not be removed. 

The first visualization below shows what a default wordcloud would look like if a word frequency analysis was comleted without removing punctuation, numbers, and stop words. By default, R's wordcloud package changes all words to lowercase, but you can imagine how much more variation there would be in the corpus if this was not a default feature. For example, "the" and "The" would be separate words. As you can see, the character strings "===" and "====" show up in the visualization below as well. These strings of characters are used to mark section headers for Wikipedia, and since there are spaces between these strings and other strings they are represented in the wordcloud as if they are important "words." Since there are lots of section headers in the Wikipedia articles that comprise the corpus for this wordcloud, these strings of characters have a high enough frequency to be displayed in the visualization. Finally, you can see that the top two words in the corpus prior to data cleaning are "the" and "and."

<!--
![](./images/wc1.png)-->
![](./images/wc2.png)

Below is a bar graph of the top 10 word frequencies prior to completing the data janitorial work:
![](./images/freq_plot1.png)

Below is a new wordcloud visualization after the text scrubbing has been completed. Here is a list of the transformations that have occurred:

![](./images/wc3.png)

##Statistical Reasoning

###Descriptive Statistics
Provide basic descriptions of the corpus in the form of an infographic--use one of the free tools available. And share this. Often what we call "infographics" are digital rhetoric applied to descriptive statistics. 


![](./images/wc4.png)


![](./images/wc5.png)


![](./images/wc6.png)


![](./images/wc7.png)


![](./images/freq_plot2.png)


![](./images/cluster1.png)

##Conclusion
