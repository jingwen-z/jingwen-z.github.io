---
layout:      post
title:       "Python Datetime Tools"
date:        "2019-01-08 21:37:26 +0100"
comments:    true
excerpt:     >
    This blog talks about converting datetime between string and datetime, ISO
    calendar and generating date ranges with frequency and time zone. The
    principal python package we will use is datetime and pandas.
img_url:     /images/20190108-calendar.jpg
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="Title image"
  src="{{ site.baseurl }}/images/20190108-calendar.jpg"/>
</p>

Time series data is an important form of structured data in many different
fields, such as finance, economics, ecology and physics. In this blog, I'll
mainly present the following points:
- Converting between string and datetime
- ISO calendar
- Generating date ranges with frequency and time zone

## Converting between string and datetime
### Converting from datetime to string
{% highlight python %}
>>> import pandas as pd
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

### Converting from string to datetime
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

## ISO calendar
[ISO 8601][ISO8601], an international standard covering the exchange of date
and time-related data, as the string format. The ISO calendar is a widely used
variant of the Gregorian calendar. The ISO year consists of 52 or 53 full weeks,
and where a week starts on a Monday and ends on a Sunday. The first week of an
ISO year is the first (Gregorian) calendar week of a year containing a Thursday.
This is called week number 1, and the ISO year of that Thursday is the same as
its Gregorian year.

During my work, we industrialized many reports that define the period
automatically. We need to pay attention to the dates for first-week report.
Let's look at the following examples:

{% highlight python %}
>>> last_day_2018 = datetime.date(2018, 12, 31)
>>> last_day_2018
datetime.date(2018, 12, 31)
>>> last_day_2018.isoformat()
'2018-12-31'

>>> last_day_2018.weekday() # Monday is 0 and Sunday is 6
0
>>> last_day_2018.isoweekday() # Monday is 1 and Sunday is 7
1

>>> last_day_2018.year
2018
>>> last_day_2018.isocalendar() # (ISO year, ISO week number, ISO weekday)
(2019, 1, 1)
{% endhighlight %}

The first week of year 2019 is from 31th December 2018 to 6th January 2019, we
want the year of 31th December 2018 to be 2019, in this case we can apply
`isocalendar()` in order to getting the ISO year, same for ISO weekday.

## Generating date ranges with frequency and time zone
{% highlight python %}
>>> pd.date_range('2018-09-01', '2019-01-01')
DatetimeIndex(['2018-09-01', '2018-09-02', '2018-09-03', '2018-09-04',
               '2018-09-05', '2018-09-06', '2018-09-07', '2018-09-08',
               '2018-09-09', '2018-09-10',
               ...
               '2018-12-23', '2018-12-24', '2018-12-25', '2018-12-26',
               '2018-12-27', '2018-12-28', '2018-12-29', '2018-12-30',
               '2018-12-31', '2019-01-01'],
              dtype='datetime64[ns]', length=123, freq='D')
{% endhighlight %}

By default, `date_range` generates daily timestamps. If you pass only a start
or end date, you must pass a number of `periods` to generate:

{% highlight python %}
>>> pd.date_range(start='2018-09-10', periods=20)
DatetimeIndex(['2018-09-10', '2018-09-11', '2018-09-12', '2018-09-13',
               '2018-09-14', '2018-09-15', '2018-09-16', '2018-09-17',
               '2018-09-18', '2018-09-19', '2018-09-20', '2018-09-21',
               '2018-09-22', '2018-09-23', '2018-09-24', '2018-09-25',
               '2018-09-26', '2018-09-27', '2018-09-28', '2018-09-29'],
              dtype='datetime64[ns]', freq='D')
{% endhighlight %}

Moreover, you can also specify frequency by `freq`:

{% highlight python %}
>>> pd.date_range('2018-09-01', '2019-01-01', freq='BM')
>>> # BM: BusinessMonthEnd. Last business day of month
DatetimeIndex(['2018-09-28', '2018-10-31', '2018-11-30', '2018-12-31'],
               dtype='datetime64[ns]', freq='BM')

>>> pd.date_range('2018-09-01 9:30', periods=3, freq='BM', tz='UTC')
DatetimeIndex(['2018-09-28 09:30:00+00:00', '2018-10-31 09:30:00+00:00',
               '2018-11-30 09:30:00+00:00'],
              dtype='datetime64[ns, UTC]', freq='BM')
{% endhighlight %}

Hope you like this blog and don't hesitate if you want to ask a queston or
write a comment, it's welcome!!

## Reference
- Wes McKinney. 2017. “Chapter 11 Time Series” Python for Data Analysis DATA
WRANGLING WITH PANDAS, NUMPY, AND IPYTHON p 319-341
- [Datetime — Basic date and time types][py datetime doc]
- [Calendar image][img]

[ISO8601]: https://en.wikipedia.org/wiki/ISO_8601
[py datetime doc]: https://docs.python.org/3/library/datetime.html
[img]: https://pixabay.com/en/calendar-wall-calendar-days-date-1990453/
