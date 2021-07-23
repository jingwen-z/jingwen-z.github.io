---
layout:             post
title:              "Matplotlib Series 1: Bar chart"
lang:        en
date:               2018-06-14 21:33:25 +0200
last_modified_at:   2019-06-21 09:24:12 +0200
tags:               [matplotlib, visualisation]
permalink:         /data-viz-with-matplotlib-series1-bar-chart/
comments:           true
excerpt:            >
    This blog specifies how to create simple bar chart, grouped bar chart and
    stacked bar chart with matplotlib in Python.
cover:             /images/20180614-bar-header.png
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
> * Matplotlib Series 1: Bar chart (this blog)
> * [Matplotlib Series 2: Line chart][series2]
> * [Matplotlib Series 3: Pie chart][series3]
> * [Matplotlib Series 4: Scatter plot][series4]
> * [Matplotlib Series 5: Treemap][series5]
> * [Matplotlib Series 6: Venn diagram][series6]
> * [Matplotlib Series 7: Area chart][series7]
> * [Matplotlib Series 8: Radar chart][series8]
> * [Matplotlib Series 9: Word cloud][series9]
> * [Matplotlib Series 10: Lollipop plot][series10]
> * [Matplotlib Series 11: Histogram][series11]

## Bar chart
A [bar chart][bar chart] or bar graph is a chart or graph that presents
categorical data with rectangular bars with heights or lengths proportional to
the values that they represent. The bars can be plotted vertically or
horizontally.

### When to use it ?
- Compare **categorical data**.
- Comparisons among **discrete categories**.
- One axis of the chart shows the specific categories being compared, and the
other axis represents a measured value.

### Example
<p align="center">
  <img alt="one plot"
  src="{{ site.baseurl }}/images/20180614-bar-chart.png"/>
</p>

{% highlight python %}
import matplotlib.pyplot as plt
import numpy as np

x = np.arange(4)
turnover_k_euros = [12, 34, 31, 20]

plt.bar(x, turnover_k_euros, width=0.4)
plt.xticks(np.arange(4), ('apple', 'banana', 'cherry', 'durian'))
plt.xlabel('Product')
plt.ylabel('Turnover (K euros)')

plt.show()
{% endhighlight %}

This plot describes turnovers(k euros) for each fruit. Among four fruits,
bananas' sales bring the largest turnover (34k euros), however, it seems that
consumers don't like apple that much.

## Grouped bar chart
Bar graphs can also be used for more complex comparisons of data with grouped
bar charts and stacked bar charts. In a grouped bar chart, for each categorical
group there are two or more bars. These bars are color-coded to represent a
particular grouping.

### When to use it ?
To represent and compare **different categories of two or more groups**.

### Example
<p align="center">
  <img alt="one plot"
  src="{{ site.baseurl }}/images/20180614-grp-bar-chart.png"/>
</p>

{% highlight python %}
year_n_1 = (20, 35, 30, 35, 27, 27, 33)
year_n = (25, 39, 45, 25, 21, 29, 36)

ind = np.arange(7)
width = 0.35

fig, ax = plt.subplots(figsize=(9, 6))
rects1 = ax.bar(ind - width / 2, year_n_1,
                width, color='#1f77b4', alpha=0.5)
rects2 = ax.bar(ind + width / 2, year_n,
                width, color='#1f77b4')
plt.legend((rects1[0], rects2[0]), ('year N-1', 'year N'))

plt.show()
{% endhighlight %}

This plot compares monthly turnover of year N to year N-1. Except for April and
May, monthly turnover in year N is higher than year N-1. In the case of
retailing, this kind of changes can be explained like the strategy of year N
works well, or new products attract clients, or new stores of year N contribute
to the turnover.

## Stacked bar chart
Alternatively, a stacked bar chart could be used. The stacked bar chart stacks
bars that represent different groups on top of each other. The height of the
resulting bar shows the combined result of the groups.

### When to use it ?
- To compare the **totals** and **one part of the totals**.
- If the total of your parts is crucial, stacked column chart can work well for
dates.

### Example
<p align="center">
  <img alt="one plot"
  src="{{ site.baseurl }}/images/20180614-stacked-bar-chart.png"/>
</p>

{% highlight python %}
cheese = (20, 35, 30, 35, 27, 37, 20)
non_cheese = (25, 32, 34, 20, 25, 17, 29)

rect1 = plt.bar(np.arange(7), cheese,
                width=0.5, color='orangered')
rect2 = plt.bar(np.arange(7), non_cheese,
                bottom=cheese, width=0.5, color='#1f77b4')

plt.show()
{% endhighlight %}

This plot presents weekdays' turnover with cheese and non-cheese products' sales.
Globally, the sales of cheese products are much more than others.

## Vertical bar chart
The horizontal bar chart is the same as a vertical bar chart only the x-axis and
y-axis are switched.

### When to use it ?
- You need more room to fit text labels for categorical variables.
- When you work with a big dataset, horizontal bar charts tend to work better in
a narrow layout such as mobile view.

### Example
<p align="center">
  <img alt="vertical bar chart"
  src="{{ site.baseurl }}/images/20180614-vertical-bar-chart.png"/>
</p>

{% highlight python %}
df = pd.DataFrame({'product': ['grill', 'cheese', 'red wine', 'salade',
                               'chicken', 'sushi', 'pizza', 'soup'],
                   'turnover': [846, 739, 639, 593, 572, 493, 428, 293]},
                  columns=['product', 'turnover'])
df.sort_values('turnover', inplace=True)
df.reset_index(inplace=True, drop=True)

plt.barh(np.arange(len(df['product'])), df['turnover'], align='center')
plt.yticks(np.arange(len(df['product'])), df['product'])
plt.tick_params(labelsize=12)
plt.xlabel('Turnover(k euros)', fontdict={'fontsize': 13})
plt.ylabel('Product', fontdict={'fontsize': 13})

plt.show()
{% endhighlight %}

This vertical bar chart describes clearly turnover for each product. Obviously,
grill product is prefered by clients.

You can click [here][notebook] to check this example in jupyter notebook.

## Reference
- Steve Johnson, "painting wallpaper", _www.pexels.com_. [Online]. Available: [https://www.pexels.com/photo/painting-wallpaper-1070527/][backgroud-img]

[bar chart]: https://en.wikipedia.org/wiki/Bar_chart
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/python_for_data_analysis/plotting_and_visualization/bar_chart.ipynb
[series2]: https://jingwen-z.github.io/data-viz-with-matplotlib-series2-line-chart/
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
