---
layout:             post
title:              "How to improve pandas dataframe processing performance in Python?"
date:               "2019-09-06 20:57:01 +0200"
last_modified_at:   2020-01-06 22:18:10 +0100
tags:               [python3, dataframe, data-processing, SQL]
comments:           true
excerpt:            >
    In this blog I talked about how to improve `pandas` dataframe processing
    with the SQL query, `map` or `lambda` and some other quick tips. 
cover:              /images/20190906-speed.jpg
img_width:          1280
img_height:         853
---

<p align="center">
  <img alt="Speed"
  src="{{ site.baseurl }}/images/20190906-speed.jpg"/>
</p>

These days I cleaned my codes for different reports and analyses, which allows
the scripts to be more brief and to increase running speed. In this blog, I'll
pay particular emphasis on how to improve `pandas` dataframe processing with
the following points:
- Take advantage of SQL query
- Apply `map` or `lambda` rather than for loop
- Quick tips

## Take advantage of SQL query
Here, I only talk about Teradata SQL query.

<p align="center">
  <img alt="COALESCE"
  src="{{ site.baseurl }}/images/20190906-coalesce.png"/>
</p>

- Replace python function by `COALESCE` in Teradata SQL

In this example, I need to complete the store’s purchase price according to
"pc_dwh" and "pc_gescom". If "pc_dwh" exists, I'll take it as the store's
purchase price; if not, I'll take "pc_gescom".

At the beginning, I created a function called `get_complete_pc()` with "pc_dwh"
and "pc_gescom" as input. In fact, this rule can simply be applied by
`COALESCE` in Teradata SQL.

- Replace `pandas.merge()` by `JOIN` in SQL

Moreover, in the example above, I merged dataframes "pc_dwh" and "pc_gescom" to
get complete store's purchase price. Since I could replace the function with
`COALESCE` in Teradata SQL, I also replaced `pandas.merge()` by `JOIN` in
Teradata SQL, since SQL is good at this kind of operation.

As shown below, the processing speeds up nearly 20%!

<p align="center">
  <img alt="COALESCE result"
  src="{{ site.baseurl }}/images/20190906-coalesce-result.PNG"/>
</p>

## Apply `map` or `lambda` rather than for loop

<p align="center">
  <img alt="apply map"
  src="{{ site.baseurl }}/images/20190906-map.png"/>
</p>

In this example, I need to check if the last character of "codeInterne" is ".".
If it is, I'll just take into account its first 4 characters as "codeInterne".

At the beginning, I applies a `for` loop to iterate each row, search if the
last character is "." for each "codeInterne". However, this logic can be
implemented by `map`. As you see above, I created a function called
"update_codeInterne()" with an input "codeInterne", then map the function to
each "codeInterne".

As shown below, the processing speeds up more than thousands of times!

<p align="center">
  <img alt="apply map result"
  src="{{ site.baseurl }}/images/20190906-map-result.PNG"/>
</p>

Extended by `map` example, I'd like to share with you the general order of
precedence for performance of various operations:(click [here][r1]for more
details)

1) vectorization<br>
2) using a custom cython routine<br>
3) `apply`<br>
    a) reductions that can be performed in cython<br>
    b) iteration in python space<br>
4) `itertuples`<br>
5) `iterrows`<br>
6) updating an empty frame (e.g. using loc one-row-at-a-time)

## Quick tips
- Specifying date columns as `parse_dates` when `pandas.read_csv()`
- Applying aggregation or join in SQL, since it is good at that.
- Applying comprehensions (list comprehension, dict comprehension and set
comprehension) rather than multiple-lines for loop.

## Conclusion
In this blog I talked about how to improve `pandas` dataframe processing with
the SQL query, `map` or `lambda` and some other quick tips. Hope it's useful
for you.

## Reference
- "Does pandas iterrows have performance issues?", _stackoverflow.com_. [Online]. Available: [https://stackoverflow.com/questions/24870953/does-pandas-iterrows-have-performance-issues/24871316#24871316][r1]
- Free-Photos, "Bike riding fast moving bike motion", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/bike-riding-fast-moving-bike-motion-1149234/][image]


[r1]: https://stackoverflow.com/questions/24870953/does-pandas-iterrows-have-performance-issues/24871316#24871316
[image]: https://pixabay.com/photos/bike-riding-fast-moving-bike-motion-1149234/
