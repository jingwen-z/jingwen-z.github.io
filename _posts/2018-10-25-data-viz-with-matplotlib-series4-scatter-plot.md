---
layout:             post
title:              "Matplotlib Series 4: Scatter plot"
date:               "2018-10-25 21:06:53 +0200"
last_modified_at:   2018-11-10 16:19:37 +0100
comments:           true
excerpt:            >
    This blog specifies how to create scatter plot, connected scatter plot
    and bubble chart with matplotlib in Python.
---

<p align="center">
  <img alt="plot examples"
  src="{{ site.baseurl }}/images/20181102-matplotlib-series.png
"/>
</p>

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
purchase cost per week.

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

You can click [here][notebook] to check this example in jupyter notebook.

## Reference
- [When to use a scatter plot?][use of scatter plot]
- [The Connected Scatterplot for Presenting Paired Time Series][use of csp]
- [Effective Use of Bubble Charts][use of bubble plot]

[scatter plot]: https://en.wikipedia.org/wiki/Scatter_plot
[connected scatter]: https://vega.github.io/vega/examples/connected-scatter-plot
[bubble chart]: https://en.wikipedia.org/wiki/Bubble_chart
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/plotting_and_visualization/scatter_plot.ipynb
[use of scatter plot]: https://chartio.com/learn/dashboards-and-charts/what-is-a-scatter-plot
[use of csp]: https://research.tableau.com/sites/default/files/Haroz-TVCG-2016.pdf
[use of bubble plot]: https://msktc.org/lib/docs/KT_Toolkit/Charts_and_Graphs/Charts_Tool_Bubble_508c.pdf