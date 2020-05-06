---
layout:             post
title:              What is Machine Learning?
date:               2016-08-14 23:32:43 +0200
tags:               [Machine-Learning]
comments:           true
---

Machine learning explores the study and construction of algorithms that can
learn from and perform predictive analysis on data. Such algorithms operate by
building a model from an example training set of input observations in order to
make data-driven predictions or decisions expressed as outputs, rather than
following strictly static program instructions.

Machine learning tasks are typically classified into three broad categories,
depending on the nature of the learning "signal" or "feedback" available to a
learning system. These are

*  **Supervised learning**: The computer is presented with example inputs and
   their desired outputs, given by a "teacher", and the goal is to learn a
   general rule that maps inputs to outputs.
*  **Unsupervised learning**: No labels are given to the learning algorithm,
   leaving it on its own to find structure in its input. Unsupervised learning
   can be a goal in itself (discovering hidden patterns in data) or a means
   towards an end (feature learning).
*  **Reinforcement learning**: A computer program interacts with a dynamic
   environment in which it must perform a certain goal (such as driving a
   vehicle), without a teacher explicitly telling it whether it has come close
   to its goal. Another example is learning to play a game by playing against
   an opponent.

In this chapter, DataCamp mainly introduces 3 ML tasks:

*  Classification
*  Regression
*  Clustering

Each of them is applied to different categories of data. Classification is
suitable for the data with predefined classes, it has qualitative output; this
algorithm can be used in medical diagnosis, animal recognition etc. Regression
model estimates its coefficients on previous input-output, its output is
quantitative. Clustering is grouping objects in clusters, it’s similar with
cluster and dissimilar between clusters; this algorithm identifies potential
categories out of a group of observations, without knowing what the expected
categories are in advance.
