---
layout:             post
title:              "Matplotlib Series 2: Line chart"
lang:               en
date:               2018-09-16 16:58:54 +0200
last_modified_at:   2019-06-21 09:28:10 +0200
series:             [data-visualisation]
tags:               [matplotlib, visualisation]
permalink:         /data-viz-with-matplotlib-series2-line-chart/
comments:           true
excerpt:            >
    This blog specifies how to create line chart with single line, line chart
    with multiple lines and add values' label on the chart with matplotlib in
    Python.
cover:             /images/20180916-line-header.png
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
> * Matplotlib Series 2: Line chart (this blog)
> * [Matplotlib Series 3: Pie chart][series3]
> * [Matplotlib Series 4: Scatter plot][series4]
> * [Matplotlib Series 5: Treemap][series5]
> * [Matplotlib Series 6: Venn diagram][series6]
> * [Matplotlib Series 7: Area chart][series7]
> * [Matplotlib Series 8: Radar chart][series8]
> * [Matplotlib Series 9: Word cloud][series9]
> * [Matplotlib Series 10: Lollipop plot][series10]
> * [Matplotlib Series 11: Histogram][series11]

## Line chart
A [line chart][line chart] or line graph is a type of chart which displays
information as a series of data points called 'markers' connected by straight
line segments. A line chart is often used to visualize a trend in data over
intervals of time – a time series – thus the line is often drawn chronologically.

### When to use it ?
- Track changes over time
- x-axis displays continuous variables
- Y-axis displays measurement

### Example
<p align="center">
  <img alt="line plot"
  src="{{ site.baseurl }}/images/20180916-line-chart.png"/>
</p>

{% highlight python %}
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

turnover = [2, 7, 14, 17, 20, 27, 30, 38, 25, 18, 6, 1]
plt.plot(np.arange(12), turnover, marker='.')

plt.tick_params(labelsize=12)
plt.xticks(np.arange(12), np.arange(1,13))
plt.xlabel('Month', size=12)
plt.ylabel('Turnover (K euros) of ice-cream', size=12)
plt.ylim(bottom=0)

plt.show()
{% endhighlight %}

Suppose that the plot above describes the turnover(k euros) of ice-cream's sales
during one year. According to the plot, we can clearly find that the sales
reach a peak in summer, then fall from autumn to winter, which is logical.

## Line chart with multiple lines
### When to use it ?
Compare different subjects during the same period.

### Example
<p align="center">
  <img alt="line plot"
  src="{{ site.baseurl }}/images/20180916-multi-line-chart.png"/>
</p>

{% highlight python %}
year_n_1 = [1.5, 3, 10, 13, 22, 36, 30, 33, 24.5, 15, 6.5, 1.2]
year_n = [2, 7, 14, 17, 20, 27, 30, 38, 25, 18, 6, 1]

plt.plot(np.arange(12), year_n_1, marker='.', color='#1f77b4',
         label='year N-1', linestyle='--', alpha=0.5)
plt.plot(np.arange(12), year_n, marker='.', color='#1f77b4',
         label='year N')
plt.legend()

plt.show()
{% endhighlight %}

As an extension of the first plot, the second one compares two-year turnover
together. The peak for both year is in the summer, for year N, the peak is in
August; however, the peak is reached in June in the year N-1, which is caused
by the heatwave in June.

## Add values' label on the plot
We find that there is no parameter for add values' labels by plt.plot(), but we
can add them with text() function.

<p align="center">
  <img alt="line plot"
  src="{{ site.baseurl }}/images/20180916-add-values-linechart.png"/>
</p>

{% highlight python %}
def autolabel_simple_lineplot_mille_wk(df, col_name, lines_color):
    for i, val in enumerate(df[col_name]):
        plt.text(df.index[i]-0.15,
                 val+1.7,
                 '%1.0f€' % val,
                 color=lines_color,
                 rotation=10,
                 fontsize=11)
{% endhighlight %}

{% highlight python %}
df = pd.DataFrame({'turnover':[2, 7, 14, 17, 20, 27,
                               30, 38, 25, 18, 6, 1]})

plt.plot(df.index, df.turnover, marker='.')
autolabel_simple_lineplot_mille_wk(df, 'turnover', '#1f77b4')

plt.show()
{% endhighlight %}

You can click [here][notebook] to check this example in jupyter notebook.

## Reference
- Steve Johnson, "painting wallpaper", _www.pexels.com_. [Online]. Available: [https://www.pexels.com/photo/painting-wallpaper-1070527/][backgroud-img]

[line chart]: https://en.wikipedia.org/wiki/Line_chart
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/python_for_data_analysis/plotting_and_visualization/line_chart.ipynb
[series1]: https://jingwen-z.github.io/data-viz-with-matplotlib-series1-bar-chart/
[series3]: https://jingwen-z.github.io/data-viz-with-matplotlib-series3-pie-chart/
[series4]: https://jingwen-z.github.io/data-viz-with-matplotlib-series4-scatter-plot/
[series5]: https://jingwen-z.github.io/data-viz-with-matplotlib-series5-treemap/
[series6]: https://jingwen-z.github.io/data-viz-with-matplotlib-series6-venn-diagram/
[series7]: https://jingwen-z.github.io/data-viz-with-matplotlib-series7-area-chart/
[series8]: https://jingwen-z.github.io/data-viz-with-matplotlib-series8-radar-chart/
[series9]: https://jingwen-z.github.io/data-viz-with-matplotlib-series9-word-cloud/
[series10]: https://jingwen-z.github.io/data-viz-with-matplotlib-series10-lollipop-plot/
[series11]: https://jingwen-z.github.io/data-viz-with-matplotlib-series11-histogram/
[backgroud-img]: https://www.pexels.com/photo/painting-wallpaper-1070527/
