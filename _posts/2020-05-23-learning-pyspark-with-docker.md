---
layout:             post
title:              "Learning pyspark with Docker"
date:               "2020-05-23 16:44:45 +0200"
last_modified_at:   2020-08-21 22:31:25 +0200
tags:               [python3, pyspark, Spark, Docker]
comments:           true
excerpt:            >
    This blog talks about how to manipulate data with "pyspark" module in a
    Docker container.
cover:              /images/20200523-docker-pyspark.png
img_width:          1280
img_height:         853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

<p align="center">
  <img alt="20200523-docker-pyspark"
  src="{{ site.baseurl }}/images/20200523-docker-pyspark.png"/>
</p>

Considering I will use Spark in my future work, I learnt how to manipulate data
with `pyspark` in a Docker container and am willing to share it with you! In my
blog, I'll talk about the following points:
- Why Spark?
- Why Docker?
- Run the Docker container
- Simple data manipulation with pyspark

## Why Spark?
Spark is a platform for cluster computing. Spark lets you spread data and
computations over clusters with multiple nodes (think of each node as a separate
computer). Splitting up your data makes it easier to work with very large
datasets because each node only works with a small amount of data.

As each node works on its own subset of the total data, it also carries out a
part of the total calculations required, so that both data processing and
computation are performed in parallel over the nodes in the cluster. It is a
fact that parallel computation can make certain types of programming tasks much
faster.

## Why Docker?
Developing apps today requires so much more than writing code. Multiple
languages, frameworks, architectures, and discontinuous interfaces between tools
for each lifecycle stage creates enormous complexity. Docker simplifies and
accelerates your workflow, while giving developers the freedom to innovate with
their choice of tools, application stacks, and deployment environments for each
project.

## Run the Docker container
Here, we will take advantage of the [jupyter/pyspark-notebook][docker-img]
Docker image, since it contains:
- Apache Spark
- Miniconda with Python 2.7.x and 3.x environments
- Jupyter Notebook
- Pre-installed versions of `pyspark`, pandas, matplotlib, scipy, seaborn, and scikit-learn

{% highlight bash %}
docker run -it -p 8888:8888 -v $PWD:/home/jovyan/work jupyter/pyspark-notebook
{% endhighlight %}

- `-it`: run an image interactively
- `-p`: publish a container's port(s) to the host
- `-v`: map current directory (`$PWD`) to the container's `/home/work` directory

For more information about Docker commands, you can find them [here][docker-docs].

## Simple data manipulation with pyspark
### SparkContext & SparkSession
{% highlight python %}
import pyspark
from pyspark.sql import SparkSession

sc = pyspark.SparkContext('local[*]')
spark_session = SparkSession.builder.getOrCreate()
{% endhighlight %}

In order to connect to a Spark cluster from PySpark, we need to create an
instance of the `SparkContext` class with `pyspark.SparkContext`. To start
working with Spark DataFrames, you first have to create a `SparkSession` object
from your `SparkContext`. You can think of the `SparkContext` as your connection
to the cluster and the `SparkSession` as your interface with that connection.

<p align="center">
  <img alt="20200523-spark-session"
  src="{{ site.baseurl }}/images/20200523-spark-session.png"/>
</p>

### Viewing tables
Your `SparkSession` has an attribute called `catalog` which lists all the data
inside the cluster. This attribute has a few methods for extracting different
pieces of information.

One of the most useful is the `.listTables()` method, which returns the names
of all the tables in your cluster as a list.

{% highlight python %}
spark_session.catalog.listTables()
{% endhighlight %}

<p align="center">
  <img alt="20200523-view-tables-1"
  src="{{ site.baseurl }}/images/20200523-view-tables-1.png"/>
</p>

We have no table in our cluster. So I will import a csv file with `pandas`, then
put it into the Spark cluster.

### Put a pandas DataFrame into a Spark cluster

<p align="center">
  <img alt="20200523-import-df"
  src="{{ site.baseurl }}/images/20200523-import-df.png"/>
</p>

{% highlight python %}
spark_temp = spark_session.createDataFrame(pop19_df)
spark_temp.createOrReplaceTempView('pop19')
{% endhighlight %}

The `.createDataFrame()` method takes a `pandas` DataFrame and returns a Spark
DataFrame. The output of this method is stored locally, NOT in the
`SparkSession` catalog. So we can use `.createOrReplaceTempView()` to create a
new temporary table if nothing was there before, or updates an existing table
if one was already defined.

<p align="center">
  <img alt="20200523-view-tables-2"
  src="{{ site.baseurl }}/images/20200523-view-tables-2.png"/>
</p>

### SQL query
{% highlight python %}
pop19_sp = spark_session.sql('SELECT * FROM pop19')
{% endhighlight %}

<p align="center">
  <img alt="20200523-sql-query"
  src="{{ site.baseurl }}/images/20200523-sql-query.png"/>
</p>

### Calculate 2018 population for each country
{% highlight python %}
pop19_sp = pop19_sp.withColumn('pop2018',
                               pop19_sp['pop2019(k)'] / pop19_sp['GrowthRate'])
{% endhighlight %}

<p align="center">
  <img alt="20200523-withColumn"
  src="{{ site.baseurl }}/images/20200523-withColumn.png"/>
</p>

`withColumn(colName, col)` returns a new DataFrame by adding a column or
replacing the existing column that has the same name. Here I divide "pop2019(k)"
by "GrowthRate" for calculating 2018's population.

### Top 10 countries
{% highlight python %}
pop19_sp.filter(pop19_sp['Rank'] < 10).show()
{% endhighlight %}

<p align="center">
  <img alt="20200523-top10"
  src="{{ site.baseurl }}/images/20200523-top10.png"/>
</p>

## Reference
- "Getting to know pyspark", _campus.datacamp.com_. [Online]. Available:
[https://campus.datacamp.com/courses/introduction-to-pyspark/getting-to-know-pyspark?ex=1][r1]
- "Why Dicjer", _www.docker.com_. [Online]. Available: [https://www.docker.com/why-docker][r2]
- Max Melnick, "Quick-start Apache Spark Environment Using Docker Containers",
_maxmelnick.com_. [Online]. Available: [http://maxmelnick.com/2016/06/04/spark-docker.html][r3]
- "0*Vs8O_whiQvaqSyD4", _miro.medium.com_. [Online]. Available:
[https://miro.medium.com/max/2000/0*Vs8O_whiQvaqSyD4.png][r4]

[docker-img]: https://github.com/jupyter/docker-stacks/tree/master/pyspark-notebook
[docker-docs]: https://docs.docker.com/
[r1]: https://campus.datacamp.com/courses/introduction-to-pyspark/getting-to-know-pyspark?ex=1
[r2]: https://www.docker.com/why-docker
[r3]: http://maxmelnick.com/2016/06/04/spark-docker.html
[r4]: https://miro.medium.com/max/2000/0*Vs8O_whiQvaqSyD4.png
