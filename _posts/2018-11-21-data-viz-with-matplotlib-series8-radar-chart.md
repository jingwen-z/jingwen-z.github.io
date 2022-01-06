---
layout:             post
title:              "Matplotlib Series 8: Radar chart"
lang:               en
date:               "2018-11-21 21:27:34 +0100"
last_modified_at:   2019-07-19 21:55:37 +0200
series:             [data-visualisation]
tags:               [matplotlib, visualisation]
permalink:         /data-viz-with-matplotlib-series8-radar-chart/
comments:           true
excerpt:            >
    This blog specifies how to create simple radar charts, multiple area charts
    with matplotlib in Python and their use cases.
cover:             /images/20181121-radar-header.png
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
> * Matplotlib Series 8: Radar chart (this blog)
> * [Matplotlib Series 9: Word cloud][series9]
> * [Matplotlib Series 10: Lollipop plot][series10]
> * [Matplotlib Series 11: Histogram][series11]

## Radar chart
The [radar chart][radar chart] is a chart and/or plot that consists of a
sequence of equi-angular spokes, called radii, with each spoke representing one
of the variables. The data length of a spoke is proportional to the magnitude
of the variable for the data point relative to the maximum magnitude of the
variable across all data points. A line is drawn connecting the data values for
each spoke. This gives the plot a star-like appearance and the origin of one of
the popular names for this plot.

### When to use it ?
- Comparing two or more items or groups on various features or characteristics.
- Examining the relative values for a single data point.
- Displaying less than ten factors on one radar chart.

### Example 1
<p align="center">
  <img alt="dataframe example"
  src="{{ site.baseurl }}/images/20181121-df.png"/>
</p>

<p align="center">
  <img alt="simple radar chart"
  src="{{ site.baseurl }}/images/20181121-radar-chart.png"/>
</p>

{% highlight python %}
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from math import pi

categories = list(df)[1:]
values = df.mean().values.flatten().tolist()
values += values[:1] # repeat the first value to close the circular graph
angles = [n / float(len(categories)) * 2 * pi for n in range(len(categories))]
angles += angles[:1]

fig, ax = plt.subplots(nrows=1, ncols=1, figsize=(8, 8),
                       subplot_kw=dict(polar=True))

plt.xticks(angles[:-1], categories, color='grey', size=12)
plt.yticks(np.arange(1, 6), ['1', '2', '3', '4', '5'],
           color='grey', size=12)
plt.ylim(0, 5)
ax.set_rlabel_position(30)
 
ax.plot(angles, values, linewidth=1, linestyle='solid')
ax.fill(angles, values, 'skyblue', alpha=0.4)

plt.show()
{% endhighlight %}

This radar chart describes the average products' preference of 4 clients.
Cheese is the most favored product, however, it seems that bread is not that
popular... What're the products of bread? Do they taste bad? Should we change
the supplier of bread? Or should we improve the recipe?

### Example 2
<p align="center">
  <img alt="multiple radar chart"
  src="{{ site.baseurl }}/images/20181121-multi-radar-chart.png"/>
</p>

{% highlight python %}
# part 1
val_c1 = df.loc[0].drop('client_id').values.flatten().tolist()
val_c1 += val_c1[:1]
ax.plot(angles, val_c1, linewidth=1,
        linestyle='solid', label='Client c1')
ax.fill(angles, val_c1, 'skyblue', alpha=0.4)
 
# part 2
val_c2=df.loc[1].drop('client_id').values.flatten().tolist()
val_c2 += val_c2[:1]
ax.plot(angles, val_c2, linewidth=1,
        linestyle='solid', label='Client c2')
ax.fill(angles, val_c2, 'lightpink', alpha=0.4)
 
plt.legend(loc='upper right', bbox_to_anchor=(0.1, 0.1))
plt.show()
{% endhighlight %}

This radar chart displays the preference of 2 clients among 4. Client c1 favors
chicken and bread, and doesn't like cheese that much. Nevertheless, client c2
prefers cheese to other 4 products and doesn't like beer. We can have an
interview with these 2 clients, in order to find the weakness of products which
are out of preference.

### Counter-example
<p align="center">
  <img alt="larger dataframe"
  src="{{ site.baseurl }}/images/20181121-large-df.png"/>
</p>

<p align="center">
  <img alt="bad radar chart"
  src="{{ site.baseurl }}/images/20181121-bad-radar-chart.png"/>
</p>

{% highlight python %}
larger_categories = list(larger_df)[1:]
larger_values = larger_df.loc[0].drop('client_id').values.flatten().tolist()
larger_values += larger_values[:1]
larger_angles = [n / float(len(larger_categories)) * 2 * pi for n in range(len(larger_categories))]
larger_angles += larger_angles[:1]

fig, ax = plt.subplots(nrows=1, ncols=1, figsize=(8, 8),
                       subplot_kw=dict(polar=True))

plt.xticks(larger_angles[:-1], larger_categories,
           color='grey', size=12)
plt.yticks(np.arange(1, 6), ['1', '2', '3', '4', '5'],
           color='grey', size=12)
plt.ylim(0, 5)
ax.set_rlabel_position(30)
 
ax.plot(larger_angles, larger_values, linewidth=1, linestyle='solid')
ax.fill(larger_angles, larger_values, 'skyblue', alpha=0.4)

plt.show()
{% endhighlight %}

In this example, we have client c1's preferences on 13 food. Since the number
of food is a bit more, which makes the preference not be obvious. That's why
we'd better apply radar chart with less than 8 items.

You can click [here][notebook] to check this example in jupyter notebook.

## Reference
- [Effective Use of Radar Charts][r1]
- Steve Johnson, "painting wallpaper", _www.pexels.com_. [Online]. Available: [https://www.pexels.com/photo/painting-wallpaper-1070527/][backgroud-img]

[radar chart]: https://en.wikipedia.org/wiki/Radar_chart
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/python_for_data_analysis/plotting_and_visualization/radar_chart.ipynb
[r1]: https://msktc.org/lib/docs/KT_Toolkit/Charts_and_Graphs/Charts_and_Graphics_Radar_508c.pdf
[series1]: https://jingwen-z.github.io/data-viz-with-matplotlib-series1-bar-chart/
[series2]: https://jingwen-z.github.io/data-viz-with-matplotlib-series2-line-chart/
[series3]: https://jingwen-z.github.io/data-viz-with-matplotlib-series3-pie-chart/
[series4]: https://jingwen-z.github.io/data-viz-with-matplotlib-series4-scatter-plot/
[series5]: https://jingwen-z.github.io/data-viz-with-matplotlib-series5-treemap/
[series6]: https://jingwen-z.github.io/data-viz-with-matplotlib-series6-venn-diagram/
[series7]: https://jingwen-z.github.io/data-viz-with-matplotlib-series7-area-chart/
[series9]: https://jingwen-z.github.io/data-viz-with-matplotlib-series9-word-cloud/
[series10]: https://jingwen-z.github.io/data-viz-with-matplotlib-series10-lollipop-plot/
[series11]: https://jingwen-z.github.io/data-viz-with-matplotlib-series11-histogram/
[backgroud-img]: https://www.pexels.com/photo/painting-wallpaper-1070527/
