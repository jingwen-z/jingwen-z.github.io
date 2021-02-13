---
layout:             post
title:              "Matplotlib Series 9: Word cloud"
date:               2018-11-27 22:27:53 +0100
last_modified_at:   2019-07-19 21:56:18 +0200
tags:               [matplotlib, visualisation]
comments:           true
excerpt:            >
    This blog specifies how to create basic word cloud, word cloud in specific
    shape with matplotlib in Python and their use cases.
cover:             /images/20181127-basic-word-cloud.png
img_width:         1280
img_height:        853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

> This blog is part of Matplotlib Series:
> * [Matplotlib Series 1: Bar chart][series1]
> * [Matplotlib Series 2: Line chart][series2]
> * [Matplotlib Series 3: Pie chart][series3]
> * [Matplotlib Series 4: Scatter plot][series4]
> * [Matplotlib Series 5: Treemap][series5]
> * [Matplotlib Series 6: Venn diagram][series6]
> * [Matplotlib Series 7: Area chart][series7]
> * [Matplotlib Series 8: Radar chart][series8]
> * Matplotlib Series 9: Word cloud (this blog)
> * [Matplotlib Series 10: Lollipop plot][series10]
> * [Matplotlib Series 11: Histogram][series11]

## Word cloud
A [word cloud][word cloud] (tag cloud, or weighted list in visual design) is a
novelty visual representation of text data. Tags are usually single words, and
the importance of each tag is shown with font size or color. This format is
useful for quickly perceiving the most prominent terms and for locating a term
alphabetically to determine its relative prominence.

### When to use it ?
- Depicting keyword metadata (tags) on websites.
- Delighting and provide emotional connection.

### Example 1: Basic word cloud
<p align="center">
  <img alt="basic word cloud"
  src="{{ site.baseurl }}/images/20181127-basic-word-cloud.png"/>
</p>

{% highlight python %}
from wordcloud import WordCloud
import matplotlib.pyplot as plt
from PIL import Image
import numpy as np

text = ('Data science is an interdisciplinary field that uses scientific
methods, processes, algorithms and systems to extract knowledge and insights
from data in various forms, both structured and unstructured, similar to data
mining. Data science is a concept to unify statistics, data analysis, machine
learning and their related methods in order to understand and analyze actual
phenomena with data. It employs techniques and theories drawn from many fields
within the context of mathematics, statistics, information science, and
computer science. Turing award winner Jim Gray imagined data science as a
fourth paradigm of science (empirical, theoretical, computational and now
data-driven) and asserted that everything about science is changing because of
the impact of information technology and the data deluge. In 2012, when Harvard
Business Review called it The Sexiest Job of the 21st Century, the term data
science became a buzzword. It is now often used interchangeably with earlier
concepts like business analytics, business intelligence, predictive modeling,
and statistics. Even the suggestion that data science is sexy was paraphrasing
Hans Rosling, featured in a 2011 BBC documentary with the quote, Statistics is
now the sexiest subject around. Nate Silver referred to data science as a sexed
up term for statistics. In many cases, earlier approaches and solutions are now
simply rebranded as data science to be more attractive, which can cause the
term to become dilute beyond usefulness. While many university programs now
offer a data science degree, there exists no consensus on a definition or
suitable curriculum contents. To its discredit, however, many data-science and
big-data projects fail to deliver useful results, often as a result of poor
management and utilization of resources')

wordcloud = WordCloud(width=1280, height=853, margin=0,
                      colormap='Blues').generate(text)

plt.imshow(wordcloud, interpolation='bilinear')
plt.axis('off')
plt.margins(x=0, y=0)
plt.show()
{% endhighlight %}

According to this word cloud, we can globally know that data science employs
techniques and theories drawn from many fields within the context of
mathematics, statistics, information science, and computer science. It can be
used for business analysis, and called "The Sexiest Job of the 21st Century".

### Example 2: Word cloud with specific shape
<p align="center">
  <img alt="word cloud in specific shape"
  src="{{ site.baseurl }}/images/20181127-shaped-word-cloud.png"/>
</p>

{% highlight python %}
computer_mask = np.array(Image.open('computer_shape.png'))
wordcloud_shape = WordCloud(width=1280, height=853, margin=0,
                            colormap='BuPu',
                            mask=computer_mask).generate(text)

plt.imshow(wordcloud_shape, interpolation="bilinear")
plt.axis('off')
plt.margins(x=0, y=0)
plt.show()
{% endhighlight %}

You can click [here][notebook] to check this example in jupyter notebook.

## Reference
- [Data Science(Wikipedia)][r1]
- [Image computer apple mac][r2]

[word cloud]: https://en.wikipedia.org/wiki/Tag_cloud
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/python_for_data_analysis/plotting_and_visualization/word_cloud.ipynb
[r1]: https://en.wikipedia.org/wiki/Data_science
[r2]: https://pixabay.com/en/imac-computer-apple-mac-calculator-1999640/
[series1]: https://jingwen-z.github.io/data-viz-with-matplotlib-series1-bar-chart/
[series2]: https://jingwen-z.github.io/data-viz-with-matplotlib-series2-line-chart/
[series3]: https://jingwen-z.github.io/data-viz-with-matplotlib-series3-pie-chart/
[series4]: https://jingwen-z.github.io/data-viz-with-matplotlib-series4-scatter-plot/
[series5]: https://jingwen-z.github.io/data-viz-with-matplotlib-series5-treemap/
[series6]: https://jingwen-z.github.io/data-viz-with-matplotlib-series6-venn-diagram/
[series7]: https://jingwen-z.github.io/data-viz-with-matplotlib-series7-area-chart/
[series8]: https://jingwen-z.github.io/data-viz-with-matplotlib-series8-radar-chart/
[series10]: https://jingwen-z.github.io/data-viz-with-matplotlib-series10-lollipop-plot/
[series11]: https://jingwen-z.github.io/data-viz-with-matplotlib-series11-histogram/
