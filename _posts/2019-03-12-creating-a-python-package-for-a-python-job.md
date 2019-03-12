---
layout:      post
title:       "Creating a python package for a python job"
date:        "2019-03-12 21:33:16 +0100"
comments:    true
excerpt:     >
    This blog introduces how we create a python package for a python job with
    package structure and some details like SQL queries and data extraction
    with python.
img_url:     /images/20190312-tree.jpg
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="Tree"
  src="{{ site.baseurl }}/images/20190312-tree.jpg"/>
</p>

As a member of data science team, we do not only analyse / explore data with
terrific algorithm, but also create some reports which can help others
departments to make decisions or map out strategies. For creating reports, we
create a python package which contains multiple elements. In this blog, I'll
talk about how we create the python package with following points:

- Structure of python package
- Detail for each element

## Structure of python package

{% highlight bash %}
$ tree
.
├── __init__.py
├── data
│   ├── __init__.py
│   └── job.sql
├── job.py
│── tests
│   ├── __init__.py
│   └── job_test.py
├── .gitlab-ci.yml
└── environment.yml
{% endhighlight %}

## Detail for each element

### __init__.py
The `__init__.py` files are required to make Python treat the directories as
containing packages; this is done to prevent directories with a common name,
such as string, from unintentionally hiding valid modules that occur later on
the module search path. In the simplest case, `__init__.py` can just be an
empty file, but it can also execute initialization code for the package or set
the `__all__` variable. If you want more information, click [here][r1].

### SQL file
In the SQL file, we specify all queries that we need for the report, with
following format:

{% highlight sql %}
WITH    date_start AS
        (
            SELECT CAST('{}' AS DATE) as date_start
        ),

        date_end AS
        (
            SELECT CAST('{}' AS DATE) as date_end
        ),

        stores AS
        (
            SELECT store_id
            FROM stores_table
        ),

        sales AS
        (
            SELECT
                    product_id
                    , SUM(turnover_euros) AS turnover
            FROM sales_table
            WHERE sale_store IN (SELECT * FROM stores)
            AND turnover_euros <> 0
            AND sale_date BETWEEN (SELECT * FROM date_start) AND (SELECT * FROM date_end)
            GROUP BY product_id
        )
{% endhighlight %}

As you read, we put `date_start` and `date_end` as input, search `stores` data
directly from database, and use all of them to filter `sales` data.


### Python file `job.py`
This file describes how to create report with SQL file above.
{% highlight python %}
from datetime import date, timedelta

import pandas as pd
import teradata
from pkg_resources import resource_filename

# start date & end date
date_start = date.today() - timedelta(days=90)
date_end = date.today() - timedelta(days=1)

# connect to Teradata database
udaExec = teradata.UdaExec(appName="HelloWorld",
                           version="1.0",
                           logConsole=False)
session = udaExec.connect(method="odbc",
                          USEREGIONALSETTINGS="N",
                          system="tdprod",
                          username="xxx",
                          password="xxx");

# find & read SQL file
filename = resource_filename('job', 'data/job.sql')

with open(filename, 'r') as myfile:
    ctes_ = myfile.read()

# prepare date_start and date_end
ctes = ctes_.format(date_start.strftime('%Y-%m-%d'),
                    date_end.strftime('%Y-%m-%d'))

# extract "sales" data
q = "{}\nSELECT * FROM {}".format(ctes, 'sales')
df = pd.read_sql(q, session)
{% endhighlight %}

This `.py` script defines start date and end date of report with `datetime.date`,
[connects to Teradata database with `teradata` package][connect2teradata], read
SQL queries with `pkg_resources.resource_filename()`, import SQL query's input
with `.format()`, and extract data with `pandas.read_sql()`.

### Other files
- Test file `job_test.py`
We write tests (e.g. unit tests) in this file. I'll write another blog about how
to write unit test with python in the near furture.

- `.gitlab-ci.yml` & `environment.yml`
They are used for automating job with gitlab runner. If you are interesting in
it, you can find more information [here][gitlabci].


## Reference
- "6.4. Packages", _doc.python.org_. [Online]. Available: [https://docs.python.org/3/tutorial/modules.html#packages][r1]
- TimHill, "Tree image", _pixabay_. [Online]. Available: [https://pixabay.com/photos/tree-sun-sunshine-summer-meadow-2916763][r2]

[r1]: https://docs.python.org/3/tutorial/modules.html#packages
[r2]: https://pixabay.com/photos/tree-sun-sunshine-summer-meadow-2916763
[connect2teradata]: https://jingwen-z.github.io/python-connection-to-teradata-database/
[gitlabci]: https://jingwen-z.github.io/automate-py-jobs-by-gitlab-runner/