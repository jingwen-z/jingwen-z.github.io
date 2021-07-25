---
layout:             post
title:              "Matplotlib Series 4: Scatter plot"
lang:        en
date:               "2018-10-25 21:06:53 +0200"
last_modified_at:   2019-06-12 22:19:21 +0200
tags:               [matplotlib, visualisation]
permalink:         /data-viz-with-matplotlib-series4-scatter-plot/
comments:           true
excerpt:            >
    This blog specifies how to create scatter plot, connected scatter plot
    and bubble chart with matplotlib in Python.
cover:             /images/20181025-scatter-header.png
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
> * Matplotlib Series 4: Scatter plot (this blog)
> * [Matplotlib Series 5: Treemap][series5]
> * [Matplotlib Series 6: Venn diagram][series6]
> * [Matplotlib Series 7: Area chart][series7]
> * [Matplotlib Series 8: Radar chart][series8]
> * [Matplotlib Series 9: Word cloud][series9]
> * [Matplotlib Series 10: Lollipop plot][series10]
> * [Matplotlib Series 11: Histogram][series11]

## Scatter plot
A [scatter plot][scatter plot] (also called a scatter graph, scatter chart,
scattergram, or scatter diagram) is a type of plot or mathematical diagram
using Cartesian coordinates to display values for typically two variables for
a set of data.

### When to use it ?
Scatter plots are used when you want to show the **relationship between two
variables**. Scatter plots are sometimes called correlation plots because they
show how two variables are correlated.

### Example 1
<p align="center">
  <img alt="positive scatter plot"
  src="{{ site.baseurl }}/images/20181025-pos-scatter-plot.png"/>
</p>

{% highlight python %}
import numpy as np
import matplotlib.pyplot as plt
from matplotlib_venn import venn2
import squarify

plt.scatter(x=range(77, 770, 10),
            y=np.random.randn(70)*55+range(77, 770, 10),
            s=200, alpha=0.6)
plt.tick_params(labelsize=12)
plt.xlabel('Surface(m2)', size=12)
plt.ylabel('Turnover (K euros)', size=12)
plt.xlim(left=0)
plt.ylim(bottom=0)

plt.show()
{% endhighlight %}

This plot describes the positive relation between store's surface and its
turnover(k euros), which is reasonable: for stores, the larger it is, more
clients it can accept, more turnover it will generate.

### Example 2
<p align="center">
  <img alt="negative scatter plot"
  src="{{ site.baseurl }}/images/20181025-neg-scatter-plot.png"/>
</p>

{% highlight python %}
plt.scatter(x=range(-10, 38, 1), y=range(770, 60, -15)-np.random.randn(48)*40,
            s=200,
            alpha=0.6)
plt.xlabel('Temperature(°C)', size=12)
plt.ylabel('Volume per store', size=12)

plt.show()
{% endhighlight %}

This chart displays a negative relation between two variables: temperature and
average volume of hot soup. When it gets colder, people need to think something
hot to keep them warmer, however, when it becomes hotter, the needs of hot soup
decreases.

### Example 3
<p align="center">
  <img alt="independant scatter plot"
  src="{{ site.baseurl }}/images/20181025-indpt-scatter-plot.png"/>
</p>

{% highlight python %}
plt.scatter(x=range(20, 80, 1), y=np.abs(np.random.randn(60)*40),
            s=200,
            alpha=0.6)
plt.xlabel('Age', size=12)
plt.ylabel('Average purchase cost per week(euros)', size=12)

plt.show()
{% endhighlight %}

This plot shows that there is no relation between client's age and their
purchase cost per week. Thus, we shouldn't study their relationship for this
case.

## Connected scatter plot
A [connected scatter][connected scatter] plot is a mix between scatter plot and
line chart, it uses line segments to connect consecutive scatter plot points,
for example to illustrate trajectories over time.

### When to use it ?
The connected scatterplot visualizes **two related time series** in a
scatterplot and connects the points with a line in temporal sequence.

### Example
<p align="center">
  <img alt="connected scatter plot"
  src="{{ site.baseurl }}/images/20181025-connected-scatter-plot.png"/>
</p>

{% highlight python %}
turnover = [30, 38, 26, 20, 21, 15, 8, 5, 3, 9, 25, 27]
plt.plot(np.arange(12), turnover, marker='o')

plt.show()
{% endhighlight %}

Suppose that the plot above describes the turnover(k euros) of hot soup's sales
during one year. According to the plot, we can clearly find that the sales
reach a peak in winter, then fall from spring to summer, which is logical.

## Bubble chart
A [bubble chart][bubble chart] is a type of chart that displays three
dimensions of data, the value of an additional variable is represented through
the size of the dots.

### When to use it ?
For conveying information regarding a **third data element** per observation.

### Example

<p align="center">
  <img alt="bubble chart"
  src="{{ site.baseurl }}/images/20181025-bubble-chart.png"/>
</p>

{% highlight python %}
nbclients = range(10, 494, 7)
plt.scatter(x=range(77, 770, 10),
            y=np.random.randn(70)*55+range(77, 770, 10),
            s=nbclients, alpha=0.6)

plt.show()
{% endhighlight %}

Since I added number of clients as size of each point, which corresponds the
explication of the scatter plot above.

## Scatter plot with different colors
Scatter plot which created by matplotlib, cannot specify colors in terms of
category variable's value. So we have to overlap plots of different colors.

### Example 1

<p align="center">
  <img alt="simple 2-color scatter plot"
  src="{{ site.baseurl }}/images/20181025-simple-scatter-2colors.png"/>
</p>

{% highlight python %}
plt.scatter(x=range(40, 70, 1),
            y=np.abs(np.random.randn(30)*20),
            s=200,
            alpha=0.6,
            label='40-69 years old')
plt.scatter(x=range(20, 40, 1),
            y=np.abs(np.random.randn(20)*40),
            s=200,
            alpha=0.6,
            label='20-39 years old')
plt.show()
{% endhighlight %}

This 2-color scatter plot displays clearly the difference of weekly purchase
cost between young people and middle aged or elderly people: average weekly
purchase of younger people is nealy once more than middle aged or elderly
people.

### Example 2

<p align="center">
  <img alt="overlapped scatter plot"
  src="{{ site.baseurl }}/images/20181025-overlapped-scatter.png"/>
</p>

{% highlight python %}
plt.scatter(x=range(10, 70, 1),
            y=np.abs(np.random.randn(60)*40),
            s=100,
            alpha=0.6,
            label='Paris (75)')
plt.scatter(x=range(10, 70, 1),
            y=np.abs(np.random.randn(60)*20),
            s=100,
            alpha=0.6,
            label='Val de Marne (94)')
plt.show()
{% endhighlight %}

In this plot, some points are overlapped, which will impact our analysis. In
this case, it's better to separate samples of "Paris (75)" and "Val de Marne
(94)" into 2 plot:

<p align="center">
  <img alt="separated scatter plot"
  src="{{ site.baseurl }}/images/20181025-separated-scatter.png"/>
</p>

{% highlight python %}
fig, axarr = plt.subplots(nrows=1, ncols=2, figsize=(14, 7))

axarr[0].scatter(x=range(10, 70, 1),
                 y=np.abs(np.random.randn(60)*40),
                 s=100,
                 alpha=0.6,
                 label='Paris (75)')
axarr[1].scatter(x=range(10, 70, 1),
                 y=np.abs(np.random.randn(60)*20),
                 s=100,
                 alpha=0.6,
                 label='Val de Marne (94)',
                 color='#ff7f01')
plt.show()
{% endhighlight %}

Comparing to the first plot of this example, the graphs above are more clearer
and explicable. The rent price per m2 of Val de Marne is almost half of the
rent price / m2 of Paris.

You can click [here][notebook] to check this example in jupyter notebook.

## Reference
- [When to use a scatter plot?][use of scatter plot]
- [The Connected Scatterplot for Presenting Paired Time Series][use of csp]
- [Effective Use of Bubble Charts][use of bubble plot]
- Steve Johnson, "painting wallpaper", _www.pexels.com_. [Online]. Available: [https://www.pexels.com/photo/painting-wallpaper-1070527/][backgroud-img]

[scatter plot]: https://en.wikipedia.org/wiki/Scatter_plot
[connected scatter]: https://vega.github.io/vega/examples/connected-scatter-plot
[bubble chart]: https://en.wikipedia.org/wiki/Bubble_chart
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/python_for_data_analysis/plotting_and_visualization/scatter_plot.ipynb
[use of scatter plot]: https://chartio.com/learn/dashboards-and-charts/what-is-a-scatter-plot
[use of csp]: https://research.tableau.com/sites/default/files/Haroz-TVCG-2016.pdf
[use of bubble plot]: https://msktc.org/lib/docs/KT_Toolkit/Charts_and_Graphs/Charts_Tool_Bubble_508c.pdf
[series1]: https://jingwen-z.github.io/data-viz-with-matplotlib-series1-bar-chart/
[series2]: https://jingwen-z.github.io/data-viz-with-matplotlib-series2-line-chart/
[series3]: https://jingwen-z.github.io/data-viz-with-matplotlib-series3-pie-chart/
[series5]: https://jingwen-z.github.io/data-viz-with-matplotlib-series5-treemap/
[series6]: https://jingwen-z.github.io/data-viz-with-matplotlib-series6-venn-diagram/
[series7]: https://jingwen-z.github.io/data-viz-with-matplotlib-series7-area-chart/
[series8]: https://jingwen-z.github.io/data-viz-with-matplotlib-series8-radar-chart/
[series9]: https://jingwen-z.github.io/data-viz-with-matplotlib-series9-word-cloud/
[series10]: https://jingwen-z.github.io/data-viz-with-matplotlib-series10-lollipop-plot/
[series11]: https://jingwen-z.github.io/data-viz-with-matplotlib-series11-histogram/
[backgroud-img]: https://www.pexels.com/photo/painting-wallpaper-1070527/
