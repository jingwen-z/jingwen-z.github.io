---
layout:      post
title:       "Data structures - R vs Python"
date:        "2018-05-04 21:48:06 +0200"
tags:        [python3, R]
comments:    true
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---
I've learnt python since the beginning of this year. In this blog, I'll compare
the data structures in R to Python briefly.

## Array

### R

**Atomic vectors**
- one-dimensional array
- contain only one data type
- _scalars_ are one-element vectors, e.g. `f <- 3`, `g <- "US"`
- function `c()`

{% highlight r %}
v <- c("k", "j", "w", "d", "v")
> v[1]
[1] "k"
> v[c(1, 3)]
[1] "k" "w"
> v[3:4]
[1] "w", "d"
{% endhighlight %}

**Matrices**
- two-dimensional array
- each element has the same mode (numeric, character or logical)
- function `matrix()`

{% highlight r %}
m <- matrix(1:6, nrow = 2, ncol = 3)
> m
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6

> m[2, ]
[1] 2 4 6
> m[1, 3]
[1] 5
{% endhighlight %}

**Arrays**
- similar to matrices
- more than two dimensions
- function `array()` 

{% highlight r %}
dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2")

arr <- array(1:12, c(2, 3, 2), dimnames = list(dim1, dim2, dim3))
> arr
, , C1

   B1 B2 B3
A1  1  3  5
A2  2  4  6

, , C2

   B1 B2 B3
A1  7  9 11
A2  8 10 12

> arr[1,2,2]
[1] 9

> arr[1,2,]
C1 C2 
 3  9 
 
> arr[1,,]
   C1 C2
B1  1  7
B2  3  9
B3  5 11
{% endhighlight %}

### Python

- package `numpy`
- functions `numpy.array()`, `numpy.arange()`

{% highlight python %}
In [1]: import numpy
In [2]: arr_1d = numpy.array([6, 5.2, 2, 7])
In [3]: print(arr_1d)
Out[3]: array([6. , 5.2, 2. , 7. ])

In [4]: arr_2d = numpy.array([[1, 2, 3], [4, 5, 6]])
In [5]: print(arr_2d)
Out[5]:
array([[1, 2, 3],
       [4, 5, 6]])

In [6]: arr_3d = numpy.array([[[1, 2, 3], [4, 5, 6]],[[7, 8, 9], [10, 11, 12]]])
In [7]: print(arr_3d)
Out[7]:
array([[[ 1,  2,  3],
        [ 4,  5,  6]],
       [[ 7,  8,  9],
        [10, 11, 12]]])
{% endhighlight %}

## List

### R

- an ordered collection of objects
- allow to gather a variety of objects under one name

{% highlight r %}
str <- "My first list"
mtx <- matrix(1:6, nrow = 3)
intVtr <- c(5, 7, 32, 19)
strVtr <- c("one", "two")

mylist <- list(title = str, ages = intVtr, mtx, strVtr)
> mylist
$title
[1] "My first list"

$ages
[1]  5  7 32 19

[[3]]
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

[[4]]
[1] "one" "two"

> mylist[[2]]
[1]  5  7 32 19
> mylist[["ages"]]
[1]  5  7 32 19
{% endhighlight %}

### Python

- variable-length
- can be modified in-place
- `[]`, `list()`
- methods: `append()`, `insert()`, `pop()`, `remove()`, `extend()`, `sort()`

{% highlight python %}
In [1]: a_list = [2, 7, None]
In [2]: print(a_list)
Out[2]: [2, 7, None]

In [3]: b_list = list(('foo', 'bar'))
In [4]: b_list[1] = 'pee'
In [5]: print(b_list)
Out[5]: ['foo', 'pee']
{% endhighlight %}

## Dataframe

### R

- `data.frame()`

{% highlight r %}
patientId <- c(1, 2, 3)
age <- c(34, 23, 7)
diabetes <- c("Type1", "Type2", "Type1")
status <- c("Poor", "Excellent", "Improved")
patientDF <- data.frame(patientId, age, diabetes, status)

> patientDF
  patientId age diabetes    status
1         1  34    Type1      Poor
2         2  23    Type2 Excellent
3         3   7    Type1  Improved

> patientDF[1:2]
  patientId age
1         1  34
2         2  23
3         3   7

> patientDF[1, ]
  patientId age diabetes status
1         1  34    Type1   Poor

> patientDF[c("patientId", "age")]
  patientId age
1         1  34
2         2  23
3         3   7

> patientDF$age
[1] 34 23  7
{% endhighlight %}

### Python

- contain an ordered collection of columns
- have both row and column index
- package `pandas`
- `pandas.DataFrame()`

{% highlight python %}
import pandas as pd
data = {'state': ['Ohio', 'Ohio', 'Nevada', 'Nevada'],
        'year': [2000, 2001, 2002, 2003],
        'pop': [1.5, 1.7, 3.6, 2.7]}
frame = pd.DataFrame(data, columns=['year', 'state', 'pop'])
In [1]: print(frame)
Out[1]:
   year   state  pop
0  2000    Ohio  1.5
1  2001    Ohio  1.7
2  2002  Nevada  3.6
3  2003  Nevada  2.7
{% endhighlight %}

Besides, there are some data structures which don't exist in both R and Python:

## Factors (R)

- nominal / ordinal / continuous
- `factor()`

{% highlight r %}
patientId <- c(1, 2, 3)
age <- c(34, 23, 7)
diabetes <- c("Type1", "Type2", "Type1")
status <- c("Poor", "Excellent", "Improved")
diabetes <- factor(diabetes)
status <- factor(status, order = T)

patientDF <- data.frame(patientId, age, diabetes, status)

> str(patientDF)
'data.frame':	3 obs. of  4 variables:
 $ patientId: num  1 2 3
 $ age      : num  34 23 7
 $ diabetes : Factor w/ 2 levels "Type1","Type2": 1 2 1
 $ status   : Ord.factor w/ 3 levels "Excellent"<"Improved"<..: 3 1 2

> summary(patientDF)
   patientId        age         diabetes       status 
 Min.   :1.0   Min.   : 7.00   Type1:2   Excellent:1  
 1st Qu.:1.5   1st Qu.:15.00   Type2:1   Improved :1  
 Median :2.0   Median :23.00             Poor     :1  
 Mean   :2.0   Mean   :21.33                          
 3rd Qu.:2.5   3rd Qu.:28.50                          
 Max.   :3.0   Max.   :34.00 
{% endhighlight %}

## Tuple (Python)

- fixed-length
- immutable
- `tuple()`

{% highlight python %}
In [1]: tup_int = 4, 5, 6
In [2]: print(tup_int)
Out[2]: (4, 5, 6)

In [3]: tup_str = tuple('string')
In [4]: print(tup_str)
Out[4]: ('s', 't', 'r', 'i', 'n', 'g')
In [5]: tup_str[0]
Out[5]: 's'
{% endhighlight %}

## Dict (Python)

- hash map, associative array
- key-value pairs
- `{}`, `,`
- methods: `del`, `pop()`, `update()`

{% highlight python %}
empty_dict = {}
d1 = {'a': 'some value', 'b': [1, 2]}
In [1]: print(d1)
Out[1]: {'a': 'some value', 'b': [1, 2]}

d1[7] = 'an integer'
In [2]: print(di)
Out[2]: {'a': 'some value', 'b': [1, 2], 7: 'an integer'}
In [3]: print(d1['b'])
Out[3]: [1, 2]
{% endhighlight %}

## Set (Python)

- unordered collection
- unique element
- `set()`, `{}`
- set operations: union, intersection, difference, symmetric difference

{% highlight python %}
In [1]: print(set([2, 2, 1, 3]))
Out[1]: {1, 2, 3}
In [2]: print({2, 2, 1, 3})
Out[2]: {1, 2, 3}
{% endhighlight %}

## List, Set and Dict comprehensions (Python)

- form a new list by filtering the elements of a collection
- transform the elements passing the filter in one concise expression

- list comprehension
`[expr for val in collection if condition]`

- dict comprehension
`dict_comp = {key-expr : value-expr for value in collection if condition}`

- set comprehension
`set_comp = {expr for value in collection if condition}`
