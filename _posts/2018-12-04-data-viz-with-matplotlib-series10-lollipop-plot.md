---
layout:             post
title:              "Matplotlib Series 10: Lollipop plot"
date:               2018-12-04 22:27:05 +0100
comments:           true
excerpt:            >
    This blog specifies how to create/custom basic lollipop plot and vertical
    lollipop plot with matplotlib in Python and their use cases.
img_url:           /images/20181204-lollipop-header.png
img_width:         1280
img_height:        853
---

## Lollipop plot
A [lollipop plot][lollipop plot] is an hybrid between a scatter plot and a
barplot.

### When to use it ?
- Showing the relationship between a numerical variable and another numerical
or categorical variable.

### Example 1
<p align="center">
  <img alt="example dataframe"
  src="{{ site.baseurl }}/images/20181204-df.png"/>
</p>

<p align="center">
  <img alt="basic lollipop plot"
  src="{{ site.baseurl }}/images/20181204-basic-lollipop.png"/>
</p>

{% highlight python %}
import datetime
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

(markerline, stemlines, baseline) = plt.stem(df['Product'],
                                             df['Turnover'])
plt.setp(markerline, marker='*', markersize=15,
         markeredgewidth=2, color='gold')
plt.setp(stemlines, color='gold')
plt.setp(baseline, visible=False)

plt.tick_params(labelsize=12)
plt.xlabel('Product', size=12)
plt.ylabel('Turnover(k euros)', size=12)
plt.ylim(bottom=0)

plt.show()
{% endhighlight %}

This plot describes turnovers(k euros) for each product. Among eight products,
cheese's sales bring the largest turnover (123k euros), however, it seems that
consumers don't like apple that much.

### Example 2
<p align="center">
  <img alt="vertical lollipop plot"
  src="{{ site.baseurl }}/images/20181204-vertical-lollipop.png"/>
</p>

{% highlight python %}
ordered_df = df.sort_values(by='Turnover').reset_index(drop=True)
my_range = range(1, len(df.index) + 1)

plt.hlines(y=my_range, xmin=0, xmax=ordered_df['Turnover'],
           color='skyblue')
plt.plot(ordered_df['Turnover'], my_range, 'o', markersize=11)
plt.yticks(ordered_df.index+1, ordered_df['Product'])

plt.show()
{% endhighlight %}

This vertical lollipop plot describes clearly turnover for each product.
Obviously, cheese is prefered by clients.

You can click [here][notebook] to check this example in jupyter notebook.

[lollipop plot]: https://python-graph-gallery.com/lollipop-plot/
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/plotting_and_visualization/lollipop_plot.ipynb