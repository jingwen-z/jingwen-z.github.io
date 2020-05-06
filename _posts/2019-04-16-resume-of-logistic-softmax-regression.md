---
layout:      post
title:       "Resume of Logistic & Softmax Regression"
date:        "2019-04-16 21:08:16 +0200"
tags:        [Machine-Learning, Logistic-Regression, Softmax-Regression, review]
comments:    true
excerpt:     >
    In this blog, I will resume Logistic Regression, Softmax Regression and
    their usecases via Python.
img_url:     /images/20190416-iris.jpg
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="Iris"
  src="{{ site.baseurl }}/images/20190416-iris.jpg"/>
</p>

In this blog, I will talk about two models that are commonly used for
classification tasks: Logistic Regression and Softmax Regression.

## Logistic Regression
_Logistic Regression_ is commonly used to estimate the probability that an
instance belongs to a particular class. It's a binary classifier. Like a Linear
Regression model, a Logistic Regression model computes a weighted sum of the
input features, but instead of outputting the result like the Linear Regression
does, it outputs the _logistic_ of the result (like the following equation).

<p align="center">
  <img alt="Logistic Regression model estimated probability"
  src="{{ site.baseurl }}/images/20190416-logistic-regression.png"/>
</p>

The objective of training is to set the parameter vector θ so that the model
estimates high probabilites for positive instances and low probabilities for
negative instances. This idea is captured by the following cost function:

<p align="center">
  <img alt="Logistic Regression cost function"
  src="{{ site.baseurl }}/images/20190416-logistic-cost-function.png"/>
</p>

This function makes sense since -log(t) grows very large if t approaches 0, so
the cost will be large if the model estimates a probability close to 0 for a
positive instance; and it will also be very large if the model etimates a
probability close to 1 for a negative instance.

### Demo
Let's use the iris dataset and try to build a classifier to detect the
Iris-Virginica type based only on the petal width feature.

{% highlight python %}
>>> from sklearn import datasets
>>> import numpy as np

>>> iris = datasets.load_iris()
>>> list(iris.keys())
['data', 'target', 'target_names', 'DESCR', 'feature_names', 'filename']
>>> X = iris['data'][:, 3:] # petal width
>>> y = (iris['target'] == 2).astype(np.int)

>>> from sklearn.linear_model import LogisticRegression
>>> log_reg = LogisticRegression()
>>> log_reg.fit(X, y)
>>> log_reg.predict([[1.7], [1.5]])
array([1, 0])
{% endhighlight %}

The classifier predicts that if a flower'spetal width is 1.7 cm, then it's an
Iris-Virginica; if a flower'spetal width is 1.5 cm, then it is not an
Iris-Virginica.

## Softmax Regression
The Logistic Regression model can be generalized to support multiple classes
directly, without having to train and combine multiple binary classifiers. This
is called _Softmax Regression_, or _Multinomial Logistic Regression_.

How it works? When given an instance x, the Softmax Regression model first
computes a score
<img alt="s_k(x)" src="http://latex.codecogs.com/png.latex?\fn_phv&space;s_{k}(x)"/>
for each class k, then estimates the probability of each class by applying the
_softmax function_ to the scores.

Softmax score for class k:
<p align="center">
  <img alt="Softmax score for class k"
  src="{{ site.baseurl }}/images/20190416-softmax-score.png"/>
</p>
 Note that each class has its owm dedicated parameter vector
<img alt="theta^k" src="http://latex.codecogs.com/png.latex?\fn_phv&space;\theta&space;^{(k)}"/>.
Once you have computed the score of each class for the insrance x, you can
estimate the probability
<img alt="p^hat_k" src="http://latex.codecogs.com/png.latex?\inline&space;\fn_phv&space;\hat{p}_{k}"/>
that the instance belongs to class k by running the scores through the
softmax function (as follows): it computes the exponential of every score, then
normalizes them.

Softmax function:
<p align="center">
  <img alt="Softmax function"
  src="{{ site.baseurl }}/images/20190416-softmax-function.png"/>
</p>

The objective is to have a model that estimates a high probability for the
target class. Minimizing the cost function called _cross entropy_ should lead
to this objective since it penalizes the odel whenit estimates a low
probability for a target class. **Cross entropy is frequentyly used to measure
how well a set of estimated class probabilities match the target classes.**

Cross entropy cost function:
<p align="center">
  <img alt="Cross entropy cost function"
  src="{{ site.baseurl }}/images/20190416-cross-entropy-cost-function.png"/>
</p>

<img alt="y_k^i" src="http://latex.codecogs.com/png.latex?\inline&space;\fn_phv&space;y_{k}^{(i)}"/>
is equal to 1 if the target class for the ith instance is k; otherwise, it's
equal to 0.

Notice that when K=2, the cost function is equivalent to the Logistic
Regression's cost function.

### Demo
Let's use Softmax Regression to classify the iris flowers into all three classes.

{% highlight python %}
>>> X = iris['data'][:, (2, 3)]
>>> y = iris['target']
>>> softmax_reg = LogisticRegression(multi_class='multinomial', # switch to Softmax Regression
                                     solver='lbfgs', # handle multinomial loss, L2 penalty
                                     C=10)
>>> softmax_reg.fit(X, y)

>>> softmax_reg.predict([[5, 2]])
array([2])
>>> softmax_reg.predict_proba([[5, 2]])
array([[6.38014896e-07, 5.74929995e-02, 9.42506362e-01]])
{% endhighlight %}

If a flower's petal length is 5 cm and its petal width is 2 cm, it is an
Iris-Virginica with 94.2% probability.

## Conclusion
In this blog, I resumed Logistic Regression, Softmax Regression and their
usecases via Python. Hope it's useful for you.

## Reference
- Aurélien Géron. 2017. "Chapter 4 Training Models" _Hands-On Machine Learning
with Scikit-Learn & TensorFlow_ p 136-144
- Fotomanie, "Iris", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/flower-iris-wild-flower-purple-76336/][r1]

[r1]: https://pixabay.com/photos/flower-iris-wild-flower-purple-76336/
