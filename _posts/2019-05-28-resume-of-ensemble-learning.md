---
layout:             post
title:              "Resume of Ensemble Learning"
lang:        en
date:               "2019-05-28 18:54:17 +0200"
last_modified_at:   2019-06-11 22:01:31 +0200
tags:               [Machine-Learning, Ensemble-Learning, review]
comments:           true
excerpt:            >
    In this blog, I introduced 3 Ensemble Learning algorithms: Voting
    Classifiers, Bagging and Pasting, Random Forests.
cover:              /images/20190528-ensemble.jpg
img_width:          1280
img_height:         853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

Suppose you ask a complex question to thousands of random people, then
aggregate their answers. In many cases you will find that this aggregated
answer is better than an expert's answer. Similarly, if you aggregate the
predictions of a group of predictors, you will often get better predictions
than with the best individual predictor. This technique is called _Ensemble
Learning_, an Ensemble Learning algorithm is called an _Ensemble method_. In
this blog I'll talk about following Ensemble Learning algorithms:
- Voting Classifiers
- Bagging and Pasting
- Random Forests

## Voting Classifiers
Imagine that you have trained a few classifiers, each one achieves about 80%
accuracy. You may have a Logistic Regression classifier, an SVM classifier, a
Random Forest classifier, a K-Nearest Neighbors classifier and perhaps a few
more. A way to create a better classifier is to aggregate the predictions of
each classifier and predict the class that gets the most votes.

The following codes create and train a voting classifier in Scikit-Learn,
composed of 3 diverse classifiers:

{% highlight python %}
from sklearn.ensemble import RandomForestClassifier
from sklearn.ensemble import VotingClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC

log_clf = LogisticRegression(random_state=42)
rnd_clf = RandomForestClassifier(random_state=42)
svm_clf = SVC(random_state=42)

voting_clf = VotingClassifier(
    estimators=[('lr', log_clf), ('rf', rnd_clf), ('svc', svm_clf)],
    voting='hard')
voting_clf.fit(X_train, y_train)
{% endhighlight %}

{% highlight python %}
>>> from sklearn.metrics import accuracy_score

>>> for clf in (log_clf, rnd_clf, svm_clf, voting_clf):
...     clf.fit(X_train, y_train)
...     y_pred = clf.predict(X_test)
...     print(clf.__class__.__name__, accuracy_score(y_test, y_pred))

# LogisticRegression 0.864
# RandomForestClassifier 0.872
# SVC 0.888
# VotingClassifier 0.896
{% endhighlight %}

If all classifiers are able to estimate class probabilities, then you can let
Scikit-Learn predict the class with the highest class probability, averaged
over all the individual classifiers. This is called _soft voting_. It often
achieves higher performance than hard voting because it gives more weight to
highly confident votes. You only need to replace `voting='hard'` with
`voting='soft'` and ensure that all classifiers can estimate class
probabilities. For SVC classifier, we need to set its `probability`
hyperparameter to `True`.

## Bagging and Pasting
Another approach is to use the same training algorithm for every predictor, but
to train them on different random subsets of the training set. When sampling is
performed _with_ replacement, this method is called _bagging_. When sampling is
performed _without_ replacement, it's called _pasting_.

Scikit-Learn offers a simple API for both bagging and pasting with the
`BaggingClassifier` class. The following codes train an ensemble of 500
Decision Tree classifiers, each train on 100 training instances randomly
sampled from the training set with replacement.

{% highlight python %}
from sklearn.ensemble import BaggingClassifier
from sklearn.tree import DecisionTreeClassifier

bag_clf = BaggingClassifier(
    DecisionTreeClassifier(random_state=42), n_estimators=500,
    max_samples=100, bootstrap=True, n_jobs=-1, random_state=42)

bag_clf.fit(X_train, y_train)
y_pred = bag_clf.predict(X_test)
{% endhighlight %}

The `BaggingClassifier` automatically performs soft voting if the base
classifier can estimate class probabilities.

## Random Forests
A Random Forest is an ensemble of Decision Trees, generally trained via the
bagging method, typically with `max_samples` set to the size of the training
set. Instead of building a `BaggingClassifier` and passing it a
`DecisionTreeClassifier`, you can instead use the `RandomForestClassifier`
class, which is more convenient and optimized for Decision Trees. The following
codes train a Random Forest classifier with 500 trees:

{% highlight python %}
from sklearn.ensemble import RandomForestClassifier

rnd_clf = RandomForestClassifier(n_estimators=500,
                                 max_leaf_nodes=16,
                                 n_jobs=-1,
                                 random_state=42)
rnd_clf.fit(X_train, y_train)

y_pred_rf = rnd_clf.predict(X_test)
{% endhighlight %}

With a few exceptions, a `RandomForestClassifier` has all the hyperparameters
of a `DecisionTreeClassifier` plus all the hyperparameters of a
`BaggingClassifier` to control the ensemble itself. The Random Forest algorithm
introduces extra randomness when growing trees; instead of searching for the
very best feature when splitting a mode, it searches for the best feature among
a random subset of features. This results in a greater tree diversity, which
trades a higher bias for a lower variance.

## Conclusion
In this blog, I introduced 3 Ensemble Learning algorithms: Voting Classifiers,
Bagging and Pasting, Random Forests. Hope it's useful for you.

## Reference
- Aurélien Géron. 2017. "Chapter 7 Ensemble Learning and Random Forests"
_Hands-On Machine Learning with Scikit-Learn & TensorFlow_ p 183-193
- yunje5054, "Ensemble music played saxophone", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/ensemble-music-played-saxophone-619258/][r1]

[r1]: https://pixabay.com/photos/ensemble-music-played-saxophone-619258/
