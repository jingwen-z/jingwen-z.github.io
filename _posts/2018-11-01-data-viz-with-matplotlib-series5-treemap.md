---
layout:             post
title:              "Data viz with matplotlib Series 5: Treemap"
date:               "2018-11-01 16:23:50 +0100"
comments:           true
excerpt:            >
    This blog specifies how to create treemap with matplotlib in Python, and
    its use case.
---

[Treemaps][treemap] display hierarchical (tree-structured) data as a set of
nested rectangles. Each branch of the tree is given a rectangle, which is then
tiled with smaller rectangles representing sub-branches. A leaf node's
rectangle has an area proportional to a specified dimension of the data. Often
the leaf nodes are colored to show a separate dimension of the data.

## When to use it ?
- Less than 10 branches
- Positive values
- Space for visualisation is limited.

## Example
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

You can click [here][notebook] to check this example in jupyter notebook.

[treemap]: https://en.wikipedia.org/wiki/Treemapping
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/plotting_and_visualization/treemap.ipynb
