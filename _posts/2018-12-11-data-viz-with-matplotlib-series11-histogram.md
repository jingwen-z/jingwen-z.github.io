---
layout:             post
title:              "Matplotlib Series 11: Histogram"
date:               2018-12-11 22:16:43 +0100
comments:           true
excerpt:            >
    This blog specifies how to create/custom basic histogram and cumulative
    histogram with matplotlib in Python and their use cases.
img_url:           /images/20181211-histogram-header.png
img_width:         1280
img_height:        853
---

## Histogram
A [histogram][histogram] is an accurate representation of the distribution of
numerical data. It differs from a bar graph, in the sense that a bar graph
relates two variables, but a histogram relates only one. To construct a
histogram, the first step is to "bin" (or "bucket") the range of values-that
is, divide the entire range of values into a series of intervals—and then count how many values fall into each interval. The bins are usually specified as consecutive, non-overlapping intervals of a variable. The bins (intervals) must be adjacent, and are often (but are not required to be) of equal size.

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

[histogram]: https://en.wikipedia.org/wiki/Histogram
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/plotting_and_visualization/histogram.ipynb