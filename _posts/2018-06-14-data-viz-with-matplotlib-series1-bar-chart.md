---
layout:             post
title:              "Data viz with matplotlib Series 1: Bar chart"
date:               2018-06-14 21:33:25 +0200
last_modified_at:   2018-09-05 21:09:58 +0200
comments:           true
excerpt:            >
    This blog specifies how to create simple bar chart, grouped bar chart and
    stacked bar chart with matplotlib in Python.
---

[Bar chart][bar chart] is the basic and simplest way to compare categorical data.
A bar graph shows comparisons among _discrete categories_. One axis of the chart
shows the specific categories being compared, and the other axis represents a
measured value.

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

<p align="center">
  <img alt="one plot"
  src="{{ site.baseurl }}/images/20180614-grp-bar-chart.png"/>
</p>

{% highlight python %}
import matplotlib.pyplot as plt
import numpy as np

year_n_1 = (20, 35, 30, 35, 27, 27, 33)
year_n = (25, 39, 45, 25, 21, 29, 36)

ind = np.arange(7)
width = 0.35

fig, ax = plt.subplots(figsize=(9, 6))
rects1 = ax.bar(ind - width / 2, year_n_1,
                width, color='#1f77b4', alpha=0.5)
rects2 = ax.bar(ind + width / 2, year_n,
                width, color='#1f77b4')

plt.xticks(np.arange(7),
           ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'))
plt.xlabel('Month')
plt.ylabel('Turnover (K euros)')
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

<p align="center">
  <img alt="one plot"
  src="{{ site.baseurl }}/images/20180614-stacked-bar-chart.png"/>
</p>

{% highlight python %}
import matplotlib.pyplot as plt
import numpy as np

cheese = (20, 35, 30, 35, 27, 37, 20)
non_cheese = (25, 32, 34, 20, 25, 17, 29)

rect1 = plt.bar(np.arange(7), cheese,
                width=0.5, color='orangered')
rect2 = plt.bar(np.arange(7), non_cheese,
                bottom=cheese, width=0.5, color='#1f77b4')

plt.xticks(np.arange(7),
           ('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'))
plt.xlabel('Weekday')
plt.ylabel('Turnover (K euros)')
plt.legend((rect1[0], rect2[0]), ('cheese', 'non-cheese'))

plt.show()
{% endhighlight %}

This plot presents weekdays' turnover with cheese and non-cheese products' sales.
Globally, the sales of cheese products are much more than others.

You can click [here][notebook] to check this example in jupyter notebook.

[bar chart]: https://en.wikipedia.org/wiki/Bar_chart
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/plotting_and_visualization/bar_plot.ipynb
