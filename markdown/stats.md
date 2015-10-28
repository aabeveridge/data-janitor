##Statistical Reasoning and Information Rhetorics
This section will consider word layout and color assignment for wordcloud visualizations. While these two aspects of a wordcloud appear to be designed mostly based on appealing visual stylistics, this section will explain how these components may also fit within an inventive framework for information rhetorics and statistical reasoning. As the introduction argues, it is tempting to understand data visualization and information rhetorics based on traditional differences between rhetoric and statistics---where statistics provides the "content" analysis and quantitative "substance," and where rhetoric is merely employed near the end of the process to make the visuals appealing, artistic, or persuasive. In order to move past the simplistic fact/deception binary of information rhetorics, we need more complex investigations that show data visualization to be *both* rhetorical *and* statistical all the way down. From the choice of which data to collect or access, to the technologies and methodologies selected for processing and scrubbing the data, and finally, to the analyses and visualizations used to investigate or summarize the data---when *choice* is involved at any point in the process, rhetorical frameworks (whether explicitly acknowledged by statisticians or not) are an integral part of making data meaningful.

###Word Layout
In the [Data Janitor](http://aaronbeveridge.com/data-janitor/janitor.html) section, the words in the wordclouds were laid out according to their frequencies. The words with the highest frequency were placed in the center, and then the words were arranged in circular fashion outward from center as their frequency reduces. While this layout makes sense, it arguably makes it more difficult to see details and contrast among ranges of word frequency. While it may be counterintuitive, a random word layout provides an alternative perspective that improves upon these issues. The two images below show the difference between a frequency-based layout and random word layout. The first image displays the the center-out frequency layout, and the second image displays the words at random with 10% of the words turned 90 degrees. 

![](./images/wc3.png)
![](./images/wc4.png)

By changing the logic of how the words are laid out in the wordcloud, it becomes easier to visually analyze and compare word frequencies. The layout is randomized, but the size of the word font remains categorized according to frequency. This allows the visualization to display more contrast among the words without making the visual altogether useless. Also, by turning a portion of the words 90 degrees, this creates greater contrast and variation in the visual. There is not space in this article to discuss the importance of [randomization](https://en.wikipedia.org/wiki/Randomization) for statistical reasoning and data analysis, but it is important to note that the change from a frequency ordered layout to a random one seems counterintuitive until it is tested and compared. 

![](./images/cloud1.jpg)

Finally, it is important to note that even when wordclouds layouts are more artistic or focused on visual stylistics, statistical properties remain. Even though the shape of the wordcloud above was designed to look like a puffy cloud, font size remains categorized according to word frequency and data scrubbing was still needed to emphasize the semantically relevant words in the text.[^1] 

###Color Assignment
The colors for the images below are assigned to words systematically using the [RColorBrewer](https://cran.r-project.org/web/packages/RColorBrewer/RColorBrewer.pdf) package in R. This package is based on the work of [Cynthia Brewer](http://www.geog.psu.edu/people/brewer-cynthia)---a geography professor at Penn State Univerisity whose work focuses on cartographic design. While mapping and cartography may not seem relevant to word cloud visuals, the visual problems invoving color assignments in mapping and topographic representation are relevant to many types of complex visualizations where "understanding how to manipulate the three perceptual dimensions of colour (hue, saturation and lightness) is required to create attractive and logical colour sequences" (27). 

[ColorBrewer](http://colorbrewer.org) has 35 color scheme "sets" divided into three groups: qualitative, sequential, and diverging. In their publication that explains and justifies the rationale and development of the ColorBrewer tool, Cynthia Brewer and Mark Harrower describe the three groups of color schemes as follows:

**Qualitative**

> Qualitative colour schemes rely primarily on differences in hue to create a colour scheme 
> that does not imply order, merely difference in kind. Since there is no conceptual 
> ranking in nominal data it is inappropriate to imply order when depicting these data with 
> colour (for example, by using a light-to-dark single-hue sequence). Qualitative schemes 
> work best when hue is varied and saturation and lightness are kept or nearly constant. We 
> do not recommend arbitrarily using strong ‘neon’ colours (i.e. high saturation) and 
> pastel colours (i.e. light and low saturation) in the same qualitative colour scheme 
> because these variations in saturation might imply order.

**Sequential**

> Sequential colour schemes imply order and are suited to representing data that ranges 
> from low-to-high values either on an ordinal scale (e.g. cold, warm, hot) or on a 
> numerical scale (e.g. age classes of 0–9, 10–19, 20–29, etc.). Lightness steps dominate 
> the look of these schemes, usually with light colours for low data values and dark 
> colours for high values. ‘Dark equals more’ is a standard cartographic convention. 
> Sequential schemes can be either single hue (e.g. same blue, with different lightness and 
> saturation levels) or multi-hued (e.g. light yellow through dark green). ColorBrewer 
> includes 12 multi-hued sequential schemes and 6 single-hued schemes.

**Diverging**

> Diverging colour schemes should be used when a critical data class or break point needs 
> to be emphasized. The break or class in the middle of the sequence is emphasized by a hue 
> and lightness change and should represent a critical value in the data such as the mean, 
> median or zero. For example, a choropleth map of poverty rates might be designed to 
> emphasize the national rate (midway through the range of rates shown on the map) so that 
> places above and below the national rate are shown with different hues and thus have 
> similar visual emphasis. Diverging schemes are always multi-hue sequences and, because of 
> the way in which lightness is varied, do not make good black and white photocopies or 
> prints (which only capture differences in lightness).

While the diverging color scheme clearly is not relevant to wordclouds--since it emphasizes the "break" or "middle" range of the data. The wordclouds below consider and compare the qualitative and sequential color schemes. 

##END OF DRAFT##

While word color selection could also be assigned at random, but too much randomization would begin to make the visualization meaningless. Therefore, colors can be assigned to levels of frequency in the same way that font size is determined. The visualization below retains the random layout, and colors are assigned from red to blue---with dark red assigned to the most frequent word, light red assigned to less frequeny words, and blue assigned to the least frequent words. The logic of this color designation follows the standard "red is hot" and "blue is cold" color use. However, as the image below displays, the common color hot/cold color assignment may not be the best choice for a wordcloud. 

![](./images/wc5.png)

As the image above shows, the light blue and light red colors---meant to display a wider range of frequencies---actually serves to emphasize only the dark red and dark blue colors. However, as the next image shows, if rather than using a range between only two colors, a greater variation of dark colors are used, the differences in frequency variation and contrast are easer to percieve. 

![](./images/wc6.png)

Now that colors have been assigned, the word layout can be re-explored. In the image below, the words are once again laid out according to their frequency. When comparing the two images, there are now advantages to both layout approaches. The randomized image above may still have a slight edge with visualing contrast among the variations in frequency, but the new image below is better at displaying which words fit within a similar frequency range. For example, it is much easier to see in the new image below that "composition," "media," "studies," and "rhetoric" are in the same frequency range. 

![](./images/wc7.png)

Finally, as mentioned earlier in this section, the question of whether a wordcloud is an appropriate visualization for a particular type of analysis must be considered. For example, in the random wordcloud above it would be a mistake to draw conclusions based on how close to one another words appear in the wordcloud. There are likely countless statistical approaches for determining the relationships among data. One such visualization for a corpus of text is a cluster analysis that looks at how words cluster across all the documents. In the graph below, the nodes are words and the lines draws between them are determined by how often the two words appear together in each of the documents. If two words appear together more than 25% of the time, then a line is draw between them. Frequency analysis only provides a count of which words appear the most often in the corpus, but a cluster analysis allows for a determination of which less-frequent words are important to the corpus and how they may closely associate with other words. 

![](./images/cluster1.png)



[^1]: The "puffy cloud" visual was created with [Tagul](https://tagul.com/) using the words from a draft of this section as the text data.
