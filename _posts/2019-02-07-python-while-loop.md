---
layout:      post
title:       "Python: while loop"
date:        "2019-02-07 03:19:48 +0100"
tags:        [python3]
comments:    true
excerpt:     >
    This blog presents how to acheive a while loop by python. Except for the
    basic using, you will also comprehend the infinite loop, nested while loop,
    if-else statement with while loop and loop of a list.
img_url:     /images/20190207-python-while-loop.jpg
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="Python while loop flow diagram"
  src="{{ site.baseurl }}/images/20190207-python-while-loop.jpg"/>
</p>

`while` loops, like the for loop, are used for repeating sections of code - but
unlike a for loop, the while loop will not run n times, but until a defined
condition is no longer met. If the condition is initially false, the loop body
will not be executed at all. In this blog, I'll talk about how to achieve
`while` loops about:
- syntax
- flow diagram
- basic using
- infinite loop
- nested while loop
- if-else statement with while loop
- loop of a list

## Syntax
{% highlight python %}
while expression:
    statement(s)
{% endhighlight %}

Here, `statement(s)` may be a single statement or a block of statements. The
`condition` may be any expression, and true is any non-zero value. The loop
iterates while the condition is true.
When the condition becomes false, program control passes to the line immediately
following the loop.

## Flow diagram
Key point of the while loop is that the loop might not ever run. When the
condition is satisfied, the loop body will be executed; however, when the
condition is tested and the result is false, the loop body will be skipped and
the first statement after the while loop will be executed.

## Basic using
{% highlight python %}
>>> count = 0
>>> while (count < 7):
...    print('The count is:', count)
...    count = count + 1
...
The count is: 0
The count is: 1
The count is: 2
The count is: 3
The count is: 4
The count is: 5
The count is: 6
{% endhighlight %}

We initially set count with value "0". Then we continue to `while` loop - when
count is smaller than 7, then print count value and assign "count" with its
value plus one; so when count is equal to 0, the script prints "The count is:
0", count's new value is 1 (0+1); and so forth until count's value is 6.

## The infinite loop
{% highlight python %}
>>> i = 7
>>> while (i < 10):
...    print ('Infinite loop')
...
Infinite loop
Infinite loop
Infinite loop
Infinite loop
Infinite loop
Infinite loop
Infinite loop
Infinite loop
Infinite loop
Infinite loop
... # infinite "Infinite loop"
{% endhighlight %}

Here, the value of `i` will always be smaller than 10, so it will print
"Infinite loop" without stopping.

## Nested While Loops
Besides the basic using and the infinite loop, we can nest loops inside each
other. This is also true for while loops where we can create multiple levels
of while statements as long as proper indentation rules are followed.

The syntax is as follows:

{% highlight python %}
while condition1:
    do_something
    while condition2:
        do_something
        while condition3:
            do_something
{% endhighlight %}

Let's look at the following example:

{% highlight python %}
>>> x = -7
>>> y = 15
>>> while x <= y:
...     print('X is now: ', x)
...     x = x + 1
...     while x <= 0:
...         print('X is negative')
...         x = x + 1
...
X is now:  -7
X is negative
X is negative
X is negative
X is negative
X is negative
X is negative
X is negative
X is now:  1
X is now:  2
X is now:  3
X is now:  4
X is now:  5
X is now:  6
X is now:  7
X is now:  8
X is now:  9
X is now:  10
X is now:  11
X is now:  12
X is now:  13
X is now:  14
X is now:  15
{% endhighlight %}

The initial values of x and y are -7 and 15, respectively. When x is smaller
than or equal to y, print x's value and assign its value with x plus one, then
if x is also smaller than or equal to 0, print "X is negative" and reassign
with x plus one, until x is greater than y.

## If-else statement with while loop
You can include an `else conditional statement` without the corresponding
`if statement` in while loops as well.

The syntax is as follows:

{% highlight python %}
while condition1:
    do_something
else:
    do_something_else
{% endhighlight %}

Let's look at the following example:

{% highlight python %}
>>> count = 0
>>> while count < 6:
...     print('The current count is: ', count)
...     count += 1
... else:
...     print('The final count is: ', count)
...
The current count is:  0
The current count is:  1
The current count is:  2
The current count is:  3
The current count is:  4
The current count is:  5
The final count is:  6
{% endhighlight %}

In this example, count is initially equal to 0. When count is smaller than 6,
print current count's value and reassign its value with count plus one, until
count equals to 6, we print "The final count is: 6"

## Loop of a list
{% highlight python %}
>>> names = ['John', 'Jerome', 'Paul', 'George', 'Andy', 'Michael']
>>> i = 0
>>>
>>> while i < len(names):
...     print(names[i])
...     i += 1
...
John
Jerome
Paul
George
Andy
Michael
{% endhighlight %}

List "names" contains 6 elements, i's initial value is 0. Now we will start
`while` loop. When i is smaller than names' length (6), print names' i-location
value and reassign i with i plus one, until i equals to 5, which corresponds
'Michael'.

## Conclusion
In this blog, we talked about syntax and basic using of `while` loop, and its
supplementary applications: the infinite loop, nested while loop, if-else
statement with while loop and loop of a list. Hope it's useful for you :)

## Reference
- tutorialspoint, "Python while Loop Statements", _tutorialspoint_, 2019. [Online]. Available: [http://www.tutorialspoint.com/python/python_while_loop.htm][r1]
- python wiki, "While loops", _python wiki_, 2017. [Online]. Available: [https://wiki.python.org/moin/WhileLoop][r2]
- Dr. Andrew N. Harrington., "3.3. While Statements", _Hands-on Python Tutorial_, 2017. [Online]. Available: [http://anh.cs.luc.edu/python/hands-on/3.1/handsonHtml/whilestatements.html][r3]
- trytoprogram, "Python while loop", _trytoprogram_, 2017. [Online]. Available: [http://www.trytoprogram.com/python-programming/python-while-loop][r4]
- KASIA MIKOLUK, "Python While Loop: A Guide to Using While Loops in Python", udemy blog, 2013. [Online]. Available: [https://blog.udemy.com/python-while-loop][r5]

[r1]: http://www.tutorialspoint.com/python/python_while_loop.htm
[r2]: https://wiki.python.org/moin/WhileLoop
[r3]: http://anh.cs.luc.edu/python/hands-on/3.1/handsonHtml/whilestatements.html
[r4]: http://www.trytoprogram.com/python-programming/python-while-loop
[r5]: https://blog.udemy.com/python-while-loop