##Methodology
XXXThis section needs a better framework---why is it important? why is it included?XXX
XXXOne possible approach is to talk about the first paragraph where access to data and methodologies needs improved. This section's discussion can help reveal what is meant by thatXXX
XXXTalk more about the MassMine grant, talk more about the NEH's digging into data challenge, and other examples where access and methods are intertwinedXXX

<a href="https://s3.amazonaws.com/easel.ly/all_easels/832990/wordcloud1/thumb.jpg"></a><img src="https://s3.amazonaws.com/easel.ly/all_easels/832990/wordcloud1/image.jpg" alt="wordcloud1" title="easel.ly" /></a>

The data visualizations produced below rely on a form of text analysis called text mining or text data mining. Text mining takes raw unstructured text and turns it into structured data that can be statistically analyzed. For this article, a corpus of text documents is constructed from the following Wikipedia pages:

- [Composition Studies](https://en.wikipedia.org/wiki/Composition_studies)
- [Computers and Writing](https://en.wikipedia.org/wiki/Computers_and_writing)
- [Digital Rhetoric](https://en.wikipedia.org/wiki/Digital_rhetoric)
- [Ecocomposition](https://en.wikipedia.org/wiki/Ecocomposition)
- [English Studies](https://en.wikipedia.org/wiki/English_studies)
- [Media Studies](https://en.wikipedia.org/wiki/Media_studies)
- [Technical Communication](https://en.wikipedia.org/wiki/Technical_communication)
- [Visual Rhetoric](https://en.wikipedia.org/wiki/Visual_rhetoric)
- [Writing about Writing](https://en.wikipedia.org/wiki/Writing_about_Writing)
- [Writing Across the Curriculum](https://en.wikipedia.org/wiki/Writing_Across_the_Curriculum)

The text contained in the articles was systematically collected with a data mining application called MassMine. MassMine is funded by the National Endowment for the Humanities, and is an open source software that supports social network data mining for academic research. After MassMine collected the text data from Wikipedia, the data scrubbing and analysis was completed with the open source programming language called R. R is designed specifically for data extraction and statistical analysis, and it is one of the best tools available for making informatics and data visualization methodologies widely accessible. 

Amanda Cox, the graphics editor for the *New York Times*, uses R to produce many of her data visualizations for the *Times*. Cox has said that R is "the greatest software on Earth," and she explains that while it is not the only tool she uses in her work, it is her preferred tool for "sketching" and exploring data when developing visual analyses. Although R can be used for more complex modeling and statistical predictions, Cox explains that its built in features remain flexible to fit many types of data and its package framework is friendly to new users who do not want to build all of their analyses from scratch. The *Data Stories* podcast has a recent interview with Cox [available here](http://datastori.es/ds-56-amanda-cox-nyt/#t=15:44.838), and *R-Bloggers* has videos of Cox talking about using R at the *Times* [available here](http://www.r-bloggers.com/amanda-cox-on-how-the-new-york-times-graphics-department-uses-r/). These are useful data literacy resources that provide real-world examples of how data analyses and visualizations are produced for a major media outlet.

All of the of the raw text data and the R code that produced the visualizations for this article are [available here](https://github.com/aabeveridge/data-janitor) on GitHub. GitHub is a free social coding site that provides support for open development and collaborative programming. Hopefully, by providing access to all of the code and text data that produced the visualizations below, it will allow other scholars and teachers to modify or build upon these examples and produce their own information rhetorics. Data literacy can be intimidating for rhetoric and writing scholars who have limited training in statistics and data visualization, but encouraging open and collaborative development will allow new projects to draw from and build on previous ones. As Mary K. Stewart argues, writing studies must continue to develop "a definition of digital literacy as a *learning outcome* that has three characterstics: multimodal composition, information, and collaboration." As GitHub is quickly becoming the largest social coding site on the web, it provides an open and collaborative framework for development that supports the learning outcomes that Steward describes. 


