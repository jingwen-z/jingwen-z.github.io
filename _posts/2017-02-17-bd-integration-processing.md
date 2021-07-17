---
layout:             post
title:              "Coursera UCSD Big Data Integration and Processing review"
lang:        en
date:               2017-02-17 23:32:43 +0200
last_modified_at:   2018-08-05 10:08:31 +0200
tags:               [MOOC]
comments:           true
excerpt:            >
    Introducing to basic concepts in big data integration and processing by
    coursera, specifically apply with Apache Spark.
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

Today I'll talk about [Big Data Integration and Processing][Big Data Integration and Processing]
on coursera. In this course, I got to know [Apache Spark][Apache Spark].

Spark was initiated at UC Berkeley in 2009 and was transferred to Apache
Software Foundation in 2013. Since then, Spark has become a top level project
with many users and contributors worldwide.

## Why Spark?

As we have discussed in our earlier discussions, while Hadoop is great for batch
processing using the MapReduce programming module, it has shortcomings in a
number of ways.

First of all, since it is limited to Map and Reduce based transformations, one
has to restrict their big data pipeline to map and reduce thefts. But the number
of applications can be implemented using Map and Reduce, it's not always
possible and it is often not the most efficient way to express a big data
pipeline.

Another important bottleneck in Hadoop MapReduce that is critical for
performance, is that MapReduce relies heavily on reading data from disc. This is
especially a problem for iterative algorithms that require taking several passes
through the data using a number of transformations. Since each transformation
will need to read its inputs from the disk, this will end up in a performance
bottleneck due to IO. Most machine learning pipelines are in this category,
making Hadoop MapReduce not ideal for machine learning.

Moreover, the only programming language that MapReduce provides a native
interface for is Java. Although, it's possible to run Python code to
implementation for it is more complex and not very efficient especially when you
are running not with text data, but with floating point numbers.

The programming language issue also affects how interactive the environment is.
Most data scientist prefer to use scripting languages due to their interactive
shell capabilities. Not having such an interface in Hadoop really makes it
difficult to use and adapt my many in the field.

In addition in the big data era having support for streaming data processing is
a key for being able to run similar analysis on both real time and historical
data.

### So, how does Apache Spark provide solutions for these problems?

Spark provides a very rich and expressive programming module that gives you more
than 20 highly efficient distributed operations or transformations. Pipe-lining
any of these steps in Spark simply takes a few lines of code.

Another important feature of Spark is the ability to run these computations in
memory. It's ability to cache and process data in memory, makes it significantly
faster for iterative applications. This is proven to provide a factor of ten or
even 100 speed-up in the performance of some algorithms, especially using large
data sets.

Additionally, Spark provides support for batch and streaming workloads at once.

Last but not least, Spark provides simple APIs for Python, Scala, Java and SQL
programming through an interactive shell to accomplish analytical tasks through
both external and its built-in libraries. 

## The Spark Stack

The Spark layer diagram, also called Stack, consists of components that build on
top of the Spark computational engine.

<p align="center">
  <img alt="Spark Stack" src="{{ site.baseurl }}/images/20170217-spark-stack.png"/>
</p>

### Spark Core

The Spark Core is where the core capability is of the Spark Framework are
implemented. This includes support for distributed scheduling, memory management
and full tolerance. Interaction with different schedulers, like YARN and Mesos
and various NoSQL storage systems like HBase also happen through Spark Core. A
very important part of Spark Core is the APIs for defining resilient distributed
data sets, or RDDs for short. RDDs are the main programming abstraction in Spark,
which carry data across many computing nodes in parallel, and transform it.

### Spark SQL

Spark SQL is the component of Spark that provides querying structured and
unstructured data through a common query language. It can connect to many data
sources and provide APIs to convert query results to RDDs in Python, Scala and
Java programs.

### Spark Streaming

Spark Streaming is where data manipulations take place in Spark. Although, not a
native real-time interface to datastreams, Spark streaming enables creating
small aggregates of data coming from streaming data ingestion systems. These
aggregate datasets are called micro-batches and they can be converted into RDBs
in Spark Streaming for processing.

### MLlib

MLlib is Sparks native library for mission learning algorithms as well as model
evaluation. All of the functionality is potentially ported to any programming
language Sparks supports and is designed to scale out using Spark.

### GraphX

GraphX is the graph analytics library of Spark and enables the Vertex edge data
model of graphs to be converted into RDDs as well as providing scalable
implementations of graph processing algorithms.

To summarize, through these layers Spark provides diverse, scalable interactive
management and analyses of big data. The interactive shell enables data
scientists to conduct exploratory analysis and create big data pipelines, while
also enabling the big data system integration engineers to scale these
analytical pipelines across commodity computing clusters and cloud environments.

[Big Data Integration and Processing]: https://www.coursera.org/learn/big-data-integration-processing
[Apache Spark]: http://spark.apache.org
