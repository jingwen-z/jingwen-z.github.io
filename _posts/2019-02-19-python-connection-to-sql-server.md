---
layout:      post
title:       "Python: Connection to SQL Server from Windows"
date:        "2019-02-19 20:50:46 +0100"
tags:        [python3, database, SQL Server, Windows OS]
comments:    true
excerpt:     >
    This blog will talk about how to connect to SQL Server, connect to a
    specified database and extract data with pyodbc python module.
img_url:     /images/20190219-sqlserver-logo.png
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="SQL Server logo"
  src="{{ site.baseurl }}/images/20190219-sqlserver-logo.png"/>
</p>

In the [last blog][connection teradata] I presented how to connect to Teradata
Database with `teradata` python module. Today I'll talk about how to connect to
[SQL Server][SQL Server] by python with following points:

- Required packages
- Connecting to SQL Server
- Checking databases in SQL Server
- Connecting to a specified database
- Extracting data with SQL query

## Required packages
{% highlight python %}
import pandas as pd
import pyodbc
{% endhighlight %}

`pyodbc` is an open source Python module that makes accessing ODBC databases
simple. It implements the DB API 2.0 specification but is packed with even more
Pythonic convenience.

## Connecting to SQL Server
{% highlight python %}
cnxn = pyodbc.connect("DRIVER={SQL Server};"
                      "Server=sqlprod;"
                      "UID=xxx;"
                      "PWD=xxx;")
{% endhighlight %}

Let's read this example line by line: the first two lines create a connection
to a SQL Server named "sqlprod" using `SQL Server` as the connection method;
then we specify usename and password with `UID` and `PWD`.

## Checking databases in SQL Server
After creating the connection to SQL Server, we can check databases in it.

{% highlight python %}
req_db = ("SELECT * FROM master.sys.databases")
db = pd.read_sql(req_db, cnxn)
{% endhighlight %}

"db" returns rich information of all databases which are contained in SQL
Server, like name, database_id, source_database_id, create_date, etc.

## Connecting to a specified database
By checking databases in SQL Server, we can now connect to a specified database.

{% highlight python %}
cnxn_db1 = pyodbc.connect("DRIVER={SQL Server};"
                          "Server=sqlprod;"
                          "Database=db1;"
                          "UID=xxx;"
                          "PWD=xxx;")
{% endhighlight %}

Connecting to a database should specify the database-name in `pyodbc.connect()`.

## Extracting data with SQL query
{% highlight python %}
req = ("SELECT TOP 5 * FROM TABLE")
df = pd.read_sql(req, cnxn_db1)
{% endhighlight %}

To connect to "TABLE" of database "db1", we need to precise the connection
"cnxn_db1" when execute SQL query with `pandas.read_sql()`.

## Reference
- M. Kleehammer, "pyodbc", _GitHub_, 2017. [Online]. Available: [https://github.com/mkleehammer/pyodbc][r1]
- "SQL Server Logo.png", _FANDOM_, 2019. [Online]. Available: [http://logos.wikia.com/wiki/Microsoft_SQL_Server][r2]

[connection teradata]: https://jingwen-z.github.io/python-connection-to-teradata-database/
[SQL Server]: https://en.wikipedia.org/wiki/Microsoft_SQL_Server
[r1]: https://github.com/mkleehammer/pyodbc
[r2]: http://logos.wikia.com/wiki/Microsoft_SQL_Server