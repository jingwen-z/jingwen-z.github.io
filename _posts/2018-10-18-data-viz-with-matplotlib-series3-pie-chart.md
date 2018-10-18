---
layout:             post
title:              "Data viz with matplotlib Series 3: Pie chart"
date:               "2018-10-18 21:05:15 +0200"
comments:           true
excerpt:            >
    This blog specifies how to create pie chart with value labels, donut chart
    and nested pie chart, and how to adjust labels' size and position with
    matplotlib in Python.
---
A [pie chart][pie chart] (or a circle chart) is a circular statistical graphic
which is divided into slices to illustrate numerical proportion. In a pie chart,
the arc length of each slice (and consequently its central angle and area), is
proportional to the quantity it represents. Pie charts are very widely used in
the business world and the mass media. To ensure to be readable, it fits well
the data with _less than 10 categories_.

<p align="center">
  <img alt="pie plot"
  src="{{ site.baseurl }}/images/20181011-pie-chart.png"/>
</p>

{% highlight python %}
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

plt.figure(figsize=(7, 7))

labels = 'apple', 'banana', 'cherry', 'durian', 'elderberries', 'figs', 'grapes'
sizes = [32, 20, 15, 10, 10, 8, 5]

p = plt.pie(sizes, labels=labels, explode=(0.07, 0, 0, 0, 0, 0, 0),
            autopct='%1.1f%%', startangle=130, shadow=True)
plt.axis('equal')

for i, (apple, banana, cherry, durian, elderberries, figs, grapes) in enumerate(p):
    if i > 0:
        apple.set_fontsize(12)
        banana.set_fontsize(12)
        cherry.set_fontsize(12)
        durian.set_fontsize(12)
        elderberries.set_fontsize(12)
        figs.set_fontsize(12)
        grapes.set_fontsize(12)
            
plt.show()
{% endhighlight %}

This pie chart describes the turnovers' percentage for each fruit. Sales of
apple bring the most turnover among 7 fruits, who presents 32% of turnover. If
the values represent volume instead of turnover, then we should prepare more
apples than other fruits in the store.

## Donut chart
A donut chart is a variant of the pie chart, with a blank center allowing for
additional information about the data as a whole to be included. This type of
circular graph can support multiple statistics at once and it provides a better
data intensity ratio to standard pie charts. It does not have to contain
information in the center.

<p align="center">
  <img alt="donut plot"
  src="{{ site.baseurl }}/images/20181011-donut-chart.png"/>
</p>

{% highlight python %}
plt.figure(figsize=(7, 7))

labels = 'apple', 'banana', 'cherry', 'durian', 'elderberries', 'figs', 'grapes'
sizes = [32, 20, 15, 10, 10, 8, 5]
my_circle = plt.Circle((0, 0), 0.4, color='white')

d = plt.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=90)
plt.axis('equal')
plt.gca().add_artist(my_circle)

for i, (apple, banana, cherry, durian, elderberries, figs, grapes) in enumerate(d):
    if i > 0:
        apple.set_fontsize(12)
        banana.set_fontsize(12)
        cherry.set_fontsize(12)
        durian.set_fontsize(12)
        elderberries.set_fontsize(12)
        figs.set_fontsize(12)
        grapes.set_fontsize(12)
            
plt.show()
{% endhighlight %}

Extracly the same implication as the pie chart above.

## Nested pie chart
A [nested pie chart][nested pie chart] or multi-level pie chart allows you to
incorporate multiple levels or layers into your pie. Nested pies are a module
variation on our standard pie chart type.

<p align="center">
  <img alt="pie plot"
  src="{{ site.baseurl }}/images/20181011-nested-pie-chart.png"/>
</p>

{% highlight python %}
plt.figure(figsize=(6, 6))

labels = ['vegetable', 'fruit']
sizes = [300, 200]
labels_vegefruit = ['potato', 'tomato', 'onion', 'apple',
                    'banana', 'cherry', 'durian']
sizes_vegefruit = [170, 70, 60, 70, 60, 50, 20]
colors = ['#FFB600', '#09A0DA']
colors_vegefruit = ['#FFCE53', '#FFDA7E', '#FFE9B2', '#30B7EA',
                    '#56C7F2','#7FD6F7', '#B3E7FB']
 
bigger = plt.pie(sizes, labels=labels, colors=colors,
                 startangle=90, frame=True)
smaller = plt.pie(sizes_vegefruit, labels=labels_vegefruit,
                  colors=colors_vegefruit, radius=0.7,
                  startangle=90, labeldistance=0.7)
centre_circle = plt.Circle((0, 0), 0.4, color='white', linewidth=0)
fig = plt.gcf()
fig.gca().add_artist(centre_circle)

for i, (vegetable, fruit) in enumerate(bigger):
    if i > 0:
        vegetable.set_fontsize(12)
        fruit.set_fontsize(12)

for j, (potato, tomato, onion, apple, banana, cherry, durian) in enumerate(smaller):
    if j > 0:
        potato.set_fontsize(12)
        tomato.set_fontsize(12)
        onion.set_fontsize(12)
        apple.set_fontsize(12)
        banana.set_fontsize(12)
        cherry.set_fontsize(12)
        durian.set_fontsize(12)
        
plt.axis('equal')
plt.tight_layout()

plt.show()
{% endhighlight %}

This chart specifies a second level for consommation of vegetable and fruit,
respectively. In general, vegetable is more consummed than fruit. Among 3
vegetables, potato is much more popular than others; among 4 fruits, apple is
the most sold. Thus, for the retailers, they need to prepare more potatoes and
apples than other vegetables and fruits.

You can click [here][notebook] to check this example in jupyter notebook.

[pie chart]: https://en.wikipedia.org/wiki/Pie_chart
[nested pie chart]: https://www.zingchart.com/docs/chart-types/nested-pie-chart
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/plotting_and_visualization/pie_chart.ipynb