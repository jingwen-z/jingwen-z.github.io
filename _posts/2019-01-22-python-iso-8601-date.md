---
layout:      post
title:       "Python: ISO 8601 date"
date:        "2019-01-22 21:59:44 +0100"
comments:    true
excerpt:     >
    This blog talks about applying ISO 8601 date by python such as ISO year,
    ISO week, ISO date; how to convert datetime format to ISO format and how to
    convert ISO format to datetime format.
# img_url:     /images/
# img_width:   1280
# img_height:  853
---
[ISO 8601][ISO8601], an international standard covering the exchange of date
and time-related data, as the string format. The ISO calendar is a widely used
variant of the Gregorian calendar. The ISO year consists of 52 or 53 full
weeks, and where a week starts on a Monday and ends on a Sunday. The first week
of an ISO year is the first (Gregorian) calendar week of a year containing a
Thursday. This is called week number 1, and the ISO year of that Thursday is
the same as its Gregorian year.

In this article, I will talk about:
- Basic ISO 8601 calendar elements
- Converting `datetime.date` to ISO 8601 format
- Parsing an ISO 8601-formatted date

## Basic ISO 8601 calendar elements
### ISO year & ISO week
The first week of year 2019 is from 31th December 2018 to 6th January 2019, we
want the year of 31th December 2018 to be 2019, in this case we can apply
`isocalendar()` in order to getting the ISO year, same for ISO weekday.

There are several mutually equivalent and compatible descriptions of week 01:
- the week with the year's first Thursday in it (the formal ISO definition)
- the week with 4 January in it
- the first week with the majority (four or more) of its days in the starting year
- the week starting with the Monday in the period 29 December – 4 January

{% highlight python %}
>>> import datetime
>>> last_day_2018 = datetime.date(2018, 12, 31)
>>> last_day_2018.year
2018
>>> last_day_2018.isocalendar() # (ISO year, ISO week number, ISO weekday)
(2019, 1, 1)
{% endhighlight %}

Date `2018-12-31`'s year is 2018, but its ISO year is 2019. In this case, we
can apply `isocalendar()` to achieve it.

### ISO weekday
{% highlight python %}
>>> last_day_2018.weekday() # Monday is 0 and Sunday is 6
0
>>> last_day_2018.isoweekday() # Monday is 1 and Sunday is 7
1
{% endhighlight %}

`isoweekday()` returns different results from `weekday()`, it presents value 1
as Monday.

## Converting date to ISO 8601 format
{% highlight python %}
>>> last_day_2018
datetime.date(2018, 12, 31)
>>> last_day_2018.isoformat()
'2018-12-31'
{% endhighlight %}

Calendar date includes 3 principal elements: `YYYY`, `MM` and `DD`. `YYYY`
indicates a four-digit year, 0000 through 9999, `MM` indicates a two-digit
month of the year, 01 through 12, `DD` indicates a two-digit day of that month,
01 through 31.

{% highlight python %}
>>> first_day_2019 = datetime.date(2019, 1, 1)
>>> first_day_2019
datetime.date(2019, 1, 1)
>>> first_day_2019.isoformat()
'2019-01-01'
{% endhighlight %}

As the example above, we need to pay attention one-digit month or day value is
different between `datetime.date` value and `isoformat` value. ISO month and
day are always two-digit value.

## Parsing an ISO 8601-formatted date
### date.fromisoformat()
{% highlight python %}
>>> datetime.date.fromisoformat('2019-01-01')
datetime.date(2019, 1, 1)
{% endhighlight %}

Specifically, this function supports strings in the format(s) `YYYY-MM-DD`.

**Caution:** This does not support parsing arbitrary ISO 8601 strings - it is
only intended as the inverse operation of `date.isoformat()`.

### parser.parse()
{% highlight python %}
>>> import dateutil.parser
>>> dateutil.parser.parse('20080903') # ISO 8601 basic format, date only
datetime.datetime(2008, 9, 3, 0, 0)
>>> dateutil.parser.parse('20080903T205635.450686') # ISO 8601 basic format
datetime.datetime(2008, 9, 3, 20, 56, 35, 450686)
>>> dateutil.parser.parse('2008-09-03T20:56:35.450686') # ISO 8601 extended format
datetime.datetime(2008, 9, 3, 20, 56, 35, 450686)
{% endhighlight %}

`dateutil.parser` offers a generic date/time string parser which is able to
parse most known formats to represent a date and/or time. `parser.parse()`
parses a string in one of the supported formats.

## Reference
- [Datetime — Basic date and time types][python basic date time types]
- [date.fromisoformat()][fromisoformat]
- [How do I parse an ISO 8601-formatted date?][stackoverflow]
- [dateutil.parser.parse()][parser.parse()]

[ISO8601]: https://en.wikipedia.org/wiki/ISO_8601
[python basic date time types]: https://docs.python.org/3/library/datetime.html
[fromisoformat]: https://docs.python.org/3/library/datetime.html#datetime.date.fromisoformat
[stackoverflow]: https://stackoverflow.com/questions/127803/how-do-i-parse-an-iso-8601-formatted-date/15228038#15228038
[parser.parse()]: https://dateutil.readthedocs.io/en/stable/parser.html
