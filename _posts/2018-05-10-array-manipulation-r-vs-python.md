---
layout:      post
title:       "Array manipulation - R vs Python"
lang:        en
date:        "2018-05-10 14:19:19 +0200"
tags:        [python3, R, data-structure]
permalink:         /array-manipulation-r-vs-python/
comments:    true
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

In this blog, I will talk about array manipulation via R and Python. You will
see how to create an array, insert and delete an element from a 1d-array and a
2d-array.


## Creating arrays

### R
{% highlight r %}
dim1 <- c("one", "two", "three", "four")
dim2 <- c("A", "B", "C")

arr_2d <- array(1:12, dim = c(4, 3), dimnames = list(dim1, dim2))
> arr_2d
      A B  C
one   1 5  9
two   2 6 10
three 3 7 11
four  4 8 12

> class(arr_2d)
[1] "matrix"

> dim(arr_2d)
[1] 4 3

> is.numeric(array_2d)
[1] TRUE
{% endhighlight %}

### Python
{% highlight python %}
import numpy as np
arr_2d = np.array([[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]])
>>> arr_2d
array([[ 1,  5,  9],
       [ 2,  6, 10],
       [ 3,  7, 11],
       [ 4,  8, 12]])

>>> type(arr_2d)
<class 'numpy.ndarray'>

>>> arr_2d.shape
(4, 3)

>>> arr_2d.dtype
dtype('int64')
{% endhighlight %}

## Indexing

### R
{% highlight r %}
> arr_2d[1, 2]
[1] 5

> arr_2d[, 2]
  one   two three  four 
    5     6     7     8 

> arr_2d[, c("A", "C")]
      A  C
one   1  9
two   2 10
three 3 11
four  4 12
{% endhighlight %}

### Python
{% highlight python %}
>>> arr_2d[0, 1]
5

>>> arr_2d[0][1]
5

>>> arr_2d[0]
array([1, 5, 9])

>>> arr_2d[:, 1]
array([5, 6, 7, 8])

>>> arr_2d[:, [0,2]]
array([[ 1,  9],
       [ 2, 10],
       [ 3, 11],
       [ 4, 12]])
{% endhighlight %}

## Inserting an element into 1d-array

### R
{% highlight r %}
> arr_1d <- c("k", "j", "w", "d", "v")
> arr_1d
[1] "k" "j" "w" "d" "v"

> arr_1d <- append(arr_1d, "q", after = 3)
> arr_1d
[1] "k" "j" "w" "q" "d" "v"
{% endhighlight %}

### Python
{% highlight python %}
>>> import numpy as np
>>> arr_1d = np.array([3, 5, 1, 3])
>>> arr_1d
array([3, 5, 1, 3])

>>> arr_1d = np.append(arr_1d, [7])
>>> arr_1d
array([3, 5, 1, 3, 7])
{% endhighlight %}

## Inserting an element into 2d-array

### R
{% highlight r %}
> arr_2d <- matrix(1:9, ncol = 3)
> arr_2d
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

> arr_2d <- rbind(arr_2d, c(7, 77, 777))
> arr_2d
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
[4,]    7   77  777
{% endhighlight %}

### Python
{% highlight python %}
>>> import numpy as np
>>> arr_2d  = np.array([[1, 1], [2, 2], [3, 3]])
>>> arr_2d
array([[1, 1],
       [2, 2],
       [3, 3]])

>>> arr_2d = np.insert(arr_2d, 1, 5, axis=1)
>>> arr_2d
array([[1, 5, 1],
       [2, 5, 2],
       [3, 5, 3]])
{% endhighlight %}

## Removing an element from 1d-array

### R
{% highlight r %}
> arr_1d <- arr_1d[-5]
> arr_1d
[1] "k" "j" "w" "q" "v"
{% endhighlight %}

### Python
{% highlight python %}
>>> arr = np.array([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
>>> arr
array([[ 1,  2,  3,  4],
       [ 5,  6,  7,  8],
       [ 9, 10, 11, 12]])

>>> arr = np.delete(arr, [1, 3, 5], None)
>>> arr
array([ 1,  3,  5,  7,  8,  9, 10, 11, 12])
{% endhighlight %}

## Removing an element from 2d-array

### R
{% highlight r %}
> arr_2d[, -1]
     [,1] [,2]
[1,]    4    7
[2,]    5    8
[3,]    6    9
[4,]   77  777
{% endhighlight %}

### Python
{% highlight python %}
>>> arr = np.array([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
>>> arr
array([[ 1,  2,  3,  4],
       [ 5,  6,  7,  8],
       [ 9, 10, 11, 12]])

>>> arr = np.delete(arr, 1, 0)
>>> arr
array([[ 1,  2,  3,  4],
       [ 9, 10, 11, 12]])
{% endhighlight %}
