---
layout:             post
title:              "Matplotlib Series 10: Lollipop plot"
date:               2018-12-04 22:27:05 +0100
last_modified_at:   2018-12-18 22:34:22 +0100
comments:           true
excerpt:            >
    This blog specifies how to create/custom basic lollipop plot and vertical
    lollipop plot with matplotlib in Python and their use cases.
img_url:           /images/20181204-lollipop-header.png
img_width:         1280
img_height:        853
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
> * Matplotlib Series 10: Lollipop plot (this blog)
> * [Matplotlib Series 11: Histogram][series11]

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
[series1]: https://jingwen-z.github.io/data-viz-with-matplotlib-series1-bar-chart/
[series2]: https://jingwen-z.github.io/data-viz-with-matplotlib-series2-line-chart/
[series3]: https://jingwen-z.github.io/data-viz-with-matplotlib-series3-pie-chart/
[series4]: https://jingwen-z.github.io/data-viz-with-matplotlib-series4-scatter-plot/
[series5]: https://jingwen-z.github.io/data-viz-with-matplotlib-series5-treemap/
[series6]: https://jingwen-z.github.io/data-viz-with-matplotlib-series6-venn-diagram/
[series7]: https://jingwen-z.github.io/data-viz-with-matplotlib-series7-area-chart/
[series8]: https://jingwen-z.github.io/data-viz-with-matplotlib-series8-radar-chart/
[series9]: https://jingwen-z.github.io/data-viz-with-matplotlib-series9-word-cloud/
[series11]: https://jingwen-z.github.io/data-viz-with-matplotlib-series11-histogram/