---
layout: post
title: Apply Google Analytics to website
---

Nowadays, technique plays an important role in our life, almost all of us search 
and get information on website. However, as a data analyst, it’s important to 
read, understand and explain the website performance, which can contribute to 
business of company. However, building such a framework is always complicated 
and taking long time. Fortunately, Google offers a freemium web analytics 
[Google Analytics][Google Analytics]. In this blog, I’ll share you how I 
set up and integrated my website with Google Analytics. (Don’t be scared, it 
won’t be that complicated :) )

- First step, setting up. Opening the website [Google Analytics][Google Analytics] 
to create an account and setting up a property. 

- Second step, configuration. After setting up the property, we can get the 
tracking code in the field “Tracking Info”. In order to get all information 
about the website, we should add tracking code into each webpage we want to 
track. In my case, I add tracking code into the configuration file so that it 
can track all webpage automatically.

<p align="center">
  <img alt="Tracking code" src="{{ site.baseurl }}/images/20161018-tracking-code.png"/>
</p>

Here, in order to ensure I add them successfully, I checked my website in local, 
then push it into “cloud” with following code in terminal.

{% highlight shell %}
  $ git status -s
  $ git add XXX(configuration file name)
  $ git status -s
  $ git commit -m ‘add Google Analytics tracking code’
  $ git push origin master
{% endhighlight %}

- Third step, logging in Google Analytics, checking all dashboards in the field 
“Report”.

<p align="center">
  <img alt="Dashboard1" src="{{ site.baseurl }}/images/20161018-dashboard1.png"/>
</p>  

<p align="center">
  <img alt="Dashboard2" src="{{ site.baseurl }}/images/20161018-dashboard2.png"/>
</p>

<p align="center">                                                              
  <img alt="Dashboard3" src="{{ site.baseurl }}/images/20161018-dashboard3.png"/>
</p> 

Well, here are all things that I share to you today.

[Google Analytics]:https://www.google.com/analytics

