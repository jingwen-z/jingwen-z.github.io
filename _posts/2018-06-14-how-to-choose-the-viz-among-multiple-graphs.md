---
layout:      post
title:       "How to choose the viz among multiple graphs?"
date:        "2018-06-14 21:33:25 +0200"
comments:    true
---

In this blog I want to talk about different types of graph, their function and
how to create them by python.

## Bar chart
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

## Line chart
A [line chart][line chart] or line graph is a type of chart which displays
information as a series of data points called 'markers' connected by straight
line segments. A line chart is often used to visualize a trend in data over
intervals of time – a time series – thus the line is often drawn chronologically.

<p align="center">
  <img alt="one plot"
  src="{{ site.baseurl }}/images/20180614-line-chart.png"/>
</p>

{% highlight python %}
import matplotlib.pyplot as plt
import numpy as np

turnover = [12, 15, 17, 23, 20, 27, 37, 40, 30, 25, 15, 10]
plt.plot(np.arange(12), turnover, marker='.', linestyle='--')

plt.xticks(np.arange(12), np.arange(1,13))
plt.xlabel('Month')
plt.ylabel('Turnover (K euros) of ice-cream')

plt.show()
{% endhighlight %}

## Pie chart
A [pie chart][pie chart] (or a circle chart) is a circular statistical graphic
which is divided into slices to illustrate numerical proportion. In a pie chart,
the arc length of each slice (and consequently its central angle and area), is
proportional to the quantity it represents. Pie charts are very widely used in
the business world and the mass media. To ensure to be readable, it fits well
the data with _less than 10 categories_.

<p align="center">
  <img alt="one plot"
  src="{{ site.baseurl }}/images/20180614-pie-chart.png"/>
</p>

{% highlight python %}
import matplotlib.pyplot as plt
import numpy as np

labels = 'apple', 'banana', 'cherry', 'durian', 'elderberries', 'figs', 'grapes'
sizes = [32, 20, 15, 10, 10, 8, 5]

p = plt.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=90)
plt.axis('equal')

for i, (apple, banana, cherry, durian, elderberries, figs, grapes) in enumerate(p):
    if i > 0:
        apple.set_fontsize(14)
        banana.set_fontsize(14)
        cherry.set_fontsize(14)
        durian.set_fontsize(14)
        elderberries.set_fontsize(14)
        figs.set_fontsize(14)
        grapes.set_fontsize(14)

plt.show()
{% endhighlight %}

## Donut chart
A donut chart is a variant of the pie chart, with a blank center allowing for
additional information about the data as a whole to be included. This type of
circular graph can support multiple statistics at once and it provides a better
data intensity ratio to standard pie charts. It does not have to contain
information in the center.

<p align="center">
  <img alt="one plot"
  src="{{ site.baseurl }}/images/20180614-donut-chart.png"/>
</p>

{% highlight python %}
import matplotlib.pyplot as plt
import numpy as np

labels = 'apple', 'banana', 'cherry', 'durian', 'elderberries', 'figs', 'grapes'
sizes = [32, 20, 15, 10, 10, 8, 5]
my_circle = plt.Circle((0, 0), 0.4, color='white')

d = plt.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=90)
plt.axis('equal')
plt.gca().add_artist(my_circle)

for i, (apple, banana, cherry, durian, elderberries, figs, grapes) in enumerate(d):
    if i > 0:
        apple.set_fontsize(14)
        banana.set_fontsize(14)
        cherry.set_fontsize(14)
        durian.set_fontsize(14)
        elderberries.set_fontsize(14)
        figs.set_fontsize(14)
        grapes.set_fontsize(14)

plt.show()
{% endhighlight %}

## Treemap
[Treemaps][treemap] display hierarchical (tree-structured) data as a set of
nested rectangles. Each branch of the tree is given a rectangle, which is then
tiled with smaller rectangles representing sub-branches. A leaf node's rectangle
has an area proportional to a specified dimension of the data. Often the leaf
nodes are colored to show a separate dimension of the data.

<p align="center">
  <img alt="one plot"
  src="{{ site.baseurl }}/images/20180614-treemap.png"/>
</p>

{% highlight python %}
import matplotlib.pyplot as plt
import numpy as np

color_list = ['#0f7216', '#b2790c', '#ffe9a3',
              '#f9d4d4', '#d35158', '#ea3033']
squarify.plot(sizes=[35, 22, 17, 15, 5],
              label=['group A', 'group B', 'group C',
                     'group D', 'group E'],
              color=color_list, alpha=0.7)
plt.axis('off')

plt.show()
{% endhighlight %}

## Venn diagram
A [Venn diagram][Venn diagram] (also called primary diagram, set diagram or
logic diagram) is a diagram that shows all possible logical relations between a
finite collection of different sets.

<p align="center">
  <img alt="one plot"
  src="{{ site.baseurl }}/images/20180614-venn-diagram.png"/>
</p>

{% highlight python %}
import matplotlib.pyplot as plt
import numpy as np

v = venn2(subsets = (4, 6, 3),
          set_labels = ('Group A', 'Group B'))
v.get_patch_by_id('10').set_color('orange')
v.get_patch_by_id('01').set_color('blue')
v.get_patch_by_id('11').set_color('grey')

v.get_patch_by_id('10').set_edgecolor('none')
v.get_patch_by_id('01').set_edgecolor('none')
v.get_patch_by_id('11').set_edgecolor('none')

for text in v.subset_labels:
    text.set_fontsize(14)

plt.show()

# Second way
grp1 = set(['A', 'B', 'C', 'D', 'E', 'F', 'G'])
grp2 = set(['B', 'C', 'D', 'L', 'M', 'N', 'O', 'P', 'Q'])

v = venn2([grp1, grp2],
          set_labels = ('Group A', 'Group B'))

v.get_patch_by_id('10').set_color('orange')
v.get_patch_by_id('01').set_color('blue')
v.get_patch_by_id('11').set_color('grey')

v.get_patch_by_id('10').set_edgecolor('none')
v.get_patch_by_id('01').set_edgecolor('none')
v.get_patch_by_id('11').set_edgecolor('none')

for text in v.subset_labels:
    text.set_fontsize(14)

plt.show()
{% endhighlight %}


Do you know other types of graphs? Tell me your opinion in the comments! :) 

[bar chart]: https://en.wikipedia.org/wiki/Bar_chart
[line chart]: https://en.wikipedia.org/wiki/Line_chart
[pie chart]: https://en.wikipedia.org/wiki/Pie_chart
[treemap]: https://en.wikipedia.org/wiki/Treemapping
[Venn diagram]: https://en.wikipedia.org/wiki/Venn_diagram
