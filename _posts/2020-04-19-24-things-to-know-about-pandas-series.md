---
layout:      post
title:       "24 things to know about pandas series"
lang:        en
date:        "2020-04-19 16:44:58 +0200"
tags:        [python3, pandas, data-structure, series]
permalink:         /24-things-to-know-about-pandas-series/
comments:    true
excerpt:     >
    24 things to know about pandas series
cover:       /images/20200419-python.jpg
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

To get start with `pandas`, you need to get confortable with its two data
structures: series and dataframe. In this blog, we will talk about multiple
applications of series.

## 1. Creating a series
[`pandas.Series(data=None, index=None, dtype=None, name=None, copy=False, fastpath=False)`][pandas-Series]

{% highlight python %}
import pandas as pd

# method 1: from a list
ser1 = pd.Series(data=[5, -7, 0])
# method 2: from a dict
mdata = {'Ohio': 35000, 'Texas': 70000, 'Utah': 5000}
ser2 = pd.Series(data=mdata)
{% endhighlight %}

<p align="center">
  <img alt="20200419-creation-series"
  src="{{ site.baseurl }}/images/20200419-creation-series.png"/>
</p>

## 2. index
`Series.index`
<p align="center">
  <img alt="20200419-index"
  src="{{ site.baseurl }}/images/20200419-index.png"/>
</p>

## 3. Indexing & selection
Series indexing (`ser2[...]`) works analogously to NumPy array indexing, except
you can use the Series's index values instead of only integers.

Moreover, you can also select a subset of the rows from a series with NumPy-like
notation using either axis labels (`loc`) or integers (`iloc`).

<p align="center">
  <img alt="20200419-idx-1"
  src="{{ site.baseurl }}/images/20200419-idx-1.png"/>
</p>

The selection syntax `ser2[:2]` is provided as a convenience. Passing a single
element or a list to the `[]` operator selects columns.

Slicing with labels like `ser2['Ohio':'Texas']` behaves differently than normal
Python slicing in that the end-point is inclusive.

<p align="center">
  <img alt="20200419-idx-2"
  src="{{ site.baseurl }}/images/20200419-idx-2.png"/>
</p>

## 4. Hierarchical indexing
Hierarchical indexing is an important feature of pandas that enables you to have
multiple (two or more) index levels on an axis. It provides a way for working
with higher dimensional data in a lower dimensional form.

{% highlight python %}
data = pd.Series(range(6),
                 index=[['a', 'a', 'a', 'b', 'b', 'c'],
                        [1, 2, 3, 1, 2, 3]])
{% endhighlight %}

<p align="center">
  <img alt="20200419-hierarchical-idx"
  src="{{ site.baseurl }}/images/20200419-hierarchical-idx.png"/>
</p>

With a hierarchically indexed object, so-called _partial_ indexing is possible,
enabling you to concisely select subsets of the data:

<p align="center">
  <img alt="20200419-hierarchical-idx-2"
  src="{{ site.baseurl }}/images/20200419-hierarchical-idx-2.png"/>
</p>

Hierarchical indexing plays an important role in reshaping data and group-based
operations like forming a pivot table. For instance, you can rearrange the
dataset into a dataframe with `unstack` method:

<p align="center">
  <img alt="20200419-unstack"
  src="{{ site.baseurl }}/images/20200419-unstack.png"/>
</p>

## 5. reindex
An important method on pandas objects is `reindex`, which means to create a new
object with the data consormed to a new index.

[`Series.reindex(self, index=None, **kwargs)`][series-reindex]

{% highlight python %}
ser1.reindex([2, 0, 1])
{% endhighlight %}

<p align="center">
  <img alt="20200419-reindex"
  src="{{ site.baseurl }}/images/20200419-reindex.png"/>
</p>

## 6. drop
`drop` method returns a new object with the indicated value or values deleted
from an axis.

[`Series.drop(self, labels=None, axis=0, index=None, columns=None, level=None, inplace=False, errors='raise')`][series-drop]

{% highlight python %}
ser1.drop(1)
{% endhighlight %}

<p align="center">
  <img alt="20200419-drop"
  src="{{ site.baseurl }}/images/20200419-drop.png"/>
</p>

## 7. Arithmetic
Using NumPy functions or NumPy-like operations, such as filtering with a boolean
array, scalar multiplication, or applying math functions, will preserve the
index-value link:

<p align="center">
  <img alt="20200419-arithmetic-1"
  src="{{ site.baseurl }}/images/20200419-arithmetic-1.png"/>
</p>

When you are adding together objects, if any index pairs are not the same, the
respective index in the result will be the union of the index pairs.

<p align="center">
  <img alt="20200419-arithmetic-2"
  src="{{ site.baseurl }}/images/20200419-arithmetic-2.png"/>
</p>

## 8. in
To see if the value is one of the series' index.

<p align="center">
  <img alt="20200419-in"
  src="{{ site.baseurl }}/images/20200419-in.png"/>
</p>

## 9. isnull
Detect missing values for an array-like object.

[`pandas.isnull(obj)`][pandas-isnull]

<p align="center">
  <img alt="20200419-isnull"
  src="{{ site.baseurl }}/images/20200419-isnull.png"/>
</p>

## 10. sorting
Sort Series by index labels.<br>
[`Series.sort_index(self, axis=0, level=None, ascending=True, inplace=False, kind='quicksort', na_position='last', sort_remaining=True, ignore_index: bool = False)`][sort_index]

Sort by the values.<br>
[`Series.sort_values(self, axis=0, ascending=True, inplace=False, kind='quicksort', na_position='last', ignore_index=False)`][sort_values]

<p align="center">
  <img alt="20200419-sorting"
  src="{{ site.baseurl }}/images/20200419-sorting.png"/>
</p>

## 11. ranking
Compute numerical data ranks (1 through n) along axis.<br>
[`Series.rank(self: ~FrameOrSeries, axis=0, method: str = 'average', numeric_only: Union[bool, NoneType] = None, na_option: str = 'keep', ascending: bool = True, pct: bool = False)`][series-rank]

`method`:{‘average’, ‘min’, ‘max’, ‘first’, ‘dense’}, default ‘average’. How to
rank the group of records that have the same value:
- `average`: average rank of the group
- `min`: lowest rank in the group
- `max`: highest rank in the group
- `first`: ranks assigned in order they appear in the array
- `dense`: like ‘min’, but rank always increases by 1 between groups.

<p align="center">
  <img alt="20200419-ranking"
  src="{{ site.baseurl }}/images/20200419-ranking.png"/>
</p>

## 12. is_unique
Return boolean if values in the object are unique.<br>
[`Series.is_unique`][is_unique]

<p align="center">
  <img alt="20200419-is-unique"
  src="{{ site.baseurl }}/images/20200419-is-unique.png"/>
</p>

## 13. isin()
Check whether values are contained in Series.<br>
`Series.isin(self, values)`

<p align="center">
  <img alt="20200419-isin"
  src="{{ site.baseurl }}/images/20200419-isin.png"/>
</p>

## 14. Computing descriptive statistics

<p align="center">
  <img alt="20200419-stat"
  src="{{ site.baseurl }}/images/20200419-stat.png"/>
</p>

## 15. unique values
Return unique values of Series object.<br>
`Series.unique(self)`

Return number of unique elements in the object.<br>
`Series.nunique(self, dropna=True)`

<p align="center">
  <img alt="20200419-unique"
  src="{{ site.baseurl }}/images/20200419-unique.png"/>
</p>

## 16. value_counts
Return a Series containing counts of unique values.<br>
[`Series.value_counts(self, normalize=False, sort=True, ascending=False, bins=None, dropna=True)`][value_counts]

<p align="center">
  <img alt="20200419-value-counts"
  src="{{ site.baseurl }}/images/20200419-value-counts.png"/>
</p>

## 17. Filtering out missing data
Return a new Series with missing values removed.<br>
`Series.dropna(self, axis=0, inplace=False, how=None)`

<p align="center">
  <img alt="20200419-dropna"
  src="{{ site.baseurl }}/images/20200419-dropna.png"/>
</p>

Detect existing (non-missing) values.<br>
`Series.notnull(self)`

<p align="center">
  <img alt="20200419-notnull"
  src="{{ site.baseurl }}/images/20200419-notnull.png"/>
</p>

## 18. Filling in missing data
Fill NA/NaN values using the specified method.<br>
[`Series.fillna(self, value=None, method=None, axis=None, inplace=False, limit=None, downcast=None)`][fillna]
- `method`: {‘backfill’, ‘bfill’, ‘pad’, ‘ffill’, None}, default None.
Method to use for filling holes in reindexed Series.
    * `pad` / `ffill`: propagate last valid observation forward to next valid
    * `backfill` / `bfill`: use next valid observation to fill gap

<p align="center">
  <img alt="20200419-fillna"
  src="{{ site.baseurl }}/images/20200419-fillna.png"/>
</p>

## 19. Removing duplicates
Indicate duplicate Series values.<br>
[`Series.duplicated(self, keep='first')`][duplicated]
- `keep`: {‘first’, ‘last’, False}, default ‘first’.
Method to handle dropping duplicates:
    * `first` : Mark duplicates as True except for the first occurrence.
    * `last` : Mark duplicates as True except for the last occurrence.
    * `False` : Mark all duplicates as True.

<p align="center">
  <img alt="20200419-duplicated"
  src="{{ site.baseurl }}/images/20200419-duplicated.png"/>
</p>

Return Series with duplicate values removed.<br>
[`Series.drop_duplicates(self, keep='first', inplace=False)[source]`][drop_duplicates]

<p align="center">
  <img alt="20200419-drop_duplicates"
  src="{{ site.baseurl }}/images/20200419-drop_duplicates.png"/>
</p>

## 20. map
Map values of Series according to input correspondence.<br>
Used for substituting each value in a Series with another value, that may be
derived from a function, a `dict` or a Series.<br>
[`Series.map(self, arg, na_action=None)`][map]

<p align="center">
  <img alt="20200419-map"
  src="{{ site.baseurl }}/images/20200419-map.png"/>
</p>

## 21. apply
Invoke function on values of Series.<br>
Can be ufunc (a NumPy function that applies to the entire Series) or a Python
function that only works on single values.<br>

[`Series.apply(self, func, convert_dtype=True, args=(), **kwds)`][apply]

<p align="center">
  <img alt="20200419-apply"
  src="{{ site.baseurl }}/images/20200419-apply.png"/>
</p>

## 22. replace
Replace values given in to_replace with value.<br>
[`Series.replace(self, to_replace=None, value=None, inplace=False, limit=None, regex=False, method='pad')`][replace]

<p align="center">
  <img alt="20200419-replace"
  src="{{ site.baseurl }}/images/20200419-replace.png"/>
</p>

## 23. concat
Concatenate pandas objects along a particular axis with optional set logic along the other axes.<br>
[`pandas.concat(objs, Mapping, axis=0, join='outer', ignore_index=False, keys=None, levels=None, names=None, verify_integrity=False, sort=False, copy=True)`][concat]

<p align="center">
  <img alt="20200419-concat-1"
  src="{{ site.baseurl }}/images/20200419-concat-1.png"/>
</p>

<p align="center">
  <img alt="20200419-concat-2"
  src="{{ site.baseurl }}/images/20200419-concat-2.png"/>
</p>

## 24. numpy.where()
Return elements chosen from x or y depending on condition.<br>
[`numpy.where(condition[, x, y])`][numpy-where]

<p align="center">
  <img alt="20200419-np-where"
  src="{{ site.baseurl }}/images/20200419-np-where.png"/>
</p>

## Reference
- Wes McKinney. 2017. Python for Data Analysis DATA WRANGLING WITH PANDAS, NUMPY, AND IPYTHON
- Mikkekylilt, "snake python animal reptile snakes", _pixabay.com_. [Online].
Available: [https://pixabay.com/photos/snake-python-animal-reptile-snakes-4201970/][img]

[pandas-Series]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.html
[series-reindex]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.reindex.html
[series-drop]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.drop.html
[pandas-isnull]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.isnull.html
[sort_index]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.sort_index.html
[sort_values]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.sort_values.html
[series-rank]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.rank.html
[is_unique]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.is_unique.html
[value_counts]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.value_counts.html
[fillna]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.fillna.html
[duplicated]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.duplicated.html
[drop_duplicates]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.drop_duplicates.html
[map]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.map.html
[apply]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.apply.html
[replace]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.replace.html
[concat]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.concat.html
[numpy-where]: https://numpy.org/doc/stable/reference/generated/numpy.where.html?highlight=numpy%20where#numpy.where
[img]: https://pixabay.com/photos/snake-python-animal-reptile-snakes-4201970/
