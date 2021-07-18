---
layout:             post
title:              Training set and Test set
lang:        en
date:               2016-08-20 23:32:43 +0200
tags:               [Machine-Learning, R]
comments: true
cover:       /images/20160820-header-img.jpg
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

As I mentioned in my blog "[What is Machine Learning][blog-1]", Machine Learning
tasks are typically classified into three broad categories, one of them is
_Supervised learning_. In the supervised learning setting, it is important to
understand the concept of two sets: **Training set** and **Test set**, which are
useful to make good predictions about unseen observations.

When learning a predictive model, we should not use the complet dataset to train
a model, we only use so-called _training set_ for this; the other part of the
dataset is called _test set_, which can be used to evaluate performance of model.
It's really important to realise that training set and test set are disjoint sets,
they don't have any observation in common, this makes it's possible to test our
model on unseen data.

## Split the dataset

First, we need to split our dataset. Here I refer to [DataCamp][DataCamp]'s slide
to explain its theorem. Suppose that we have N observations, K features and
class labels for each observations y.

<p align="center"><img alt="Training set & Test set" src="{{ site.baseurl }}/
images/20160820-training set & test set.png"/></p>

For the _training set_, we use the first r observations, then use the features
and the class label to train a model. For the _test set_, we use the observations
from r+1 until the end of the dataset, then use the features classified
observations and compare the prediction with the actual class y. The confusion
matrix that results gives us clear ideas of the actual predicted performance
of the classifier.

Then, how to choose _training set_ and _test set_? We should choose _training set_
which is **larger** than _test set_, and the ratio is typically _3/1_(arbitrary)
in the _training set_ over the _test set_. But make sure that your _test set_ is
NOT too small!

For example, you could use the following commands to shuffle a data frame df
and divide it into training and test sets with a 60/40 split between the two.

{% highlight r %}
n <- nrow(df)
shuffled_df <- df[sample(n), ]
train_indices <- 1:round(0.6 * n)
train <- shuffled_df[train_indices, ]
test_indices <- (round(0.6 * n) + 1):n
test <- shuffled_df[test_indices, ]
{% endhighlight %}

## Distribution of the sets

It's important that you choose wisely which elements you put in the _training
set_ and which ones you put in the _test set_. For _Classification_, the classes
inside the _training_ and _test_ set must have similar distributions, avoid a
class not being available in a set. For _Classification & Regression_, it's
always a smart idea to shuffle dataset before splitting.

## Effect of sampling

Finally, be aware of the effect that the sampling of data in a certain way to
compose the _test set_ can influence the performance measures on the set. In
order to add robustness to these measures, we can use **cross-validation**,
which means that we use a learning algorithm to train a model multiple times,
each time with different separations of _training_ and _test set_. _n-fold
cross-validation_ means the _test set_ is fold n times, each _test set_ is
_1/n_ size of total dataset.

For example, you will fold the dataset 6 times and calculate the accuracy
for each fold. The mean of these accuracies forms a more robust estimation
of the model's true accuracy of predicting unseen data, because it is less
dependent on the choice of training and test sets.

{% highlight r %}
# Initialize the accs vector
accs <- rep(0,6)

for (i in 1:6) {
  # These indices indicate the interval of the test set
   indices <- (((i-1) * round((1/6)*nrow(shuffled))) + 1)
                    :((i*round((1/6) * nrow(shuffled))))
  # Exclude them from the train set
  train <- shuffled[-indices,]
  
  # Include them in the test set
  test <- shuffled[indices,]
  
  # A model is learned using each training set
  tree <- rpart(Survived ~ ., train, method = "class")
  
  # Make a prediction on the test set using tree
  pred <- predict(tree, test, type = "class")
  
  # Assign the confusion matrix to conf
  conf <- table(test$Survived, pred)
  
  # Assign the accuracy of this model to the ith index in accs
  accs[i] <- sum(diag(conf))/sum(conf)
}
{% endhighlight %}

## Reference
- Kendal, "person holding amber glass bottles", _unsplash.com_. [Online]. Available: [https://unsplash.com/photos/L4iKccAChOc][img]

[blog-1]:https://jingwen-z.github.io/what-is-machine-learning
[DataCamp]:https://www.datacamp.com/home
[img]: https://unsplash.com/photos/L4iKccAChOc
