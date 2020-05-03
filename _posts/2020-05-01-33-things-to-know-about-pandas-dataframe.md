---
layout:      post
title:       "33 things to know about pandas dataframe"
date:        "2020-05-01 10:37:21 +0200"
tags:        [python3, pandas, dataframe]
comments:    true
excerpt:     >
    33 things to know about pandas dataframe
img_url:     /images/20200501-python.jpg
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="20200501-python"
  src="{{ site.baseurl }}/images/20200501-python.jpg"/>
</p>

To get start with `pandas`, you need to get confortable with its two data
structures: series and dataframe. In this blog, we will talk about multiple
applications of dataframe.

## 1. Creating a dataframe
Two-dimensional, size-mutable, potentially heterogeneous tabular data.
Data structure also contains labeled axes (rows and columns). Arithmetic
operations align on both row and column labels. Can be thought of as a dict-like
container for Series objects. The primary pandas data structure.

[`pandas.DataFrame(data=None, index= None, columns= None, dtype= None, copy= False)`][pandas-df]

{% highlight python %}
import pandas as pd

data = {'state': ['Ohio', 'Ohio', 'Nevada', 'Nevada'],
        'Year':[2000, 2001, 2000, 2001],
        'pop':[1.5, 1.7, 2.4, 2.9]}

df1 = pd.DataFrame(data)
{% endhighlight %}

<p align="center">
  <img alt="20200501-creation"
  src="{{ site.baseurl }}/images/20200501-creation.png"/>
</p>

## 2. Creating a new column
[`DataFrame.insert(self, loc, column, value, allow_duplicates=False)`][df-insert]

{% highlight python %}
# method 1: Insert column into DataFrame as the last column.
df1['new1'] = ['n1', 'n2', 'n3', 'n4']
# method 2: Insert column into DataFrame at specified location.
df1.insert(loc=1, column='new2', value=2)
{% endhighlight %}

<p align="center">
  <img alt="20200501-new-col"
  src="{{ site.baseurl }}/images/20200501-new-col.png"/>
</p>

/!\ `df[column]` works for any column name, but df.column only works when the
column name is a valid Python variable name.

## 3. del
`del` method can be used to remove one column.

<p align="center">
  <img alt="20200501-del"
  src="{{ site.baseurl }}/images/20200501-del.png"/>
</p>

## 4. .columns
Return the column labels of the DataFrame.

<p align="center">
  <img alt="20200501-columns"
  src="{{ site.baseurl }}/images/20200501-columns.png"/>
</p>

## 5. Rename column
[`DataFrame.rename(self, mapper=None, index=None, columns=None, axis=None, copy=True, inplace=False, level=None, errors='ignore')`]

<p align="center">
  <img alt="20200501-rename-cols"
  src="{{ site.baseurl }}/images/20200501-rename-cols.png"/>
</p>

## 6. index
Return the index (row labels) of the DataFrame.

<p align="center">
  <img alt="20200501-index"
  src="{{ site.baseurl }}/images/20200501-index.png"/>
</p>

## 7. hierarchical indexing
Hierarchical indexing is an important feature of pandas that enables you to have
multiple (two or more) index levels on an axis. It provides a way for working
with higher dimensional data in a lower dimensional form.

{% highlight python %}
df = pd.DataFrame(np.arange(12).reshape((4, 3)),
                  index=[['a', 'a', 'b', 'b'], [1, 2, 1, 2]],
                  columns=[['Ohio', 'Ohio', 'Colorado'], ['Green', 'Red', 'Green']])
{% endhighlight %}

<p align="center">
  <img alt="20200501-hierarchical-indexing"
  src="{{ site.baseurl }}/images/20200501-hierarchical-indexing.png"/>
</p>

## 8. reindex
An important method on pandas objects is `reindex`, which means to create a new
object with the data consormed to a new index.

[`DataFrame.reindex(self, labels=None, index=None, columns=None, axis=None, method=None, copy=True, level=None, fill_value=nan, limit=None, tolerance=None)`][df-reindex]

`method`: {None, ‘backfill’/’bfill’, ‘pad’/’ffill’, ‘nearest’}
Method to use for filling holes in reindexed DataFrame. Please note: this is
only applicable to DataFrames/Series with a monotonically increasing/decreasing
index.
- `None` (default): don’t fill gaps
- `pad` / `ffill`: Propagate last valid observation forward to next valid.
- `backfill` / `bfill`: Use next valid observation to fill gap.
- `nearest`: Use nearest valid observations to fill gap.

<p align="center">
  <img alt="20200501-reindex"
  src="{{ site.baseurl }}/images/20200501-reindex.png"/>
</p>

## 9. drop
`drop` method returns a new object with the indicated value or values deleted
from an axis.

[`DataFrame.drop(self, labels=None, axis=0, index=None, columns=None, level=None, inplace=False, errors='raise')`][df-drop]

<p align="center">
  <img alt="20200501-drop"
  src="{{ site.baseurl }}/images/20200501-drop.png"/>
</p>

## 10. Selection, filtering
Dataframe indexing (`df[...]`) works analogously to NumPy array indexing, except
you can use the Dataframe's index values instead of only integers.

<p align="center">
  <img alt="20200501-selection-1"
  src="{{ site.baseurl }}/images/20200501-selection-1.png"/>
</p>

Moreover, you can also select a subset of the rows from a series with NumPy-like
notation using either axis labels (`loc`) or integers (`iloc`).

<p align="center">
  <img alt="20200501-selection-2"
  src="{{ site.baseurl }}/images/20200501-selection-2.png"/>
</p>

We can also apply `df[condition]` to get only the rows that satisfy the condition.

<p align="center">
  <img alt="20200501-selection-3"
  src="{{ site.baseurl }}/images/20200501-selection-3.png"/>
</p>

## 11. Transpose the dataframe
`df.T`

<p align="center">
  <img alt="20200501-transpose"
  src="{{ site.baseurl }}/images/20200501-transpose.png"/>
</p>

## 12. Arithmetic method

<p align="center">
  <img alt="20200501-arithmetic"
  src="{{ site.baseurl }}/images/20200501-arithmetic.png"/>
</p>

## 13. apply, applymap, map
- `apply`: Invoke function on values of Series.<br>
Can be ufunc (a NumPy function that applies to the entire Series) or a Python
function that only works on single values.
- `map`: Map values of Series according to input correspondence.<br>
Used for substituting each value in a Series with another value, that may be
derived from a function, a `dict` or a Series.

<p align="center">
  <img alt="20200501-apply-map"
  src="{{ site.baseurl }}/images/20200501-apply-map.png"/>
</p>

## 14. sorting
[`DataFrame.sort_index(self, axis=0, level=None, ascending=True, inplace=False, kind='quicksort', na_position='last', sort_remaining=True, ignore_index: bool = False)`][df-sort-index]

<p align="center">
  <img alt="20200501-sort-index"
  src="{{ site.baseurl }}/images/20200501-sort-index.png"/>
</p>

[`DataFrame.sort_values(self, by, axis=0, ascending=True, inplace=False, kind='quicksort', na_position='last', ignore_index=False)`][df-sort-values]

<p align="center">
  <img alt="20200501-sort-values"
  src="{{ site.baseurl }}/images/20200501-sort-values.png"/>
</p>

## 15. reset_index
Reset the index of the DataFrame, and use the default one instead. If the
DataFrame has a MultiIndex, this method can remove one or more levels.

[`DataFrame.reset_index(self, level= None, drop=False, inplace=False, col_level=0, col_fill='')`][reset-index]

`drop`: bool, default False. Do not try to insert index into dataframe columns.
This resets the index to the default integer index.

<p align="center">
  <img alt="20200501-reset-index"
  src="{{ site.baseurl }}/images/20200501-reset-index.png"/>
</p>

## 16. ranking
[`DataFrame.rank(self, axis=0, method='average', numeric_only=None, na_option='keep', ascending=True, pct=False)`][rank]

<p align="center">
  <img alt="20200501-ranking"
  src="{{ site.baseurl }}/images/20200501-ranking.png"/>
</p>

## 17. .isin()
Return whether each element in the DataFrame is contained in values.

<p align="center">
  <img alt="20200501-isin"
  src="{{ site.baseurl }}/images/20200501-isin.png"/>
</p>

## 18. is_unique
Return boolean if values in the object are unique.

<p align="center">
  <img alt="20200501-is-unique"
  src="{{ site.baseurl }}/images/20200501-is-unique.png"/>
</p>

## 19. Computing descriptive statistics

<p align="center">
  <img alt="20200501-stat"
  src="{{ site.baseurl }}/images/20200501-stat.png"/>
</p>

## 20. Importing a dataframe
Read a comma-separated values (csv) file into DataFrame:<br>
[`pandas.read_csv()`][pandas-read-csv]

Read general delimited file into DataFrame:<br>
[`pandas.read_table()`][pandas-read-table]

Read an Excel file into a pandas DataFrame:<br>
[`pandas.read_excel()`][pandas-read-excel]

<p align="center">
  <img alt="20200501-read-csv"
  src="{{ site.baseurl }}/images/20200501-read-csv.png"/>
</p>

## 21. Exporting a dataframe
Write object to a comma-separated values (csv) file:<br>
[`DataFrame.to_csv()`][to-csv]

Write object to an Excel sheet:<br>
[`DataFrame.to_excel()`][to-table]

<p align="center">
  <img alt="20200501-export-df"
  src="{{ site.baseurl }}/images/20200501-export-df.png"/>
</p>

## 22. dropna & fillna
Remove missing values.<br>
[`DataFrame.dropna(self, axis=0, how='any', thresh=None, subset=None, inplace=False)`][drop-na]

`how`: {‘any’, ‘all’}, default ‘any’.
Determine if row or column is removed from DataFrame, when we have at least one NA or all NA.
- `any` : If any NA values are present, drop that row or column.
- `all` : If all values are NA, drop that row or column.

<p align="center">
  <img alt="20200501-dropna"
  src="{{ site.baseurl }}/images/20200501-dropna.png"/>
</p>

Fill NA/NaN values using the specified method.<br>
[`DataFrame.fillna(self, value=None, method=None, axis=None, inplace=False, limit=None, downcast=None)`][fill-na]

`method`: {‘backfill’, ‘bfill’, ‘pad’, ‘ffill’, None}, default None.
Method to use for filling holes in reindexed Series.
- `pad` / `ffill`: propagate last valid observation forward to next valid
- `backfill` / `bfill`: use next valid observation to fill gap.

<p align="center">
  <img alt="20200501-fillna"
  src="{{ site.baseurl }}/images/20200501-fillna.png"/>
</p>

## 23. Removing duplicates
Return boolean Series denoting duplicate rows.<br>
[`DataFrame.duplicated(self, subset=None, keep='first')`][df-duplicated]

`keep`: {‘first’, ‘last’, False}, default ‘first’.
Determines which duplicates (if any) to mark.
- `first` : Mark duplicates as True except for the first occurrence.
- `last` : Mark duplicates as True except for the last occurrence.
- `False` : Mark all duplicates as True.

[`DataFrame.drop_duplicates(self, subset=None, keep='first', inplace=False, ignore_index=False)`][drop-duplicates]

<p align="center">
  <img alt="20200501-duplicates"
  src="{{ site.baseurl }}/images/20200501-duplicates.png"/>
</p>

## 24. Dummy variables
Convert categorical variable into dummy/indicator variables.<br>
[`pandas.get_dummies(data, prefix=None, prefix_sep='_', dummy_na=False, columns=None, sparse=False, drop_first=False, dtype=None)`][get-dummies]

<p align="center">
  <img alt="20200501-dummy"
  src="{{ site.baseurl }}/images/20200501-dummy.png"/>
</p>

## 25. merge
Merge DataFrame or named Series objects with a database-style join.<br>
The join is done on columns or indexes. If joining columns on columns, the
DataFrame indexes will be ignored. Otherwise if joining indexes on indexes or
indexes on a column or columns, the index will be passed on.

[`pandas.merge(left, right, how='inner', on=None, left_on=None, right_on=None, left_index=False, right_index=False, sort=False, suffixes=('_x', '_y'), copy=True, indicator=False, validate=None)`][merge]

`how`:{‘left’, ‘right’, ‘outer’, ‘inner’}, default ‘inner’.
Type of merge to be performed.
- `left`: use only keys from left frame, similar to a SQL left outer join; preserve key order.
- `right`: use only keys from right frame, similar to a SQL right outer join; preserve key order.
- `outer`: use union of keys from both frames, similar to a SQL full outer join; sort keys lexicographically.
- `inner`: use intersection of keys from both frames, similar to a SQL inner join; preserve the order of the left keys.

<p align="center">
  <img alt="20200501-merge1"
  src="{{ site.baseurl }}/images/20200501-merge1.png"/>
</p>

`left_on`: label or list, or array-like. Column or index level names to join on
in the left DataFrame. Can also be an array or list of arrays of the length of
the left DataFrame. These arrays are treated as if they are columns.

`right_index`: bool, default False. Use the index from the right DataFrame as
the join key. Same caveats as left_index.

<p align="center">
  <img alt="20200501-merge2"
  src="{{ site.baseurl }}/images/20200501-merge2.png"/>
</p>

## 26. join
Join columns with other DataFrame either on index or on a key column.
Efficiently join multiple DataFrame objects by index at once by passing a list.

[`DataFrame.join(self, other, on=None, how='left', lsuffix='', rsuffix='', sort=False)`][join]

<p align="center">
  <img alt="20200501-join"
  src="{{ site.baseurl }}/images/20200501-join.png"/>
</p>

## 27. concat
The `concat` function in pandas provides a consistent way to address each of
these concerns.

[`pandas.concat(objs, axis=0, join='outer', ignore_index=False, keys=None, levels=None, names=None, verify_integrity=False, sort=False, copy=True)`][concat]

<p align="center">
  <img alt="20200501-concat-1"
  src="{{ site.baseurl }}/images/20200501-concat-1.png"/>
</p>

<p align="center">
  <img alt="20200501-concat-2"
  src="{{ site.baseurl }}/images/20200501-concat-2.png"/>
</p>

## 28. pivot
Reshape data (produce a “pivot” table) based on column values. Uses unique
values from specified index / columns to form axes of the resulting
DataFrame. This function does not support data aggregation, multiple values
will result in a MultiIndex in the columns. 

[`DataFrame.pivot(self, index=None, columns=None, values=None)`][pivot]

<p align="center">
  <img alt="20200501-pivot"
  src="{{ site.baseurl }}/images/20200501-pivot.png"/>
</p>

## 29. melt
Unpivot a DataFrame from wide to long format, optionally leaving identifiers
set.

[`DataFrame.melt(self, id_vars=None, value_vars=None, var_name=None, value_name='value', col_level=None)`][melt]

<p align="center">
  <img alt="20200501-melt"
  src="{{ site.baseurl }}/images/20200501-melt.png"/>
</p>

## 30. groupby
A `groupby` operation involves some combination of splitting the object,
applying a function, and combining the results. This can be used to group large
amounts of data and compute operations on these groups.

[`DataFrame.groupby(self, by=None, axis=0, level=None, as_index=True, sort=True, group_keys=True, squeeze=False, observed=False) `][groupby]

- by list of labels:
<p align="center">
  <img alt="20200501-groupby-1"
  src="{{ site.baseurl }}/images/20200501-groupby-1.png"/>
</p>

- by mapping:
<p align="center">
  <img alt="20200501-groupby-2"
  src="{{ site.baseurl }}/images/20200501-groupby-2.png"/>
</p>

## 31. aggregation
Generate descriptive statistics.
Descriptive statistics include those that summarize the central tendency,
dispersion and shape of a dataset’s distribution, excluding NaN values.
Analyzes both numeric and object series, as well as DataFrame column sets of
mixed data types. The output will vary depending on what is provided.

[`DataFrame.describe(self, percentiles=None, include=None, exclude=None)`][describe]

<p align="center">
  <img alt="20200501-agg-1"
  src="{{ site.baseurl }}/images/20200501-agg-1.png"/>
</p>

Aggregate using one or more operations over the specified axis.<br>
[`DataFrame.agg(self, func, axis=0, *args, **kwargs)`][df-agg]

`func`: function, str, list or dict. Function to use for aggregating the data.
If a function, must either work when passed a DataFrame or when passed to
DataFrame.apply. Accepted combinations are:
- function
- string function name
- list of functions and/or function names, e.g. [np.sum, 'mean']
- dict of axis labels -> functions, function names or list of such.

- list of functions:
<p align="center">
  <img alt="20200501-agg-2"
  src="{{ site.baseurl }}/images/20200501-agg-2.png"/>
</p>

- if we pass a list of (`name`, `function`) tuples, the first element of each
tuple will be used as the dataframe column names:
<p align="center">
  <img alt="20200501-agg-3"
  src="{{ site.baseurl }}/images/20200501-agg-3.png"/>
</p>

## 32. crosstab
Compute a simple cross tabulation of two (or more) factors. By default computes
a frequency table of the factors unless an array of values and an aggregation
function are passed.

[`pandas.crosstab(index, columns, values=None, rownames=None, colnames=None, aggfunc=None, margins=False, margins_name='All', dropna=True, normalize=False)`][crosstab]

<p align="center">
  <img alt="20200501-crosstab"
  src="{{ site.baseurl }}/images/20200501-crosstab.png"/>
</p>

## 33. pivot_table
Create a spreadsheet-style pivot table as a DataFrame.
The levels in the pivot table will be stored in MultiIndex objects (hierarchical
indexes) on the index and columns of the result DataFrame.

[`pandas.pivot_table(data, values=None, index=None, columns=None, aggfunc='mean', fill_value=None, margins=False, dropna=True, margins_name='All', observed=False)`][pivot-table]

<p align="center">
  <img alt="20200501-pivot-table"
  src="{{ site.baseurl }}/images/20200501-pivot-table.png"/>
</p>

## Reference
- Wes McKinney. 2017. Python for Data Analysis DATA WRANGLING WITH PANDAS, NUMPY, AND IPYTHON
- sipa, "snake python ball python", _pixabay.com_. [Online]. Available:
[https://pixabay.com/photos/snake-python-ball-python-419043/][img]

[pandas-df]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.html
[df-insert]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.insert.html
[df-reindex]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.reindex.html
[df-drop]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.drop.html
[df-sort-index]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.sort_index.html
[df-sort-values]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.sort_values.html
[reset-index]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.reset_index.html?highlight=reset_index#pandas.DataFrame.reset_index
[rank]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.rank.html
[pandas-read-csv]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_csv.html
[pandas-read-table]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_table.html
[pandas-read-excel]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_excel.html
[to-csv]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.to_csv.html?highlight=to_csv#pandas.DataFrame.to_csv
[to-table]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.to_excel.html
[drop-na]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.dropna.html
[fill-na]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.fillna.html
[df-duplicated]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.duplicated.html
[drop-duplicates]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.drop_duplicates.html
[get-dummies]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.get_dummies.html?highlight=get_dummies#pandas.get_dummies
[merge]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.merge.html
[join]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.join.html
[concat]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.concat.html?highlight=concat
[pivot]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.pivot.html
[melt]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.melt.html
[groupby]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.groupby.html
[describe]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.describe.html
[df-agg]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.agg.html
[crosstab]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.crosstab.html
[pivot-table]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.pivot_table.html
[img]: https://pixabay.com/photos/snake-python-ball-python-419043/