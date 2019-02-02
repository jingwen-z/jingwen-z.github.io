---
layout:             post
title:              "Python: for loop"
date:               2019-01-29 22:50:19 +0100
last_modified_at:   2019-02-07 12:16:44 +0100
comments:           true
excerpt:            >
    This blog presents for loop for multiple data structures, like loop over a
    range, loop over a string, loop over a numpy array, loop over a list, loop
    over a dictionary, loop over a series and loop over a dataframe.
img_url:            /images/20190129-python-for-loop.jpg
img_width:          1280
img_height:         853
---

<p align="center">
  <img alt="Python while loop flow diagram"
  src="{{ site.baseurl }}/images/20190129-python-for-loop.jpg"/>
</p>

`for` loops are traditionally used when you have a block of code which you want
to repeat a fixed number of times. The Python for statement iterates over the
members of a sequence in order, executing the block each time. In this blog,
except for `for` loop's syntax and flow diagram, I'll also talk about how to
achieve loops over:
- a range
- a string
- a `numpy array`
- a list
- a list of lists
- a dictionary
- a series
- a dataframe

## Syntax
{% highlight python %}
for iterating_var in sequence:
    statements(s)
{% endhighlight %}

## Flow diagram
If a `sequence` contains an expression list, it is evaluated first. Then, the
first item in the `sequence` is assigned to the iterating variable
`iterating_var`. Next, the `statements` block is executed. Each item in the
list is assigned to `iterating_var`, and the `statement(s)` block is executed
until the entire `sequence` is exhausted.

## Loop of a range
{% highlight python %}
>>> for x in range(0, 7):
...     print(x)
...
0
1
2
3
4
5
6
{% endhighlight %}

## Loop of a string
{% highlight python %}
>>> for x in 'Hi, Python':
...     print(x)
...
H
i
,

P
y
t
h
o
n
{% endhighlight %}

## Loop of a numpy array
{% highlight python %}
>>> import numpy as np
>>> np_height = np.array([3, 21, 4, 54, 23])
>>> for height in np_height:
...     print(height)
...
3
21
4
54
23
{% endhighlight %}
The iterator object `nditer` provides many flexible ways to visit all the
elements of one or more arrays in a systematic fashion.

{% highlight python %}
>>> for height in np.nditer(np_height):
...     print(height)
...
3
21
4
54
23
{% endhighlight %}

## Loop of a list
{% highlight python %}
>>> areas = [11.25, 18.0, 20.0, 10.75, 9.50]
>>> for area in areas:
...     print(area)
...
11.25
18.0
20.0
10.75
9.5
{% endhighlight %}

`enumerate` is a built-in function of Python. It allows us to loop over
something and have an automatic counter.

{% highlight python %}
>>> for counter, value in enumerate(areas):
...     print(counter, value)
...
0 11.25
1 18.0
2 20.0
3 10.75
4 9.5
{% endhighlight %}

## Loop of a list of lists
{% highlight python %}
>>> house = [["hallway", 11.25],
...          ["kitchen", 18.0],
...          ["living room", 20.0],
...          ["bedroom", 10.75],
...          ["bathroom", 9.50]]
>>> for room, area in house:
...     print('The ' + str(room) + ' is ' + str(area) + ' sqm.')
...
The hallway is 11.25 sqm.
The kitchen is 18.0 sqm.
The living room is 20.0 sqm.
The bedroom is 10.75 sqm.
The bathroom is 9.5 sqm.
{% endhighlight %}

## Loop of a dictionary
{% highlight python %}
>>> europe = {'Spain': 'Madrid',
...           'France': 'Paris',
...           'Germany': 'Berlin',
...           'Norway': 'Oslo',
...           'Italy': 'Rome',
...           'Poland': 'Warsaw',
...           'Australia': 'Canberra'}
>>> for key, value in europe.items():
...     print('The capital of ' + str(key) + ' is ' + str(value) + '.')
...
The capital of Spain is Madrid.
The capital of France is Paris.
The capital of Germany is Berlin.
The capital of Norway is Oslo.
The capital of Italy is Rome.
The capital of Poland is Warsaw.
The capital of Australia is Canberra.
{% endhighlight %}

**Remark:**
`dict.items()` returns iterator object. `dict.iteritems()` is removed in
python3.

## Loop of a series
{% highlight python %}
>>> import pandas as pd
>>> ser = pd.Series([4, -7, 2, 1])
>>> for v in ser:
...     print(v)
...
4
-7
2
1
{% endhighlight %}

Both `pandas.Series.items` and `pandas.Series.iteritems` lazily iterate over
(index, value) tuples.

{% highlight python %}
>>> for i, v in ser.items():
...     print(i, v)
...
0 4
1 -7
2 2
3 1
{% endhighlight %}

{% highlight python %}
>>> for i, v in ser.iteritems():
...     print(i, v)
...
0 4
1 -7
2 2
3 1
{% endhighlight %}

## Loop of a dataframe
{% highlight python %}
>>> df = pd.DataFrame({'state': ['Ohio', 'Ohio', 'Nevada'],
...                    'year': [2000, 2001, 2001],
...                    'pop': [1.5, 1.7, 3.6]})
>>> for i, v in df.iterrows():
...     print(i, v)
...
0 state    Ohio
year     2000
pop       1.5
Name: 0, dtype: object
1 state    Ohio
year     2001
pop       1.7
Name: 1, dtype: object
2 state    Nevada
year       2001
pop         3.6
Name: 2, dtype: object
{% endhighlight %}

`pandas.DataFrame.iterrows` iterates over dataFrame rows as (index, Series)
pairs.

## Conclusion
In this blog, we talked about syntax of `for` loop, and its applications: loop
over a range, loop over a string, loop over a numpy array, loop over a list,
loop over a dictionary, loop over a series and loop over a dataframe. Hope it's
useful for you :)


## Reference
- SciPy.org, _Iterating Over Arrays_, viewed 29 January 2019, <https://docs.scipy.org/doc/numpy/reference/arrays.nditer.html#arrays-nditer>.
- PythonTips, _Enumerate_, viewed 29 January 2019, <http://book.pythontips.com/en/latest/enumerate.html>.
- pandas 0.24.0 documentation, _pandas.Series_, viewed 29 January 2019, <https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.Series.html>.
- pandas 0.24.0 documentation, _pandas.DataFrame.iterrows_, viewed 29 January 2019, <https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.iterrows.html>.
- tutorialspoint, _Python for Loop Statements_, viewed 7 February 2019, <http://www.tutorialspoint.com/python/python_for_loop.htm>.