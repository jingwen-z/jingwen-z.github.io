---
layout:             post
title:              "Coursera project catch the pink flamingo"
lang:        en
date:               2017-02-03 18:31:21 +0100
last_modified_at:   2018-07-24 21:42:23 +0200
tags:               [MOOC]
permalink:         /how-can-we-increase-revenue-from-catch-the-pink-flamingo/
comments:           true
excerpt:            >
    This blog presents the Coursera project "catch the pink flamingo". Here,
    you can find the data model design like classification, clustering, and the
    histogram made by splunk.
cover:       /images/20170203-flamingo.jpg
img_width:   640
img_height:  426
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

During last December and January, I participated Big Data courses on the website
[Coursera][Coursera], like what I mentioned in my [previous blog][previous blog].
Since schedual of the was really substantial, I didn't have time to summary the
knowledge in time, but they will be finished in several weeks. Today the capstone
project of this course was finished, I want to firstly share this project with
you by this blog.

## Context
All the data are about a mobile game, named "Catch the Pink Flamingo". It's
producted by Eglence Inc. It’s a multi-user game where the players have to catch
Pink Flamingos that randomly pop up on a gridded world map based on missions
that change in real-time.

## Objective
The objective of the game is to catch as many Pink Flamingos as possible by
following the missions provided by real-time prompts in the game and cover the
map provided for each level. The levels get more complicated in mission speed
and map complexity as the users move from level to level.

## Problem Statement
In order to increase the revenue generated by the game “Catch The Pink Flamingo”,
we need three subjects of datasets.

In the first one, _“flamingo-data”_, it contains 8 CSV files containing simulated
game data and log data for the Catch the Pink Flamingo Simulated Game Data.
These data will be used for data exploration in [Splunk][Splunk].

The _“combined-data”_ contains a single CSV file created by aggregating data from
several game data files. It is intended to be used for identifying big spenders
with [KNIME][KNIME].

And _“chat-data”_ contains 6 CSV files representing simulated chat data related
to the Catch the Pink Flamingo game to be used in Graph Analytics with
[neo4j][neo4j].

Combining all datasets together, analysing in different technologies will
contribute to our decision in increasing revenue from game players.

## Data Exploration Overview
Before analysing, let’s make some graphs to understand the data. Importing
datasets of _”flamingo-data”_ into **Splunk**, using aggregation functions to
make histograms as follows.

<p align="center">
  <img alt="Data Exploration 1" src="{{ site.baseurl }}/images/20170203-dataExploration1.png"/>
</p>

The first histogram is made by the data in _“buy-clicks”_, which shows how many
times each item is purchased. Among six items, the item “2” is the most purchased,
the item “1” is the least purchased.

<p align="center">
  <img alt="Data Exploration 2" src="{{ site.baseurl }}/images/20170203-dataExploration2.png"/>
</p>

The second one is made by the same dataset. According to this graph, we get
different amount of money that made from each item. Among them, the item “5”
made the most money, and the item “1” made the least money, which is also the
least purchased, it means the item “1” is not preferred by most people. In this
case, providers should think about strategies to change this situation or to
solve this problem.

## Classification
For the first method, we used _“combined-data”_, and classified users with
`Decision Tree` in **KNIME** to identify big spenders in the game. The
objective is to predict which user is likely to purchase big-ticket items while
playing game.

Using the file _“combined_data”_, we defined two categories for price:
HighRollers, who spend more than $5.00 to buy the items, and PennyPinchers, who
spend $5.00 or less to buy the items. In this graph, red stands for the
PennyPinchers, blue stands for the HighRollers.

<p align="center">
  <img alt="Decision Tree" src="{{ site.baseurl }}/images/20170203-decision-tree.png"/>
</p>

According to the resulting decision tree, it obviously shows that the predicted
`user_category` is different in various platforms, the users on the platform
android, linux, windows and mac are almost PennyPincher, however, most users
which on the platform iphone are HighRoller.

Furthermore, thanks to the confusion matrix, our model has a **88.5%** accuracy
rate.

## Clustering
In this part, the `Clustering` method is applied, which is completed in
**iPython Notebook** with **Spark MLlib**.

Before beginning, I chose 3 attributes: _amount of ad-clicking per user, amount
of game-clicking per user_ and _total price spent by each user_. Then training
data set is created by combining the 3 attributes in a table. Finally, training
to create cluster centres and getting the following results.

<table style="margin:auto; text-align:center">
  <tr>
    <th>
      <b>Cluster</b>
    </th>
    <th>
      <b>Total ad clicking</b>
    </th>
    <th>
      <b>Total game clicking</b>
    </th>
    <th>
      <b>Revenue</b>
    </th>
  </tr>
  <tr>
    <td>1</td>
    <td>25.12</td>
    <td>362.50</td>
    <td>35.36</td>
  </tr>
  <tr>
    <td>2</td>
    <td>32.05</td>
    <td>2393.95</td>
    <td>41.20</td>
  </tr>
  <tr>
    <td>3</td>
    <td>36.47</td>
    <td>953.82</td>
    <td>46.16</td>
  </tr>
</table>

Cluster 1 is different from the others in that the users’ ad-clicks, game-clicks
and cost are all less than others, this kind of users can be called “low level
spending user”.

Cluster 3 is different from the others in that the users’ ad-clicks, game-clicks
and cost are all more than others, this kind of users can be called “high level
spending user”.

Cluster 2 is different from the others in that the ad-clicks is not the least,
game-clicks is the most but their cost is not the most, this kind of users can
be called “neutral user”.

The results reflect that the ad clicking amount of “high level spending user” is
_1.45 times more_ than “low level spending user” and _1.14 times more_ than 
“neutral user”; the game clicking amount of “high level spending user” is _2.63
times more_ than “low level spending user” ; finally, the revenue from “high
level spending user” is _1.31 times higher_ than “low level spending user” and
_1.12 times higher_ than “neutral user”.

## Chat Graph Analysis
In the last part, the Chat `Graph Analysis` is achieved by **Neo4J**.

The CSV data files of _“chat-data”_ are loaded into Neo4J. Then we firstly find
the **top 10 chattiest users** by matching all users with a CreateChat edge,
return the users’ ID and the count of the users.

<table style="margin:auto; text-align:center">
  <tr>
    <th>
      <b>Users</b>
    </th>
    <th>
      <b>Number of Chats</b>
    </th>
  </tr>
  <tr>
    <td>394</td>
    <td>115</td>
  </tr>
  <tr>
    <td>2067</td>
    <td>111</td>
  </tr>
  <tr>
    <td>209</td>
    <td>109</td>
  </tr>
  <tr>
    <td>1087</td>
    <td>109</td>
  </tr>
  <tr>
    <td>554</td>
    <td>107</td>
  </tr>
  <tr>
    <td>516</td>
    <td>105</td>
  </tr>
  <tr>
    <td>1627</td>
    <td>105</td>
  </tr>
  <tr>
    <td>999</td>
    <td>105</td>
  </tr>
  <tr>
    <td>668</td>
    <td>104</td>
  </tr>
  <tr>
    <td>461</td>
    <td>104</td>
  </tr>
</table>

Secondly, we find the **top 10 chattiest teams** by matching all ChatItems with
a PartOf edge connecting them with a TeamChatSession node and the TeamChatSession
nodes must have an OwnedBy edge connecting them with any other node, and return
the count of teams as well.

<table style="margin:auto; text-align:center">
  <tr>
    <th>
      <b>Teams</b>
    </th>
    <th>
      <b>Number of Chats</b>
    </th>
  </tr>
  <tr>
    <td>82</td>
    <td>1324</td>
  </tr>
  <tr>
    <td>185</td>
    <td>1306</td>
  </tr>
  <tr>
    <td>112</td>
    <td>957</td>
  </tr>
  <tr>
    <td>18</td>
    <td>844</td>
  </tr>
  <tr>
    <td>194</td>
    <td>836</td>
  </tr>
  <tr>
    <td>129</td>
    <td>814</td>
  </tr>
  <tr>
    <td>52</td>
    <td>788</td>
  </tr>
  <tr>
    <td>136</td>
    <td>783</td>
  </tr>
  <tr>
    <td>146</td>
    <td>746</td>
  </tr>
  <tr>
    <td>81</td>
    <td>736</td>
  </tr>
</table>

According to the first two tables, we get the third table which identifies among
the top 10 chattiest users, one of them belongs to chattiest teams, i.e. the
user “999” belongs to the team “52”, but other 9 users are not part of the top
10 chattiest teams. This states that most of the chattiest users are not in the
chattiest teams.

<table style="margin:auto; text-align:center">
  <tr>
    <th>
      <b>Users</b>
    </th>
    <th>
      <b>Teams</b>
    </th>
    <th>
      <b>Number of Chats</b>
    </th>
  </tr>
  <tr>
    <td>394</td>
    <td>63</td>
    <td>115</td>
  </tr>
  <tr>
    <td>2067</td>
    <td>7</td>
    <td>111</td>
  </tr>
  <tr>
    <td>209</td>
    <td>7</td>
    <td>109</td>
  </tr>
  <tr>
    <td>1087</td>
    <td>77</td>
    <td>109</td>
  </tr>
  <tr>
    <td>554</td>
    <td>181</td>
    <td>107</td>
  </tr>
  <tr>
    <td>516</td>
    <td>7</td>
    <td>105</td>
  </tr>
  <tr>
    <td>1627</td>
    <td>7</td>
    <td>105</td>
  </tr>
  <tr>
    <td>
      <b>999</b>
    </td>
    <td>
      <b>52</b>
    </td>
    <td>105</td>
  </tr>
  <tr>
    <td>461</td>
    <td>104</td>
    <td>104</td>
  </tr>
  <tr>
    <td>668</td>
    <td>89</td>
    <td>104</td>
  </tr>
</table>

## Recommendation
Following previous results, here are some recommendations to be considered:

- _Offer more products to iPhone users._ According to the decision tree
classification, it reflects that most users which on the platform iPhone are
HighRollers, so offering more products to them can increase our revenue.

- _Provide more products to “high level spending user”,_ which is similar as the
first one, but the users are not totally identical. Thanks to Clustering results,
we know that the “high level spending user” clicked less but buy more than
others, we can provide more products to them for increasing the revenue.

- _Provide some fixed pay packages or promotion to users, especially to “low
level spending user”._ This action can stimulate consumption of users, and since
the paying probability of “low level spending user” is low, the promotion can
encourage them to purchase.

Moreover, you can consult the [slides][slides] and
[technical appendix][technical appendix] on my [GitHub][GitHub], all propositions
are welcome!

## Easter Egg

After finishing all courses in Big Data specilization, I got a certificate as
follows.

<img alt="Decision Tree" src="{{ site.baseurl }}/images/20170203-certificate.png"/>

Thanks to the courses, I had a better understanding of Big Data, and got my
dream job, Data Scientist. Well, a new journey will begin!

## Reference
- Yucel Moran, "flock of flamingo on body of water", _unsplash.com_. [Online]. Available: [https://unsplash.com/photos/AiEL7IwzzMg][img]

[Coursera]: https://www.coursera.org
[previous blog]: https://jingwen-z.github.io/introduction-bd-week1-2
[Splunk]: https://www.splunk.com
[KNIME]: https://www.knime.org
[neo4j]: https://neo4j.com
[slides]: https://github.com/jingwen-z/bigdata-ucsd/blob/master/capstone-project/How%20can%20we%20increase%20revenue%20%20from%20Catch%20the%20Pink%20Flamingo%3F.pdf
[technical appendix]: https://github.com/jingwen-z/bigdata-ucsd/blob/master/capstone-project/Technical%20Appendix.pdf
[GitHub]: https://github.com/jingwen-z/bigdata-ucsd/tree/master/capstone-project
[img]: https://unsplash.com/photos/AiEL7IwzzMg
