---
layout:      post
title:       "Introduction to pandas data structures"
date:        "2018-05-10 14:49:48 +0200"
tags:        [python3, pandas, data-structure]
comments:    true
---

[`pandas`][pandas] provides high-level data structures and functions designed to
make working with structured or tabular data fast, easy and expressive.
In this blog I'll introduce 2 workhorse data structures: _Series_ and _DataFrame_.

## Series

A Series is a one-dimensional array-like object containing a sequence of values
and an associated array of data labels, called its _index_.

The simplest way to form a series is:

{% highlight python %}
>>> import pandas as pd
>>> obj = pd.Series([4, -7, 2, 1])
>>> obj
0    4
1   -7
2    2
3    1
dtype: int64
{% endhighlight %}

The string representation of a Series displayed interactively shows the index on
the left and the values on the right. If you want to specify index, using `index`
parameter in `pd.Series()` will be helpful. You can get the array representation
and index object of the Series via its values and index attributes, respectively:

{% highlight python %}
>>> obj.index
RangeIndex(start=0, stop=4, step=1)
>>> obj.values
array([ 4, -7,  2,  1])
{% endhighlight %}

Compared with NumPy arrays, you can use labels in the index when selecting
single values or a set of values:

{% highlight python %}
>>> obj[1]
-7
>>> obj[2] = 6
>>> obj
0    4
1   -7
2    6
3    1
dtype: int64
{% endhighlight %}

Another way to think about a Series is as a fixed-length, ordered dict, as it is
a mapping of index values to data values. You should have data contained in a
Python dict, you can create a Series from it by passing the dict:

{% highlight python %}
>>> sdata = {'Ohio': 35000, 'Texas': 80000, 'Utah': 9000}
>>> obj2 = pd.Series(sdata)
>>> obj2
Ohio     35000
Texas    80000
Utah      9000
dtype: int64
{% endhighlight %}

Both the Series object itself and its index have a `name` attribute, which
integrated with other key areas of pandas functionality:

{% highlight python %}
>>> obj2.name = 'population'
>>> obj2.index.name = 'state'
>>> obj2
state
Ohio     35000
Texas    80000
Utah      9000
Name: population, dtype: int64
{% endhighlight %}

A Serie's index can be altered in-place by assignment:

{% highlight python %}
>>> obj
0    4
1   -7
2    6
3    1
dtype: int64

>>> obj.index = ['A', 'B', 'C', 'D']
>>> obj
A    4
B   -7
C    6
D    1
dtype: int64
{% endhighlight %}

## DataFrame

A DataFrame represents a rectangular table of data and contains an ordered
collection of columns, each of which can be a different value type (numeric,
string, boolean, etc.). There are many ways to construct a DataFrame, though one
of the most common is from a dict of equal-length lists or NumPy arrays:

{% highlight python %}
>>> data = {'state': ['Ohio', 'Ohio', 'Nevada'],
...         'year': [2000, 2001, 2001],
...         'pop': [1.5, 1.7, 3.6]}
>>> df = pd.DataFrame(data, columns=['year', 'state', 'pop'])
>>> df
   year   state  pop
0  2000    Ohio  1.5
1  2001    Ohio  1.7
2  2001  Nevada  3.6
{% endhighlight %}

The `columns` parameter is used to arrange the columns in that order. If not,
they are placed in sorted order.  

A column in a DataFrame can be retrieved as a Series either by dict-like
notation or by attribute:

{% highlight python %}
>>> df['state']
0      Ohio
1      Ohio
2    Nevada
Name: state, dtype: object

>>> df.year
0    2000
1    2001
2    2001
Name: year, dtype: int64
{% endhighlight %}

Columns can be modified by assignment. For example, the empty 'debt' column
could be assigned a scalar value or an array of values

{% highlight python %}
>>> df['debt'] = 16
>>> df
   year   state  pop  debt
0  2000    Ohio  1.5    16
1  2001    Ohio  1.7    16
2  2001  Nevada  3.6    16
{% endhighlight %}

Assigning a column that doesn't exist will create a new column. The `del`
keyword will delete columns as with a dict.

{% highlight python %}
>>> data = {'state': ['Ohio', 'Ohio', 'Nevada'],
...         'year': [2000, 2001, 2001],
...         'pop': [1.5, 1.7, 3.6]}
>>> df2 = pd.DataFrame(data, columns=['year', 'state', 'pop'])

>>> df2['eastern'] = df2['state'] == 'Ohio'
>>> df2
   year   state  pop  eastern
0  2000    Ohio  1.5     True
1  2001    Ohio  1.7     True
2  2001  Nevada  3.6    False

>>> del df2['eastern']
>>> df2
   year   state  pop
0  2000    Ohio  1.5
1  2001    Ohio  1.7
2  2001  Nevada  3.6
{% endhighlight %}

Dicts of Series are treated in much the same way:

{% highlight python %}
>>> df3 = pd.DataFrame({'Nevada': {2001: 2.4, 2002: 2.9},
...                     'Ohio': {2000: 1.2, 2001: 2.1,
...                              2002: 3.5}})
>>> df3
      Nevada  Ohio
2000     NaN   1.2
2001     2.4   2.1
2002     2.9   3.5

>>> pdata = {'Ohio': df3['Ohio'][:-1],
...          'Nevada': df3['Nevada'][:2]}
>>> pd.DataFrame(pdata)
      Nevada  Ohio
2000     NaN   1.2
2001     2.4   2.1
{% endhighlight %}

As with Series, the `values` attribute returns the data contained in the
DataFrame as a two-dimensional ndarray:

{% highlight python %}
>>> df3.values
array([[ nan,  1.2],
       [ 2.4,  2.1],
       [ 2.9,  3.5]])
{% endhighlight %}

### Notes

- `df[column]` works for any column name, but `df.column` only works when the
column name is a valid Python variable name.

### Caution

- New columns can be created with the `df[column]`, but CANNOT be created with
`df.column` syntax.
- The column returned from indexing a DataFrame is a **view** on the underlying
data, **not a copy**. Thus, any in-place modifications to the Series will be
reflected in the DataFrame. The column can be explicitly copied with the
Series's `copy` method.



## Reference

[1] Wes McKinney. 2017. "Chapter 5 Getting Started with pandas" _Python for Data
Analysis DATA WRANGLING WITH PANDAS, NUMPY, AND IPYTHON_ p 124-136


[pandas]: https://pandas.pydata.org