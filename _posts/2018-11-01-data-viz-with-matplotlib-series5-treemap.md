---
layout:             post
title:              "Matplotlib Series 5: Treemap"
date:               "2018-11-01 16:23:50 +0100"
last_modified_at:   2018-11-11 09:30:04 +0100
comments:           true
excerpt:            >
    This blog specifies how to create treemap with matplotlib in Python, and
    its use case.
---

<p align="center">
  <img alt="plot examples"
  src="{{ site.baseurl }}/images/20181102-matplotlib-series.png
"/>
</p>

## Treemap
[Treemaps][treemap] display hierarchical (tree-structured) data as a set of
nested rectangles. Each branch of the tree is given a rectangle, which is then
tiled with smaller rectangles representing sub-branches. A leaf node's
rectangle has an area proportional to a specified dimension of the data. Often
the leaf nodes are colored to show a separate dimension of the data.

### When to use it ?
- Less than 10 branches
- Positive values
- Space for visualisation is limited.

### Example
<p align="center">
  <img alt="treemap"
  src="{{ site.baseurl }}/images/20181030-treemap.png"/>
</p>

{% highlight python %}
import numpy as np
import matplotlib.pyplot as plt
import squarify

volume = [350, 220, 170, 150, 50]
labels = ['Liquid\n volume: 350k', 'Savoury\n volume: 220k',
          'Sugar\n volume: 170k', 'Frozen\n volume: 150k',
          'Non-food\n volume: 50k']
color_list = ['#0f7216', '#b2790c', '#ffe9a3',
              '#f9d4d4', '#d35158', '#ea3033']

plt.rc('font', size=14)
squarify.plot(sizes=volume, label=labels,
              color=color_list, alpha=0.7)
plt.axis('off')

plt.show()
{% endhighlight %}

This treemap describes volume for each product universe with corresponding
surface. Liquid products are more sold than others. If you want to explore more,
we can go into products "liquid" and find which shelves are prefered by clients.

### Counter-example
<p align="center">
  <img alt="bad treemap"
  src="{{ site.baseurl }}/images/20181030-bad-treemap.png"/>
</p>

{% highlight python %}
volume = [1783, 1221, 1097, 839, 736, 493,
          472, 150, 105, 66, 50]
labels = ['Water\n volume: 1783k',
          'Coffe\n volume: 1221k',
          'Yogurt\n volume: 1097k',
          'Chocolate\n volume: 839k',
          'Juice\n volume: 736k',
          'Snacking\n volume: 493k',
          'Fruit\n volume: 472k',
          'Beef\n volume: 150k',
          'Ice-cream\n volume: 105k',
          'Salad\n volume: 66k',
          'Shampooing\n volume: 50k']

squarify.plot(sizes=volume, label=labels,
              color=color_list, alpha=0.7)

plt.show()
{% endhighlight %}

This example shows the reason why a treemap should have less than 10 branches.
In the plot above, there are 11 branches, and at the top right corner, the
surface for branches "Salad" and "Shampooing" is too small to display the
information clearly. Thus, a treemap whth less than 10 branches is a better
choice.

You can click [here][notebook] to check this example in jupyter notebook.

[treemap]: https://en.wikipedia.org/wiki/Treemapping
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/plotting_and_visualization/treemap.ipynb
