---
layout:      post
title:       "Data transformation with pandas vs. pyspark"
date:        "2020-09-08 22:09:23 +0200"
tags:        [python3, pandas, pyspark]
comments:    true
excerpt:     >
    This blog compares "pandas" and "pyspark" on data transformation with the
    following points: checking dataframe size, checking unique values of a
    column, creating a new column, filtering, selecting a list of columns,
    aggregating, renaming columns, joining 2 dataframes, creating a new
    dataframe, creating a pivot table.
cover:       /images/20200908-pandas.jpg
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

<p align="center">
  <img alt="20200716-pandas"
  src="{{ site.baseurl }}/images/20200908-pandas.jpg"/>
</p>

In recent work, I transformed data with `pyspark`. Since I often did this with
`pandas` in my previous work, I will compare these two packages on data
transformation with the following points:
- Checking dataframe size
- Checking unique values of a column
- Creating a new column
- Filtering
- Selecting a list of columns
- Aggregating
- Rename column
- Joining 2 dataframes
- Creating a new dataframe
- Creating a pivot table

## Packages
{% highlight python %}
import pandas as pd

import pyspark
from pyspark.sql import SparkSession
from pyspark.sql import functions as F
{% endhighlight %}

## Data
<p align="center">
  <img alt="20200908-data"
  src="{{ site.baseurl }}/images/20200908-data.png"/>
</p>

## pyspark vs. pandas
### Checking dataframe size
<p align="center">
  <img alt="20200908-df-size"
  src="{{ site.baseurl }}/images/20200908-df-size.png"/>
</p>

- `.count()` counts the number of rows in pyspark.
- `pandas.DataFrame.shape` returns a tuple representing the dimensionality of
the DataFrame.

### Checking unique values of a column
<p align="center">
  <img alt="20200908-unique-value"
  src="{{ site.baseurl }}/images/20200908-unique-val.png"/>
</p>

- `.select().distinct()`: distinct value of the column in pyspark is obtained by
using `select()` function along with `distinct()` function. `select()` takes up
the column name as argument, followed by `distinct()` will give distinct value
of the column.
- `pandas.unique()`: uniques are returned in order of appearance.

### Creating a new column
<p align="center">
  <img alt="20200908-new-col"
  src="{{ site.baseurl }}/images/20200908-new-col.png"/>
</p>

- `withColumn(colName, col)` returns a new dataframe by adding a column or
replacing the existing column that has the same name.

### Filtering
<p align="center">
  <img alt="20200908-filtering"
  src="{{ site.baseurl }}/images/20200908-filtering.png"/>
</p>

- `filter(condition)` filters rows using the given condition.
- We can apply `df[condition]` to get only the rows that satisfy the condition.

### Selecting a list of columns
<p align="center">
  <img alt="20200908-select-cols"
  src="{{ site.baseurl }}/images/20200908-select-cols.png"/>
</p>

- `select(*cols)` projects a set of expressions and returns a new DataFrame.
- `[[*cols]]`: we can pass a list of columns to [] to select columns in that
order.

### Aggregating
<p align="center">
  <img alt="20200908-aggregating"
  src="{{ site.baseurl }}/images/20200908-aggregating.png"/>
</p>

- `agg(*exprs)`: aggregates on the entire dataframe without groups (shorthand
for `df.groupBy.agg()`).

### Renaming columns
<p align="center">
  <img alt="20200908-rename-cols"
  src="{{ site.baseurl }}/images/20200908-rename-cols.png"/>
</p>

- `withColumnRenamed(existing, new)` returns a new DataFrame by renaming an
existing column. This is a no-op if the schema doesn’t contain the given column
name.
- `DataFrame.rename(**kwargs)` alters axes labels.

### Joining 2 dataframes
<p align="center">
  <img alt="20200908-joining"
  src="{{ site.baseurl }}/images/20200908-joining.png"/>
</p>

- `join(other, on=None, how=None)` joins with another DataFrame, using the given
join expression.
- `DataFrame.merge()`: merges DataFrame or named Series objects with a
database-style join.

### Creating a new dataframe
<p align="center">
  <img alt="20200908-new-df"
  src="{{ site.baseurl }}/images/20200908-new-df.png"/>
</p>

- `pandas.DataFrame()` creates two-dimensional, size-mutable, potentially
heterogeneous tabular data.
- `createDataFrame()` creates a dataframe from an RDD, a list or a
`pandas.DataFrame`.

### Creating a pivot table
<p align="center">
  <img alt="20200908-pivot-table"
  src="{{ site.baseurl }}/images/20200908-pivot-table.png"/>
</p>

- `pivot(pivot_col, values=None)`: pivots a column of the current DataFrame and
perform the specified aggregation. 
- `DataFrame.pivot_table()` creates a spreadsheet-style pivot table as a
dataframe.

## Reference
- "DataScience Made Simple", _datasciencemadesimple.com_. [Online]. Available: [https://www.datasciencemadesimple.com/][r1]
- "pandas", _pandas.pydata.org_. [Online]. Available: [https://pandas.pydata.org/pandas-docs/stable/index.html][pandas]
- "pyspark", _spark.apache.org_. [Online]. Available: [https://spark.apache.org/docs/latest/api/python/index.html][pyspark]
- mordilla-net, "mammal animal world cute animal", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/mammal-animal-world-cute-animal-3162194/][img]

[r1]: https://www.datasciencemadesimple.com/
[pandas]: https://pandas.pydata.org/pandas-docs/stable/index.html
[pyspark]: https://spark.apache.org/docs/latest/api/python/index.html
[img]: https://pixabay.com/photos/mammal-animal-world-cute-animal-3162194/
