---
layout:             post
title:              "Python: Converting between datetime and string"
date:               2019-01-08 21:37:26 +0100
last_modified_at:   2019-01-15 22:24:27 +0100
comments:           true
excerpt:            >
    This blog talks about converting datetime between string and datetime with
    python. The principal python package we will use is datetime and dateutil.
img_url:            /images/20190108-calendar.jpg
img_width:          1280
img_height:         853
---

<p align="center">
  <img alt="Title image"
  src="{{ site.baseurl }}/images/20190108-calendar.jpg"/>
</p>

Converting between datetime and string is a subject that we usually need to
handle during data processing. In this blog, I'll talk about how to convert
`datetime` to `string` and inverse, with following date format:

- `YYYY-MM-DD`
- `YY-MM-DD`
- `MM-DD-YYYY`
- `MM-DD-YY`
- `DD-MM-YYYY`
- `DD-MM-YY`
- `YYYY/MM/DD`
- `YY/MM/DD`
- `MM/DD/YYYY`
- `MM/DD/YY`
- `DD/MM/YYYY`
- `DD/MM/YY`
- Human-intelligible date


## Converting from datetime to string
### YYYY-MM-DD
{% highlight python %}
>>> import datetime
>>> dt_stamp = datetime.datetime(2019, 1, 9)
>>> type(dt_stamp)
datetime.datetime
>>> str(dt_stamp)
'2019-01-09 00:00:00'
{% endhighlight %}

You can convert `datetime` objects and pandas `Timestamp` object to string with
`str` or the `strftime` method:
{% highlight python %}
>>> dt_stamp.strftime('%Y-%m-%d')
'2019-01-09'
>>> dt_stamp.strftime('%F')
'2019-01-09'
{% endhighlight %}

`%Y` means four-digit year, `%m` presents two-digit month, `%d` describes
two-digit day, `%F` is the shortcut for `%Y-%m-%d`.

### YY-MM-DD
{% highlight python %}
>>> dt_stamp.strftime('%y-%m-%d')
'19-01-09'
{% endhighlight %}
`%y` means two-digit year.

### MM-DD-YYYY
{% highlight python %}
>>> dt_stamp.strftime('%m-%d-%Y')
'01-09-2019'
{% endhighlight %}

### MM-DD-YY
{% highlight python %}
>>> dt_stamp.strftime('%m-%d-%y')
'01-09-19'
{% endhighlight %}

### DD-MM-YYYY
{% highlight python %}
>>> dt_stamp.strftime('%d-%m-%Y')
'09-01-2019'
{% endhighlight %}

### DD-MM-YY
{% highlight python %}
>>> dt_stamp.strftime('%d-%m-%y')
'09-01-19'
{% endhighlight %}

### YYYY/MM/DD
{% highlight python %}
>>> dt_stamp.strftime('%Y/%m/%d')
'2019/01/09'
{% endhighlight %}

### YY/MM/DD
{% highlight python %}
>>> dt_stamp.strftime('%y/%m/%d')
'19/01/09'
{% endhighlight %}

### MM/DD/YYYY
{% highlight python %}
>>> dt_stamp.strftime('%m/%d/%Y')
'01/09/2019'
{% endhighlight %}

### MM/DD/YY
{% highlight python %}
>>> dt_stamp.strftime('%m/%d/%y')
'01/09/19'
>>> dt_stamp.strftime('%D')
'01/09/19'
{% endhighlight %}
`%D` is the shortcut for `%m/%d/%y`.

### DD/MM/YYYY
{% highlight python %}
>>> dt_stamp.strftime('%d/%m/%Y')
'09/01/2019'
{% endhighlight %}

### DD/MM/YY
{% highlight python %}
>>> dt_stamp.strftime('%d/%m/%y')
'09/01/19'
{% endhighlight %}


## Converting from string to datetime
### YYYY-MM-DD
{% highlight python %}
>>> str_stamp = '2019-01-09'
>>> datetime.datetime.strptime(str_stamp, '%Y-%m-%d')
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

`datetime.datetime.strptime` is a good way to parse a date with a
**known format**. However, it can be a bit annoying to have to write a format
spec each time, especially for common date formats. In this case, you can use
the `parser.parse` method in the third-party `dateutil` package.

{% highlight python %}
>>> from dateutil.parser import parse
>>> parse(str_stamp)
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

### YY-MM-DD
{% highlight python %}
>>> datetime.datetime.strptime('19-01-09', '%y-%m-%d')
datetime.datetime(2019, 1, 9, 0, 0)
>>> parse('19-01-09', yearfirst=True)
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

### MM-DD-YYYY
{% highlight python %}
>>> datetime.datetime.strptime('01-09-2019', '%m-%d-%Y')
datetime.datetime(2019, 1, 9, 0, 0)
>>> parse('01-09-2019', yearfirst=False, dayfirst=False)
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

### MM-DD-YY
{% highlight python %}
>>> datetime.datetime.strptime('01-09-19', '%m-%d-%y')
datetime.datetime(2019, 1, 9, 0, 0)
>>> parse('01-09-19', yearfirst=False, dayfirst=False)
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

### DD-MM-YYYY
{% highlight python %}
>>> datetime.datetime.strptime('09-01-2019', '%d-%m-%Y')
datetime.datetime(2019, 1, 9, 0, 0)
>>> parse('09-01-2019', dayfirst=True)
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

### DD-MM-YY
{% highlight python %}
>>> datetime.datetime.strptime('09-01-19', '%d-%m-%y')
datetime.datetime(2019, 1, 9, 0, 0)
>>> parse('09-01-19', dayfirst=True)
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

### YYYY/MM/DD
{% highlight python %}
>>> datetime.datetime.strptime('2019/01/09', '%Y/%m/%d')
datetime.datetime(2019, 1, 9, 0, 0)
>>> parse('2019/01/09')
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

### YY/MM/DD
{% highlight python %}
>>> datetime.datetime.strptime('19/01/09', '%y/%m/%d')
datetime.datetime(2019, 1, 9, 0, 0)
>>> parse('19/01/09', yearfirst=True)
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

### MM/DD/YYYY
{% highlight python %}
>>> datetime.datetime.strptime('01/09/2019', '%m/%d/%Y')
datetime.datetime(2019, 1, 9, 0, 0)
>>> parse('01/09/2019', yearfirst=False, dayfirst=False)
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

### MM/DD/YY
{% highlight python %}
>>> datetime.datetime.strptime('01/09/19', '%m/%d/%y')
datetime.datetime(2019, 1, 9, 0, 0)
>>> parse('01/09/19', yearfirst=False, dayfirst=False)
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

### DD/MM/YYYY
{% highlight python %}
>>> datetime.datetime.strptime('09/01/2019', '%d/%m/%Y')
datetime.datetime(2019, 1, 9, 0, 0)
>>> parse('09/01/2019', dayfirst=True)
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

### DD/MM/YY
{% highlight python %}
>>> datetime.datetime.strptime('09/01/19', '%d/%m/%y')
datetime.datetime(2019, 1, 9, 0, 0)
>>> parse('09/01/19', dayfirst=True)
datetime.datetime(2019, 1, 9, 0, 0)
{% endhighlight %}

### Human-intelligible date
{% highlight python %}
>>> parse('Jan 9, 2019')
datetime.datetime(2019, 1, 9, 0, 0)
>>> parse('Jan 9, 2019 10:39 PM')
datetime.datetime(2019, 1, 9, 22, 39)
{% endhighlight %}

Hope you like this blog and don't hesitate if you want to ask a queston or
write a comment, it's welcome!!

## Reference
- Wes McKinney. 2017. “Chapter 11 Time Series” Python for Data Analysis DATA
WRANGLING WITH PANDAS, NUMPY, AND IPYTHON p 319-323
- [Datetime — Basic date and time types][py datetime doc]
- [Calendar image][img]

[py datetime doc]: https://docs.python.org/3/library/datetime.html
[img]: https://pixabay.com/en/calendar-wall-calendar-days-date-1990453/
