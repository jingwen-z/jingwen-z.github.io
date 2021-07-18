---
layout:             post
title:              "COVID-19 pandemic spreads of TOP 10 countries"
lang:        en
date:               "2020-03-23 21:52:16 +0100"
tags:               [analysis, COVID-19, visualisation]
last_modified_at:   2020-03-25 22:07:54 +0100
comments:           true
excerpt:     >
    From the COVID-19's outbreak until 23 March, 378139 people are / have been
    infected all around the world. The number of people who have dead exceeds
    16400. Nearly 190 countries have confirmed cases. In this blog, I focus on
    the top 10 countries in terms of cumulative confirmed cases.
cover:              /images/20200324-daynb-cumul-case-1million-people.png
img_width:          1280
img_height:         853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    src: /images/20200512-virus.jpg
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

From the COVID-19's outbreak until 23 March, 378139 people are / have been
infected all around the world. The number of people who have dead exceeds 16400.
Nearly 190 countries have confirmed cases. In this blog, I focus on the top 10
countries in terms of cumulative confirmed cases and go deeper on:
- Cumulative number of confirmed cases, by number of days since 30th case
- Cumulative number of confirmed cases per 1 million people, by number of days since 30th case
- Cumulative number of deaths, by number of days since 20 deaths

## Cumulative number of confirmed cases, by number of days since 30th case

<p align="center">
  <img alt="20200324-daynb-cumul-case"
  src="{{ site.baseurl }}/images/20200324-daynb-cumul-case.png"/>
</p>

This plot describes the daily cumulative confirmed count for each country since
the confirmed count arrived at 30 cases. Here we need to highlight some countries:

- Italy: as of 23 March, there are 63927 cases during nearly 31 days. The 25th
day after its 30th cases, Italy's confirmed counts exceeded China for the same
day number. Between the 26th day and 30th day, there are more than 5000 cases
were added each day, but on the 31st day, less than 4800 cases were added, hope
it begins to arrive its inflection point.
- Spain: as of 23 March, there are 35136 cases during 25 days. The 23th day
after its 30th cases, Spain's confirmed counts exceed China for the same day number.
- US: the situation in US is worser than Italy and Spain. As of 23 March, there
are 43667 cases during 25 days. During the last 5 days, its confirmed cases
increase 36220, which is even greater than Spain's cumulative confirmed cases !
- Germany: the increasing during the first 15 days is similar as France, then it
exceeded France and started to increase. Its increasing trend is similar as
Italy's on the same period.
- France: comparing to other countries, France's increasing is neither rapid nor
slow. Between the 20th and 25th day, it has less than 2000 new confirmed cases
per day, but yesterday (23 March) it had 3856 new cases.
- Iran: comparing to the first 2 weeks, Iran's increasing started to be less rapid.
- South Korea: relatively stabler than others.

## Cumulative number of confirmed cases per 1 million people, by number of days since 30th case

<p align="center">
  <img alt="20200324-daynb-cumul-case-1million-people"
  src="{{ site.baseurl }}/images/20200324-daynb-cumul-case-1million-people.png"/>
</p>

This plot describes the daily cumulative confirmed count per 1 million people
for each country since the confirmed count arrived at 30 cases. Here we need to
highlight some countries:
- China: started being stable since the 30th day after 30 cases.
- Italy: its confirmed count per 1 million people is the greatest among these 10 countries
- Switzerland: its confirmed count per 1 million people is a litter bit less
than Italy, though its confirmed count is much less than Italy. To see if it
will exceed Italy.
- Spain: increasing rate in confirmed count per 1 million people is higher than Italy.
- South Korea: rapid increasing during the first 20 days, then started to be stabler.

## Cumulative number of deaths, by number of days since 20 deaths

<p align="center">
  <img alt="20200324-daynb-deaths"
  src="{{ site.baseurl }}/images/20200324-daynb-deaths.png"/>
</p>

Italy, Spain, France and UK have had more deaths attributed to COVID-19 than
China did at the same stage. Especially for Italy, its total deaths attributed
to COVID-19 have exceeded the ones in China.

## Reference
- Isaac Lin, "DXY-COVID-19-Data", _www.github.com_. [Online]. Available: [https://github.com/BlankerL/DXY-COVID-19-Data][r1]
- CSSEGISandData, "csse_covid_19_data", _www.github.com_. [Online]. Available: [https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_daily_reports][r2]
- geralt, "virus coronavirus covid-19 pandemic", _pixabay.com_. [Online]. Available: [https://pixabay.com/illustrations/virus-coronavirus-covid-19-pandemic-5675422/][background-img]

[r1]: https://github.com/BlankerL/DXY-COVID-19-Data
[r2]: https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_daily_reports
[background-img]: https://pixabay.com/illustrations/virus-coronavirus-covid-19-pandemic-5675422/
