---
layout:      post
title:       "Teradata SQL: How to handle ISO calendar?"
date:        "2019-03-05 21:11:01 +0100"
tags:        [SQL, Teradata, ISO]
comments:    true
excerpt:     >
    This blog introduces how to handle ISO calendar with Teradata Database SQL
    with ISO Computation and Teradata Database SQL Functions like
    YearNumber_Of_Calendar, MonthNumber_Of_Year and WeekNumber_Of_Year.
img_url:     /images/20190305-bird.jpg
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="Bird"
  src="{{ site.baseurl }}/images/20190305-bird.jpg"/>
</p>

When we create yearly, monthly or weekly report, we are sometimes beset by
problem about calendar. Like the last day of year 2018 (2018-12-31) is regarded
as one day of 2018 or 2019 ? Or the last day of year 2018 is considered as one
day of 2018's last week or 2019's first week? It's a question about ISO
calendar, and the answer depends on what we want. In this blog, I'll talk about
how to handle ISO calendar with Teradata Database SQL with following points:

- ISO Computation
- Teradata Database SQL Functions with examples

## ISO Computation
The way in which a week, month, quarter, and year are defined in the ISO
calendar is different from the Teradata and COMPATIBLE calendars. ISO has only
complete weeks. All the business calendar functions and views use the following
rules for ISO computation.

### Week
We talk about `week` firstly since the next points are based on `iso week`.

An ISO week always has 7 days. There are no partial weeks. The ISO week always
starts on Monday and ends on Sunday.

The ISO 8601 definition for week 01 is the week with the Gregorian year's first
Thursday in it. The following definitions based on properties of this week are
mutually equivalent, since the ISO week starts with Monday:

- It is the first week with a majority (4 or more) of its days in January.
- Its first day is the Monday nearest to 1 January.
- It has 4 January in it.
- It has the year's first working day in it, if Saturdays, Sundays and 1
January are not working days.

### Year
Each year has 52 or 53 complete weeks. The year start or end is determined by
applying the ISO Thursday rule to the week at the year border. For example,
December 31, 2009, is a Thursday. Therefore, in the ISO calendar the week of
Monday, December 28, 2009, through Sunday, January 3, 2010, is the last week
in 2009. The first week of 2010 in the ISO calendar begins on Monday, January
4, 2010. In contrast, the Teradata calendar for 2010 begins on Friday, January 1.

<p align="center">
  <img alt="ISO calendar year"
  src="{{ site.baseurl }}/images/20190305-iso-year.jpg"/>
</p>

### Month
Each month has 4 or 5 complete weeks. The month start or end is determined by
applying the ISO Thursday rule to the week at the month border. For example, in
the ISO calendar, the month of October 2012 ends on Sunday, October 28, because
Thursday in the border week falls on November 1. The new week that begins on
Monday, October 29, becomes part of November.

<p align="center">
  <img alt="ISO calendar month"
  src="{{ site.baseurl }}/images/20190305-iso-month.jpg"/>
</p>

## Teradata Database SQL Functions
Next, I'll introduce some useful Teradata Database SQL for extracting year,
month or week number from a date.

### Year
`YearNumber_Of_Calendar` returns the year of the specified date.

The following query returns 2018 because December 31, 2018, is belong to 2018
in Teradata calendar:
{% highlight sql %}
SELECT TD_SYSFNLIB.YEARNUMBER_OF_CALENDAR(DATE '2018-12-31')
{% endhighlight %}

The following query returns 2019 because December 31, 2018, is belong to 2019
in ISO calendar:
{% highlight sql %}
SELECT TD_SYSFNLIB.YEARNUMBER_OF_CALENDAR(DATE '2018-12-31', 'ISO')
{% endhighlight %}

### Month
`MonthNumber_Of_Year` returns the number of months from the beginning of the
year to the specified date.

The following query returns 12 because December 31, 2018, is the 12th month of
2018 in Teradata calendar:
{% highlight sql %}
SELECT TD_SYSFNLIB.MONTHNUMBER_OF_YEAR(DATE '2018-12-31')
{% endhighlight %}

The following query returns 1 because December 31, 2018, is the 1st month of
2019 in ISO calendar:
{% highlight sql %}
SELECT TD_SYSFNLIB.MONTHNUMBER_OF_YEAR(DATE '2018-12-31', 'ISO')
{% endhighlight %}

### Week
`WeekNumber_Of_Year` returns the number of weeks from the beginning of the year
to the specified date.

The following query returns 52 because December 31, 2018, is in the 52th week of
2018 in Teradata calendar:
{% highlight sql %}
SELECT TD_SYSFNLIB.WEEKNUMBER_OF_YEAR(DATE '2018-12-31')
{% endhighlight %}

The following query returns 1 because December 31, 2018, is in the 1st week of
2019 in ISO calendar:
{% highlight sql %}
SELECT TD_SYSFNLIB.WEEKNUMBER_OF_YEAR(DATE '2018-12-31', 'ISO')
{% endhighlight %}

## Reference
- "Chapter 8 Business Calendars", _teradata DOCUMENTATION_. [Online]. Available: [https://docs.teradata.com/reader/kmuOwjp1zEYg98JsB8fu_A/bSxb4Cxea7QogBy_AYv6Bg][r1]
- "ISO week date", _wikipedia_. [Online]. Available: [https://en.wikipedia.org/wiki/ISO_week_date][r2]
- homecare119, "Bird image", _pixabay_. [Online]. Available: [https://pixabay.com/photos/bird-wings-fluttering-nature-1045954][r3]

[r1]: https://docs.teradata.com/reader/kmuOwjp1zEYg98JsB8fu_A/bSxb4Cxea7QogBy_AYv6Bg
[r2]: https://en.wikipedia.org/wiki/ISO_week_date
[r3]: https://pixabay.com/photos/bird-wings-fluttering-nature-1045954