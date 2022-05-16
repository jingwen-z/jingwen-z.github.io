---
layout:      post
title:       "Learning PostgreSQL with Docker"
lang:        en
date:        "2022-05-14 22:41:35 +0200"
tags:        [python3, pgsql, Docker]
comments:    true
excerpt:     >
    This blog talks about how to create a PostgreSQL database and tables with
    Docker container and how to insert a dataframe into PostgreSQL database with
    Python.
cover:       /images/20220514-pgsql-docker.png
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---
## Introduction
During the recent work, I need to write data into PostgreSQL database. Before writing real data on staging, I learnt how to do it with Docker. In this blog, I'll talk about this with the following points:
- What is PostgreSQL?
- Why Docker?
- Create a database and tables with Docker container
- Insert data with Python

## What is PostgreSQL?
PostgreSQL is a powerful, open source object-relational database system that
uses and extends the SQL language combined with many features that safely store
and scale the most complicated data workloads. PostgreSQL comes with many
features aimed to help developers build applications, administrators to protect
data integrity and build fault-tolerant environments, and help you manage your
data no matter how big or small the dataset. In addition to being free and open
source, PostgreSQL is highly extensible. For example, you can define your own
data types, build out custom functions, even write code from different
programming languages without recompiling your database!

## Why Docker?
Developing apps today requires so much more than writing code. Multiple
languages, frameworks, architectures, and discontinuous interfaces between tools
for each lifecycle stage creates enormous complexity. Docker simplifies and
accelerates your workflow, while giving developers the freedom to innovate with
their choice of tools, application stacks, and deployment environments for each
project.

## Create a database and tables with Docker container
Here, I used the official docker image of [postgres][pgsql-docker-image] to
create a database and tables.

### Create a database
```
CREATE DATABASE xxx;
```
<p align="center">
  <img alt="20220514-create-db"
  src="{{ site.baseurl }}/images/20220514-create-db.png"/>
</p>

### Create a table
We can create a table with [`CREATE TABLE`][pgsql-create-table] and insert value
into it with [`INSERT INTO table_name (column_name) VALUES (values)`][pgsql-insert-into-values].

```
CREATE TABLE jsonb_test (
    id INT GENERATED ALWAYS AS IDENTITY,
    parameters jsonb
);
INSERT INTO jsonb_test ("parameters") VALUES ('{"param1":"value1","param2":22,"param3":[3,33]}');
```
<p align="center">
  <img alt="20220514-create-table-insert-values"
  src="{{ site.baseurl }}/images/20220514-create-table-insert-values.png"/>
</p>

### Deletion
To delete data in a table with conditions or data a whole table, we can use
`DELETE FROM table_name WHERE xxx;` or `DELETE FROM table_name` or
`DROP TABLE tb_name`.

## Insert data with Python
Here, I used the official docker images of [python3][python3-docker-image].
Now we will insert a pandas dataframe `pdf` into the table `jsonb_test`:

<p align="center">
  <img alt="20220514-table-jsonb"
  src="{{ site.baseurl }}/images/20220514-table-jsonb.png"/>
</p>

```python
from sqlalchemy import create_engine
import pandas as pd

pdf = pd.DataFrame({'parameters':['{"param1":"v1", "param2": 2}']})
```

<p align="center">
  <img alt="20220514-create-pandas-df"
  src="{{ site.baseurl }}/images/20220514-create-pandas-df.png"/>
</p>

```
eng_pg = create_engine("postgresql://postgres:{pw}@{host}/pgdb".format(pw=PASSWORD],
                                                                       host=HOST_NAME))
pdf.to_sql("jsonb_test", eng_pg, if_exists='append', index=False)
```
Before inserting the dataframe into PGSQL, we need to create a PGSQL engine with
`create_engine` by specifying the host name and password, then insert the
dataframe with `to_sql`.

<p align="center">
  <img alt="20220514-create-engine"
  src="{{ site.baseurl }}/images/20220514-create-engine.png"/>
</p>

<p align="center">
  <img alt="20220514-check-table"
  src="{{ site.baseurl }}/images/20220514-check-table.png"/>
</p>

With the check above, we can ensure that we insert the dataframe successfully.

## References
- "About PostgreSQL", _postgresql.org_. [Online]. Available: [https://www.postgresql.org/about/][r1]
- "How to run PostgreSQL and pgAdmin on Docker on Fedora 31?", _medium.com_. [Online]. Available: [https://medium.com/@amiry.jd/how-to-run-postgresql-and-pgadmin-on-docker-on-fedora-31-e0bda8c65e3d][image]

[r1]: https://www.postgresql.org/about/
[pgsql-docker-image]: https://hub.docker.com/_/postgres/
[python3-docker-image]: https://hub.docker.com/_/python
[pgsql-create-table]: https://www.postgresql.org/docs/9.1/sql-createtable.html
[pgsql-insert-into-values]: https://www.postgresql.org/docs/current/sql-insert.html
[image]: https://medium.com/@amiry.jd/how-to-run-postgresql-and-pgadmin-on-docker-on-fedora-31-e0bda8c65e3d
