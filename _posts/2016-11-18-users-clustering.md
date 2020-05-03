---
layout:             post
title:              Analysis of internauts' behavior
date:               2016-11-18 23:32:43 +0200
tags:               [analysis]
comments:           true
---

Since the internship will be finished in a few days, I'm seeking employment and
received several invitations of interview, one of these company is [FABERNOVEL
DATA & MEDIA][FABERNOVEL DATA & MEDIA]. After the first telephone interview,
there was a data-analysis test, which is really interesting. Thus, I would like
to share with you.

## Data

There are 288,425 observations and 12 variables in the dataset, which are
extracted from the the web FABERNOVEL and describe various information of web
accessing. The following table gives a description of all variables.

**Variables** | **Description**
--------- | -----------
`date` | The date of contact between user and FABERNOVEL
`hour` | The hour of contact between user and FABERNOVEL website
`userID` | A unique identifier represents a user (may be misinformed)
`medium` | A categorization already carried out of the source of traffic that led the user to the site
`deviceCategory` | The contact takes place via a desktop computer, a mobile phone or a tablet
`regionId` | A code indicates the region where user is located during the contact
`sessions` | The numbre of contacts made
`goalsCompletions` | The number of actions considered as a goal on the site realized by the internauts
`pageviews` | The number of page views on the site
`timeOnPage` | The time spent on the site (the sum of the time spent on each page during a contact)
`transactions` | The number of purchases on the site made by the user
`transactionRevenue` | The turnover realized by the surfer

## Data preprocessing

Moreover, we need to preprocess data before analysing.

- Check missing values

According to `View()`, we can find that among the column "medium" and "regionId",
there are missing values expressed as "(none)" or "(not set)". In order to
remove them, "(none)" and "(not set)" are replaced by `NA`; then, counting the
amount of missing values with `sum(is.na())`, in this case, there are 24,791
missing values in the dataset; finally, all missing values are removed.

- Check outliers

Thanks to the [blog][blog] on site web [R-bloggers][R-bloggers], which used the
[Tukey's method][Tukey] to identify the outliers ranged below and above the
`1.5*IQR`(interquartile). In the blog, the author also shares the following R
script that can produce boxplots and histograms with and without outliers, the
proportion of outliers as well.

Here, I will show the result of variable _pageviews'_ `outlierCheck` as an
example.

{% highlight r %}
> outlierCheck(dataset, pageviews)
Outliers identified: 40767
Proportion (%) of outliers: 18.3
Mean of the outliers: 22.49
Mean without removing outliers: 5.19
Mean if we removing outliers: 2.03
{% endhighlight %}

<p align="center">
  <img alt="Outliers Pageviews" src="{{ site.baseurl }}/images/20161118-outlierPageviews.png"/>
</p>

## Data visualization

Another thing should not be forgotten before analysing is data visualisation.
According to the following graphs, we could see information clearly and
efficiently.

<img alt="Data Visualisation Time on page-Count"
 src="{{ site.baseurl }}/images/20161118-dataviz1.png"/>

By the histogram above, we can observe that the sum of time spent on one page is
mostly shorter than 1000 units; and among 3 device categories, desktops are most
used, while the users of tablet are the least.

<img alt="Data Visualisation Hour-page views"
 src="{{ site.baseurl }}/images/20161118-dataviz2.png"/>

Now, let's look at this graph, it shows the amount of page views varies with hour.
At 7h, the amount of page views increases sharply, that might because people
wake up and surf on the net for make themselves to be awake; then it becomes
more gradual during the day, and reaches the peak at 21h, this reflects that
internauts prefer to surf the internet after dinner; after 21h, the amount of page
views decrease until tomorrow morning, as we expect, people go to sleep at night.

<img alt="Data Visualisation Date-Page views"
 src="{{ site.baseurl }}/images/20161118-dataviz3.png"/>

These two graphs describe _Page views_' tendency in terms of _Date_, with
respect to different devices. The first graph shows the overlapped page views
of 3 devices, which does a favour for comparing directly the page views among
all devices; so we can observe that page views' amount from desktops is the
most among three devices, and during the period Sep. 19th - Oct. 19th, webpages
are more viewed from 6th October and reach the peak on 7th October, then page
views decrease slowly until 18th October and increase suddenly on 19th October.
The three graphs which are below the previous one display the tendency of each
device separately. Obviously, the results are similar as the first graph, but
they contribute to the analysis of _Date-Page views_ relation for each device.


## Principal Components Analysis

In order to summarize the dataset while trying at the same time to keep the
maximal information contained among the variables. I firstly used the Principal
Components Analysis (PCA) technique.

<table style="margin:auto; text-align:center">
  <tr>
    <th>
      <b>Component</b>
    </th>
    <th>
      <b>Sd</b>
    </th>
    <th>
      <b>Cumulative</b>
    </th>
  </tr>
  <tr>
    <td>Comp.1</td>
    <td>1.75685</td>
    <td>0.44093</td>
  </tr>
  <tr>
    <td>Comp.2</td>
    <td>1.09184</td>
    <td>0.61123</td>
  </tr>
  <tr>
    <td>Comp.3</td>
    <td>1.00515</td>
    <td>0.75556</td>
  </tr>
  <tr>
    <td>Comp.4</td>
    <td>0.98331</td>
    <td>
      <b>0.89370</b>
    </td>
  </tr>
  <tr>
    <td>Comp.5</td>
    <td>0.614753</td>
    <td>0.947681</td>
  </tr>
  <tr>
    <td>Comp.6</td>
    <td>0.492406</td>
    <td>0.982318</td>
  </tr>
  <tr>
    <td>Comp.7</td>
    <td>0.351811</td>
    <td>1.000000</td>
  </tr>
</table>

According to the table above, notice that the explained variance labelled
_cumulative_ reaches **80%** and increases very little as we add more principal
components, so we keep 4 principal components.

<p align="center">
  <img alt="PCA plot" src="{{ site.baseurl }}/images/20161118-PCA-plot.png"/>
</p>

From this graph, we could also get the number of principal components that will
be interpreted. The shape of the curve changes after the 4th component. Thus,
the same conclusion, we will keep 4 principal components.

By the following, I'll take the first and the second principal component as an
example to interpret the result of PCA.

<p align="center">
  <img alt="PCA variables factors map"
   src="{{ site.baseurl }}/images/20161118-variables-factors-map.png"/>
</p>

From this scatterplot, we got the

- **Component 1** is correlated positively with _timeOnPage, pageviews,
goalsCompletions, transactons_ and _transactionRevenue_. We also observed that
the proportion of explained variance of the first component is _44.09%_.
Component measures the elements which are most relative to transaction.

- **Component 2** is correlated positively with _sessions, hours, timeOnPage,
pageviews_ and _goalsCompletions_. The proportion of explained variance of the
second component is _17.03%_. The second component measures the users'
performance of site visiting.

## Clustering (k-means)

The second method that I used is Clustering(CL). This technique will enable us
to check different groups of observations. Members in each group are similar and
close to each other.

In order to apply Clustering `k-means` method, we can use the function `kmeans()`.

{% highlight r %}
userKMeans <- kmeans(dataCL, centers = 4)
{% endhighlight %}

{% highlight r %}
> userKMeans
K-means clustering with 4 clusters of sizes 3589, 31603, 12588,
216232

Within cluster sum of squares by cluster:
[1] 1240837547 1150301678 1142761041  953329798
 (between_SS / total_SS =  91.7 %)

Available components:
[1] "cluster"         "centers"     "totss"      "withinss"
[5] "tot.withinss"    "betweenss"   "size"        "iter"
[9] "ifault"      
{% endhighlight %}

The following graph describes _Time on Page_'s tendency in terms of _Page Views_,
with respect to different clusters. In this graph, four clusters are presented
clearly: the internauts in cluster 1 spend more than 2000 units of time on the
webpage; the internauts who spend more than 250 time units but less than 1000
time units are in the second cluster; while in the third cluster, the time that
people spend on the webpage is between 1000 and 2000 time units; finally, for
the people who are in cluster 4, browsing webpage only takes less than 250 time
units. In this case, we can make different strategies of internet advertising
for different clusters.

<img alt="CL-Page Views-Time on Page"
 src="{{ site.baseurl }}/images/20161118-CL-pageviews-timeonpage.png"/>

Here is what I want to share with you, really enjoyable, right?

If you are interested in the R script, please check it on my [Github][Github],
all propositions are welcome!

[FABERNOVEL DATA & MEDIA]: http://data-media.fabernovel.fr
[blog]: https://www.r-bloggers.com/identify-describe-plot-and-remove-the-outliers-from-the-dataset
[R-bloggers]: https://www.r-bloggers.com
[Tukey]: https://en.wikipedia.org/wiki/Outlier#Tukey.27s_test
[Github]: https://github.com/jingwen-z/R/blob/master/algorithm/user_clustering.R
