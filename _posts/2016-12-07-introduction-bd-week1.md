---
layout: post
title: UCSD Introduction to Big Data Week 1 & 2 review
---

Since big data becomes more and more important in our life. As a fresh graduate 
in Economics and Statistics, I'm eager to learn more knowledge about big data. 
Thus, I decide to participate the course [Big Data specilization][Big Data 
specilization], created by University of California, San Diego, taught by _Ilkay 
Altintas_(Chief Data Science Officer), _Amarnath Gupta_(Director, Advanced Query 
Processing Lab) and _Mai Nguyen_(Lead for Data Analytics), they all work in San 
Diego Supercomputer Center(SDSC).  

This specilization contains 6 courses as follows:

- [Introduction to Big Data][Introduction]
- [Big Data Modeling and Management Systems][Management]
- [Big Data Integration and Processing][Integration and Processing]
- [Machine Learning With Big Data][Machine Learning]
- [Graph Analytics for Big Data][Graph Analytics]
- [Big Data - Capstone Project][project]

In this blog, I'll share what I learnt about the first two courses, Introduction
 to Big Data, during the first week.

Before learning Big Data technique, let's talk about the sources of Big Data.

## Where does Big Data come from?

Big Data mainly comes from three sources: **machine**, **people** and 
**organization**. In the following, I'll talk about them one by one.

### Machine

Machine data is the largest source of big data, which presents the notion 
_Internet of Thing_(IoT). Think of a world of smart devices at home, in your car,
 in the office, city, remote rural areas, the sky, even the ocean, all connected
  and all generating data.

### People

People are generating massive amounts of data everyday through their activites 
on various social media networking sites like Facebook, Twitter and LinkedIn, 
online photo sharing sites like Instagram.

Most of these data are text-heavy and unstructured, which bring challenges of 
working. This is certainly the case for big data and these challenges have 
created a tech industry of its own. Many big data tools are designed from 
scratch to manage unstructured information and analyze it, like _Hadoop, Spark_ 
etc. I'll talk about them later.

### Organization

The last source of big data we will discuss is organization. How do 
organizations producd data? Each organization has distinct operation practices 
and business models, which result in a variety of data generation platforms.

Many organizations have traditionally captured data at the department level, 
without proper infrastructure and policy to share and integrate this data. This 
has hindered the growth of scalable pattern recognition to the benefits of the 
entire organization. Because no one system has access to all data that the 
organization owns.

Organizations are realizing the detrimental outcomes of this rigid structure, 
and changing policies and infrastructure to enable integrated processing of all 
data to the entire organization's benefit.

While, how are organizations benefiting from big data? Let's take an example of 
Walmart. They collect data on Twitter tweets, local events, local weather, 
in-store purchases, online clicks and many other sales, customer and product 
related data. They use this data to find patterns such as which products are 
frequently purchased together, and what is the best new product to introduce in 
their stores, to predict demand at the particular location, and to customize 
customer recommendations. Overall, by leveraging big data and analytics, Walmart
 has maintained its position as a top retailer.

As a summary, organizations are gaining significant benefit from integrating big
 data practices into their culture and breaking their silos. Some major benefits
  to organizations are _operational efficiency, improved marketing outcomes, 
  higher profits,_ and _improved customer satisfaction_.

## Characteristics of Big Data (V's)

Big data is commonly characterized using a number of V's.

### Volume

This refers to the _vast amounts_ of data that is generated every second/minute/
hour/day in our digitized world.

In general, in business the goal is to turn this much data into some form of 
business advantage. The question is how do we utilize larger volumes of data to 
improve our end product's quality? Despite a number of challenges related to it.

The most obvious challenge is storage. As the size of the data increases so does
 the amount of storage space required to store that data efficiently. However, 
 we also need to be able to retrieve that large amount of data fast enough, and 
 move it to processing units in a timely fashion to get results when we need 
them. This means their performance will drop. 

As a summary, the challenges with working with volumes of big data include _cost,
 scalability, and performance_ related to their storage, access, and processing. 

### Velocity

This refers to the _speed_ at which data is being generated and the pace at 
which data moves from one point to the next. This brings additional challenges 
such as networking, bandwidth, cost of storing data. In-house versus cloud 
storage and things like that.

Additional challenges arise during processing of such large data. Most existing 
analytical methods won't scale to such sums of data in terms of memory, 
processing, or IO needs.

### Variety

This refers to the ever-increasing _different forms_ that data can come in, e.g. 
text, images, voice, geospatial.

The heterogeneity of data can be characterized along several dimensions. We 
mentioned four such axes here.

- **Structural variety** refers to the difference in the representation of the 
data, like formats and models. For example, an EKG signal is very different from
 a newspaper article. 

- **Media variety** refers to the medium in which the data gets delivered. The 
audio of a speech verses the transcript of the speech may represent the same 
information in two different media.

- **Semantic variety** refers to the method of interpretation and operation on 
data. We often use different units for quantities we measure. Sometimes we also 
use qualitative versus quantitative measures. For example, age can be a number 
or we represent it by terms like infant, juvenile, or adult. Another kind of 
semantic variety comes from different assumptions of conditions on the data. For
 example, if we conduct two income surveys on two different groups of people, we
 may not be able to compare or combine them without knowing more about the 
populations themselves.

- The **variation** and **availability** takes many forms. For one, data can be 
available real time, like sensor data, or it can be stored, like patient records. 
Similarly data can be accessible continuously, for example from a traffic cam. 
Versus intermittently, for example, only when the satellite is over the region 
of interest. This makes a difference between what operations one can do with 
data, especially if the volume of the data is large. 

Thus, data variety has many impacts like _be harder to ingest, be difficult to 
create common storage, be difficult to compare and match data across variety, be 
difficult to integrate_ and _management and policy challenges_ as well.

### Veracity

This refers to the _quality_ of the data, which can vary greatly. Because big 
data can be noisy and uncertain. It can be full of biases, abnormalities and it 
can be imprecise. Data is of no value if it's not accurate, the results of big 
data analysis are only as good as the data being analyzed. So we can say 
although big data provides many opportunities to make data enabled decisions, 
the evidence provided by data is only valuable if the data is of a satisfactory 
quality.

There are many different ways to define data quality. In the context of big data,
 quality can be defined as a function of a couple of different variables. 
**Accuracy** of the data, the trustworthiness or reliability of the data source. 
And **how the data was generated** are all important factors that affect the 
quality of data. Additionally **how meaningful the data is** with respect to the 
program that analyzes it, is an important factor, and makes context a part of 
the quality. 

This creates challenges on keeping track of data quality. _What has been 
collected, where it came from,_ and _how it was analyzed prior to its use_.

### Valence

This refers to _how big data can bond with each other_, forming connections 
between otherwise disparate datasets. For a data collection valence measures the
 ratio of actually connected data items to the possible number of connections 
that could occur within the collection. The most important aspect of valence is 
that the data connectivity increases over time. 

Thus, valence brings some challenges. _A high valence data set is denser_. This 
makes many regular, analytic critiques very inefficient. More complex analytical
 methods must be adopted to account for the increasing density. More interesting
 challenges arise due to the dynamic behavior of the data. Now there is a need 
to _model and predict_ how valence of a connected data set may change with time 
and volume. The dynamic behavior also leads to the problem of _event detection_, 
such as bursts in the local cohesion in parts of the data. And _emergent 
behavior_ in the whole data set, such as increased polarization in a community. 


Voilà, here are what I want to share with you. In the next blog, I will talk 
about the process of data analysis and Hadoop.

[Big Data specilization]: https://www.coursera.org/specializations/big-data
[Introduction]: https://www.coursera.org/learn/big-data-introduction
[Management]: https://www.coursera.org/learn/big-data-management
[Integration and Processing]: https://www.coursera.org/learn/big-data-integration-processing
[Machine Learning]: https://www.coursera.org/learn/big-data-machine-learning
[Graph Analytics]: https://www.coursera.org/learn/big-data-graph-analytics
[project]: https://www.coursera.org/learn/big-data-project
