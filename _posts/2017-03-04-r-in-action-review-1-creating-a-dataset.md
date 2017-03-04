---
layout: post
title: R IN ACTION Review 1 - Creating a dataset
---

In [last blog][last blog] I mentioned the book "R IN ACTION". During these days,
I read it on my way to work and home. I began from very basic knowledge (though
I have learnt them), and got some new knowledge once again. Thus, I want to note
and share them as weekly blogs. In this blog, I will talk about the knowledge of
_creating a dataset_.

## Vectors
_Vectors_ are one-dimensional arrays that can hold numeric data, character data,
or logical data. The combine function `c()` is used to form the vector. You can
refer to elements of a vector using a numeric vector of positions within
brackets. For example, `a[c(2, 4)]` refers to the second and fourth elements of
vector `a`.

## Matrices
A _matrix_ is a two-dimensional array in which each element has the same mode
(numeric, character, or logical). Matrices are created with the `matrix()`
function.

## Arrays
_Arrays_ are similar to matrices but can have more than two dimensions. They're
created with an `array()` function.

## Data frames
A _data frame_ is more general than a matrix in that different columns can
contain different modes of data (numeric, character, and so on). A data frame is
created with the `data.frame()` function.

### _attach, detach_
The `attach()` function adds the data frame to the R search path. When a
variable name is encountered, data frames in the search path are checked for the
variable in order. Here is example:

{% highlight r %}
summary(mtcars$mpg)
plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$wt)

# this can also be written as follows
attach(mtcars)
  summary(mpg)
  plot(mpg, disp)
  plot(mpg, wt)
detach(mtcars)
{% endhighlight %}

The `detach()` function removes the data frame from the search path. Note that
`detach()` does nothing to the data frame itself. The `attach()` and `detach()`
functions are best used when you're analyzing a single data frame and you're
unlikely to have multiple objects with the same name.

### _with_
An alternative approch is to use the `with()` function. You can write the
previous example as

{% highlight r %}
with(mtcars, {
  print(summary(mpg))
  plot(mpg, disp)
  plot(mpg, wt)
})
{% endhighlight %}

In this case, the statements within the `{}` brackets are evaluated with
reference to the "mtcars" data frame. You don't have to worry about name
conflicts. _If there's only one statement(for example, summary(mpg)), the `{}`
brackets are optional._

The limitation of the `with()` function is that assignments exist only within
the function brackets. If you need to create objects that will exist outside of
the `with()` construct, use the speciall assignment operator `<<-` instead of
the standard one (`<-`). It saves the object to the global environment outside
of the `with()` call.

## Factors
As you've seen, variables can be described as nominal, ordinal, or continuous.
_Nominal variables_ are categorical, without an implied order. _Ordinal
variables_ imply order but not amount. _Continuous variables_ can take on any
value within some range and both order and amount are implied.

Categorical(nominal) and ordered categorical(ordinal) variables in R are called
_factors_. Factors are crucial in R because they determine how data is analyzed
and presented visually. You can use the function `factor()` to create a factor.

## Lists
Lists are the most complex of the R data types. Basically, a _list_ is an
ordered collection of objects(components). A list allows you to gather a variety
of(possibly unrelated) objects under one name.

You can specify elements of the list by indicating a component number or a name
within double brackets. For instance, `mylist[[2]]` refers to the second element
of the list.

[last blog]: https://jingwen-z.github.io/goals-of-2017
