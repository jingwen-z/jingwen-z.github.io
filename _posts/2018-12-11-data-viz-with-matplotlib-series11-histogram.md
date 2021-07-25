---
layout:             post
title:              "Matplotlib Series 11: Histogram"
lang:        en
date:               2018-12-11 22:16:43 +0100
last_modified_at:   2019-07-19 21:57:10 +0200
tags:               [matplotlib, visualisation]
permalink:         /data-viz-with-matplotlib-series11-histogram/
comments:           true
excerpt:            >
    This blog specifies how to create/custom basic histogram and cumulative
    histogram with matplotlib in Python and their use cases.
cover:             /images/20181211-histogram-header.png
img_width:         1280
img_height:        853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    src: /images/20180526-pexels-steve-johnson.jpg
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
> * [Matplotlib Series 9: Word cloud][series9]
> * [Matplotlib Series 10: Lollipop plot][series10]
> * Matplotlib Series 11: Histogram (this blog)

## Histogram
A [histogram][histogram] is an accurate representation of the distribution of
numerical data. It differs from a bar graph, in the sense that a bar graph
relates two variables, but a histogram relates only one. To construct a
histogram, the first step is to "bin" (or "bucket") the range of values-that
is, divide the entire range of values into a series of intervals—and then count
how many values fall into each interval. The bins are usually specified as
consecutive, non-overlapping intervals of a variable. The bins (intervals) must
be adjacent, and are often (but are not required to be) of equal size.

### When to use it ?
- Estimating the probability distribution of a continuous variable
(quantitative variable).
- Organizing large amounts of data, and producing a visualization quickly,
using a single dimension.

### Dataframe
<p align="center">
  <img alt="example dataframe"
  src="{{ site.baseurl }}/images/20181211-df.png"/>
</p>

### Basic histogram
<p align="center">
  <img alt="basic histogram"
  src="{{ site.baseurl }}/images/20181211-basic-histogram.png"/>
</p>

{% highlight python %}
import datetime
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

plt.hist(df['Volumes'], bins=6, density=True)
plt.xlim(left=0, right=21)
plt.xticks(np.arange(21))

plt.grid(alpha=0.2)
plt.show()
{% endhighlight %}

This plot describes that among 1930 tickets, 11% tickets contain less than 5
products; less than 1% tickets contain less than 21 products but more than 16
products. However, if we want to the percentage of tickets that contains less
than or egale to 10 products, this basic histogram cannot satisfy our need in
one second. In the following cumulative histogram, we can find the answer.

### Cumulative histogram
<p align="center">
  <img alt="cumulative histogram"
  src="{{ site.baseurl }}/images/20181211-cumulative-histogram.png"/>
</p>

{% highlight python %}
plt.hist(df['Volumes'], bins=6, density=True, cumulative=True,
         histtype='step', linewidth=2)

plt.show()
{% endhighlight %}

Considering the same question as above: what the percentage of tickets that
contain less than or egale to 10 products? According to this cumulative
histogram, the answer is obvious: nearly 85% tickets contain less than or egale
to 10 products.

You can click [here][notebook] to check this example in jupyter notebook.

## Reference
- Steve Johnson, "painting wallpaper", _www.pexels.com_. [Online]. Available: [https://www.pexels.com/photo/painting-wallpaper-1070527/][backgroud-img]

[histogram]: https://en.wikipedia.org/wiki/Histogram
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/python_for_data_analysis/plotting_and_visualization/histogram.ipynb
[series1]: https://jingwen-z.github.io/data-viz-with-matplotlib-series1-bar-chart/
[series2]: https://jingwen-z.github.io/data-viz-with-matplotlib-series2-line-chart/
[series3]: https://jingwen-z.github.io/data-viz-with-matplotlib-series3-pie-chart/
[series4]: https://jingwen-z.github.io/data-viz-with-matplotlib-series4-scatter-plot/
[series5]: https://jingwen-z.github.io/data-viz-with-matplotlib-series5-treemap/
[series6]: https://jingwen-z.github.io/data-viz-with-matplotlib-series6-venn-diagram/
[series7]: https://jingwen-z.github.io/data-viz-with-matplotlib-series7-area-chart/
[series8]: https://jingwen-z.github.io/data-viz-with-matplotlib-series8-radar-chart/
[series9]: https://jingwen-z.github.io/data-viz-with-matplotlib-series9-word-cloud/
[series10]: https://jingwen-z.github.io/data-viz-with-matplotlib-series10-lollipop-plot/
[backgroud-img]: https://www.pexels.com/photo/painting-wallpaper-1070527/
