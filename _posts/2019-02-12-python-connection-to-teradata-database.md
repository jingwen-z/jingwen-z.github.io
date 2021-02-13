---
layout:             post
title:              "Python: Connection to Teradata Database"
date:               2019-02-12 21:33:39 +0100"
last_modified_at:   2019-02-19 22:23:14 +0100
tags:               [python3, database, Teradata]
comments:           true
excerpt:            >
    This blog will talk about how to connect to Teradata database and extract
    data with teradata python module.
cover:              /images/20190212-teradata-logo.png
img_width:          1280
img_height:         853
---

<p align="center">
  <img alt="Teradata logo"
  src="{{ site.baseurl }}/images/20190212-teradata-logo.png"/>
</p>

As a data scientist, we need to extract data inevitably. Before extracting
data, we should firstly connect to database. In this blog, I'll talk about how
to connect to [Teradata Database][Teradata] with following points:

- Required packages
- Connecting to Teradata database
- Extracting data with SQL query

## Required packages
{% highlight python %}
import pandas as pd
import teradata
{% endhighlight %}

`teradata` module is a freely available, open source, library for the Python
programming language, whose aim is to make it easy to script powerful
interactions with Teradata Database. It adopts the philosophy of udaSQL,
providing a DevOps focused SQL Execution Engine that allows developers to focus
on their SQL and procedural logic without worrying about Operational
requirements such as external configuration, query banding, and logging.

## Connecting to Teradata database
{% highlight python %}
udaExec = teradata.UdaExec(appName="HelloWorld", version="1.0",
                           logConsole=False)
session = udaExec.connect(method="odbc",
                          USEREGIONALSETTINGS="N",
                          system="tdprod",
                          username="xxx",
                          password="xxx");
{% endhighlight %}

Let's read this example line by line: The first line initializes the `UdaExec`
framework that provides DevOps support features such as configuration and
logging. We tell UdaExec the name and version of our application during
initialization so that we can get feedback about our application in DBQL and
Teradata Viewpoint as this information is included in the QueryBand of all
database sessions created by our script.  We also tell UdaExec not to log to
the console (e.g. `logConsole=False`) so that our print statement is easier to
read. The second line creates a connection to a Teradata system named "tdprod"
using `ODBC` as the connection method, and specify `USEREGIONALSETTINGS="N"` to
ensure that float values can be loaded and make decimal separator be '.'

## Extracting data with SQL query
After creating the connection to Teradata, we can extract data by SQL query.

{% highlight python %}
employee_req = ("SELECT DISTINCT employee_id, employee_name, "
                "employee_salary "
                "FROM SALARY")
employee_df = pd.read_sql(employee_req, session)
{% endhighlight %}

We can apply `session` in `pandas.read_sql()` in order to executing SQL query
`employee_req`.

## Reference
- "Teradata Python Module", _Developer.teradata.com_, 2015. [Online]. Available: [https://developer.teradata.com/tools/reference/teradata-python-module][r1]
- E. Scheie, O. Ratzesberger and B. Lewis, "Teradata/PyTd", _GitHub_, 2015. [Online]. Available: [https://github.com/Teradata/PyTd][r2]
- "Teradata Logo.png", _En.wikipedia.org_, 2012. [Online]. Available: [https://en.wikipedia.org/wiki/File:Teradata_Logo.png][r3]

[Teradata]: https://en.wikipedia.org/wiki/Teradata
[r1]: https://developer.teradata.com/tools/reference/teradata-python-module
[r2]: https://github.com/Teradata/PyTd
[r3]: https://en.wikipedia.org/wiki/File:Teradata_Logo.png
