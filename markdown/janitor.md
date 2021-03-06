##Data Janitorial Work
The dustbin of data janitorial work is not the trashcan icon on the desktop of a computer. There is nothing left to sort through and no trace of wasted data to track down. Most of the cleaning or scrubbing occurs programmatically---where programs sort through the data, selecting the items of interest, ignoring the data that does not fit a particular pattern, and then creating a new dataset that is either held temporarily in computer memory or written to disk elsewhere. It may be possible to compare newly cleaned data with the previous "raw" dataset, to see what is missing---what has been left out or what has changed---but with large datasets such an analysis could be just as difficult as completing the data janitorial work in the first place. As Scott Weingart explains, even when data access is provided and authors are transparent about methods, it may still be very difficult to retrace the process that produced a data visualization.[^1] Even in cases where data access is blocked or tracking down methods is difficult, working to understand inventive and exploratory statistical methods will nonetheless encourage critical approaches to data visualization. 

In order to build a word cloud we need to conduct a word frequency analysis. Word frequency analyses count how many times a unique string of characters, such as "writing," appear in a corpus. Word frequency is the key quantitative component in a word cloud. The words with the highest frequency are displayed with the largest font, and the words with the lowest frequency are displayed as the smallest font. Computers do not "know" what a word is. Rather, the computer merely locates unique strings of characters and counts how often they repeat. Since individual words are differentiated based on the spaces between the sets of characters, the word "writing," with a comma next to it is a different set of characters than "writing" without a comma. Also, the word "Writing" with a capital "W" is a different string of characters than "writing" with a lowercase "w" because uppercase and lowercase letters are different characters. Therefore, before a word frequency analysis can be completed, the corpus needs to be "cleaned" so that "Writing" and "writing," and "writing" are all counted as three occurrences of the same word. In order for "writing" to be counted as three separate occurrences, punctuation is removed from the corpus and all letters are changed to lowercase. 

Another, area of data cleaning or scrubbing that needs to occur before a frequency analysis can be completed is the removal of [stop words](https://en.wikipedia.org/wiki/Stop_words). There is no universal list of stop words, but lists of stop words removed from text corpora tend to be the words that do not hold semantic value for analysis. Words like "the, and, it, is, there, that" and so forth are the typical words removed during quantitative analysis of texts. Also, numbers are usually removed from corpora. Unless there are numbers that are of particular relevance to an analysis, like the years "2015" or "1975," then numbers are usually removed as well. 

This is one example of what is called data scrubbing or data janitorial work.[^2] While much attention is given to beautiful data visualizations and wonderfully designed infographic media, the "art" of data science is the systematic cleaning and reducing of a dataset so that meaningful summaries and descriptions may be produced without turning the dataset into something that is no longer representative of its original unstructured content. There is no universal or always-correct methodology for how data janitorial work should proceed. Data scrubbing is always a relative triangulation among a particular dataset, a project's goals, and the analyses and visualizations that a project eventually produces. This is the most difficult step to understand in data literacy because for many scholars the term "data" is generally understood as something synonymous with a spreadsheet. Data is often perceived as the columns of numbers or words that appear in a basic grid format. While spreadsheet data is no doubt an important form of data, once data has been transformed to a grid format many of the important data scrubbing activities have likely already occurred. Since anything can become data, one of the primary questions statistical rhetoric must ask in data literacy is how was a dataset transformed from its "raw" form into something that may be categorized and counted? The transition from unstructured data to spreadsheet (or some other structured form) is often the site where exploratory analysis and inventive methods are employed. Certainly, this is not the only site of exploration and invention in statistical rhetoric, but data scrubbing is usually the most powerful and the most overlooked step in making a dataset meaningful. 

Figure 1 below shows what a default word cloud would look like if a word frequency analysis was completed without removing punctuation, numbers, and stop words. By default, R's word cloud package changes all words to lowercase, but you can imagine how much more variation (what is often called [noisy data](https://en.wikipedia.org/wiki/Noisy_text_analytics)) there would be in the corpus if this was not a default feature. For example, "the" and "The" would be displayed as separate words. Furthermore, the character strings "===" and "====" show up in the visualization below as well. These strings of characters are used to mark section headers for Wikipedia. Because there are spaces between these strings, they are represented in the word cloud as if they are important words in the corpus. Furthermore, because there are a high number of section headers in the Wikipedia articles, these strings of characters have a word frequency large enough to appear in the visualization. 

![](./images/wc2.jpg)
<center>
  <em><strong>Figure 1</strong></em>
</center>

In Figure 1, we can immediately see one consequence of not cleaning the data: "the" and "and" show up as the largest words in the visualization. By looking closely, there are many variations of "writing" that appear in the visualization with punctuations attached to the string of letters, but "writing" without any punctuation does still show up as the third most frequent term. The bar graph in Figure 2 below displays the top 10 terms prior to scrubbing the Wikipedia corpus:

![](./images/freq_plot1.jpg)
<center>
  <em><strong>Figure 2</strong></em>
</center>

Figures 3 and 4 below show the result of scrubbing the Wikipedia corpus. The new bar graph and word cloud visualizations have changed drastically as a result of the data janitorial work. Here is a list of the transformations that have occurred to turn the raw unstructured data into the word cloud shown below:

- Punctuation removed
- Numbers removed
- Entire corpus changed to lowercase
- Stopwords removed

![](./images/freq_plot2.jpg)
<center>
  <em><strong>Figure 3</strong></em>
</center>
<hr>
![](./images/wc3.jpg)
<center>
  <em><strong>Figure 4</strong></em>
</center>

As Figures 3 and 4 display, data janitorial work has a profound effect on what the word cloud may say about the text data contained in the Wikipedia corpus. The changes in the visualization were made without making any adjustments to the default visual behavior of the word cloud, but instead the underlying dataset was cleaned and sorted in order to prioritize words more relevant to the type of analysis conducted. If the examples contained in this article were focused on a different type of data, then an altogether different set of methods for scrubbing the data may have been more applicable to cleaning the project data. In manual data collection---where humans collect data and place them categorically in a spreadsheet or a database---data scrubbing happens at the moment the human makes a categorical decision about various data in their project. For example, in a research project I am currently conducting with a colleague, we collect images of local graffiti art by taking photographs of the art and categorizing them rhetorically. The act of deciding which column or category would best fit each photo is a type of data janitorial work---where unstructured collections of photos are placed into separate categories and provided with additional meta data. There is no universal methodology of data janitorial work, and often this exploratory and inventive aspect of data analysis is not fully disclosed or made available along with data visualizations. However, limitations in access do no reduce the role that data scrubbing plays in data visualization, and working to better understand this overlooked aspect of data analysis can further influence an inventive approach to information rhetorics. 

<a href="stats.html" class="myButton">Next Page</a>

[^1]: <http://www.scottbot.net/HIAL/?p=41397>
[^2]: The *New York Times* has a great article explaining how so much of data analysis is bottlenecked by data janitorial concerns. Article is [available here](http://www.nytimes.com/2014/08/18/technology/for-big-data-scientists-hurdle-to-insights-is-janitor-work.html)
