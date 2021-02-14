---
layout:             post
title:              "Matplotlib Series 7: Area chart"
date:               "2018-11-14 21:55:44 +0100"
last_modified_at:   2019-07-01 23:17:20 +0200
tags:               [matplotlib, visualisation]
comments:           true
excerpt:            >
    This blog specifies how to create simple area charts, multiple area charts,
    stacked area charts and 100% stacked area charts with matplotlib in Python,
    and their use cases.
cover:             /images/20181114-area-header.png
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
> * Matplotlib Series 7: Area chart (this blog)
> * [Matplotlib Series 8: Radar chart][series8]
> * [Matplotlib Series 9: Word cloud][series9]
> * [Matplotlib Series 10: Lollipop plot][series10]
> * [Matplotlib Series 11: Histogram][series11]

## Area chart
An [area chart][area chart] or area graph displays graphically quantitative data.
It is based on the line chart. The area between axis and line are commonly
emphasized with colors, textures and hatchings.

### When to use it ?
- Show or compare a quantitative progression over time.

### Example 1
<p align="center">
  <img alt="simple area chart"
  src="{{ site.baseurl }}/images/20181114-simple-area-chart.png"/>
</p>

{% highlight python %}
import datetime
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

turnover = [2, 7, 14, 17, 20, 27, 30, 38, 25, 18, 6, 1]
plt.fill_between(np.arange(12), turnover,
                 color="skyblue", alpha=0.4)
plt.plot(np.arange(12), turnover, color="Slateblue",
         alpha=0.6, linewidth=2)

plt.tick_params(labelsize=12)
plt.xticks(np.arange(12), np.arange(1,13))
plt.xlabel('Month', size=12)
plt.ylabel('Turnover (K euros) of ice-cream', size=12)
plt.ylim(bottom=0)

plt.show()
{% endhighlight %}

Suppose that the plot above describes the turnover(k euros) of ice-cream's
sales during one year. According to the plot, we can clearly find that the
sales reach a peak in summer, then fall from autumn to winter, which is logical.

### Example 2
<p align="center">
  <img alt="multiple area chart"
  src="{{ site.baseurl }}/images/20181114-multi-area-chart.png"/>
</p>

{% highlight python %}
year_n_1 = [1.5, 3, 10, 13, 22, 36, 30, 33, 24.5, 15, 6.5, 1.2]
year_n = [2, 7, 14, 17, 20, 27, 30, 38, 25, 18, 6, 1]

plt.fill_between(np.arange(12), year_n_1, color="lightpink",
                 alpha=0.5, label='year N-1')
plt.fill_between(np.arange(12), year_n, color="skyblue",
                 alpha=0.5, label='year N')

plt.legend()
plt.show()
{% endhighlight %}

As an extension of the first plot, the second one compares two-year turnover
together. The peak for both year is in the summer, for year N, the peak is in
August; however, the peak is reached in June in the year N-1, which is caused
by the heatwave in June.

## Stacked area chart
[Stacked Area Graphs][Stacked Area Graph] work in the same way as simple Area
Graphs do, except for the use of multiple data series that start each point
from the point left by the previous data series.

### When to use it ?
- Represent cumulated totals using numbers or percentages over time.
- Visualize part-to-whole relationships, helping show how each category
contributes to the cumulative total.

### Example
<p align="center">
  <img alt="dataframe example"
  src="{{ site.baseurl }}/images/20181114-df.png"/>
</p>

<p align="center">
  <img alt="stacked area chart"
  src="{{ site.baseurl }}/images/20181114-stacked-area-chart.png"/>
</p>

{% highlight python %}
plt.stackplot(bank_account_df.index,
              [bank_account_df['basic'], bank_account_df['saving'],
               bank_account_df['money_mkt'], bank_account_df['credit']],
              labels=['basic', 'saving', 'money_mkt', 'credit'],
              alpha=0.8)

plt.legend(loc=2, fontsize='large')
plt.show()
{% endhighlight %}

This stacked area chart displays the amounts' changes in each account, their
contribution to total amount (in term of value) as well.

## 100% Stacked Area Chart
Data plotted as areas and stacked so that the cumulative area always represents
100%.

### When to use it ?
- This is best used to show distribution of categories as parts of a whole,
where the cumulative total is unimportant.

### Example
<p align="center">
  <img alt="100% stacked area chart"
  src="{{ site.baseurl }}/images/20181114-full-stacked-area-chart.png"/>
</p>

{% highlight python %}
data_perc = bank_account_df.divide(bank_account_df.sum(axis=1), axis=0)

plt.stackplot(data_perc.index,
              [data_perc['basic'], data_perc['saving'],
               data_perc['money_mkt'], data_perc['credit']],
              labels=['basic', 'saving', 'money_mkt', 'credit'],
              alpha=0.8)

plt.show()
{% endhighlight %}

This stacked area chart displays the amounts' changes in each account, their
contribution to total amount (in term of percentage) as well.

You can click [here][notebook] to check this example in jupyter notebook.

## Reference
- [HOW TO DESIGN AREA CHARTS][r1]
- [100% Stacked Area Chart][r2]

[area chart]: https://en.wikipedia.org/wiki/Area_chart
[Stacked Area Graph]: https://datavizcatalogue.com/methods/stacked_area_graph.html
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/python_for_data_analysis/plotting_and_visualization/area_chart.ipynb
[r1]: https://visage.co/data-visualization-101-area-charts/
[r2]: https://exceljet.net/chart-type/100-stacked-area-chart
[series1]: https://jingwen-z.github.io/data-viz-with-matplotlib-series1-bar-chart/
[series2]: https://jingwen-z.github.io/data-viz-with-matplotlib-series2-line-chart/
[series3]: https://jingwen-z.github.io/data-viz-with-matplotlib-series3-pie-chart/
[series4]: https://jingwen-z.github.io/data-viz-with-matplotlib-series4-scatter-plot/
[series5]: https://jingwen-z.github.io/data-viz-with-matplotlib-series5-treemap/
[series6]: https://jingwen-z.github.io/data-viz-with-matplotlib-series6-venn-diagram/
[series8]: https://jingwen-z.github.io/data-viz-with-matplotlib-series8-radar-chart/
[series9]: https://jingwen-z.github.io/data-viz-with-matplotlib-series9-word-cloud/
[series10]: https://jingwen-z.github.io/data-viz-with-matplotlib-series10-lollipop-plot/
[series11]: https://jingwen-z.github.io/data-viz-with-matplotlib-series11-histogram/
