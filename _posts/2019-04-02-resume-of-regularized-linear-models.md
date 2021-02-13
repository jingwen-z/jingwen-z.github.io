---
layout:      post
title:       "Resume of Regularized Linear Models"
date:        "2019-04-02 21:08:43 +0200"
tags:        [Machine-Learning, Regularized-Linear-Models, review]
comments:    true
excerpt:     >
    A good way to reduce overfitting is to regularize the model, which means
    the fewer degrees of freedom it has, the harder it will be for it to
    overfit the data. For a linear model, regularization is achieved by
    constraining the weights of the model. In this blog, I will talk about how
    to constrain the weights of Ridge Regression, Lasso Regression and Elastic
    Net.
cover:       /images/20190402-cheese.jpg
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

<p align="center">
  <img alt="Regularized cheese"
  src="{{ site.baseurl }}/images/20190402-cheese.jpg"/>
</p>

A good way to reduce overfitting is to regularize the model, which means the
fewer degrees of freedom it has, the harder it will be for it to overfit the
data. For a linear model, regularization is achieved by constraining the
**weights of the model**. In this blog, I will talk about how to constrain the
weights of the following models:
- Ridge Regression
- Lasso Regression
- Elastic Net

## Ridge Regression
_Ridge Regression_ is a regularized version of Linear Regression: a
_regularization term_
<img alt="reg term" src="http://latex.codecogs.com/gif.latex?\inline&space;\fn_phv&space;\alpha&space;\sum_{i&space;=&space;1}^{n}\theta&space;_{i}^{2}"/>
is added to the cost function. Note that the regularization term should only be
added to the cost function during training.

The hyperparameter _α_ controls how much you want to regularize the model. If
_α_ = 0, then Ridge Regression is Linear Regression. If _α_ is pretty large,
then all weights end up very close to zero and the result is a flat line going
through the data's mean.

Ridge Regression cost function:
<p align="center">
  <img alt="Ridge Regression cost function"
  src="{{ site.baseurl }}/images/20190402-ridge-regression.png"/>
</p>

We can define **w** as the vector of feature weights, then the regularization
term is equal to
<img alt="l2 norm" src="http://latex.codecogs.com/gif.latex?\inline&space;\fn_phv&space;1/2&space;(\left&space;\|&space;w&space;\right&space;\|_{2})^{2}"/>,
where
<img alt="l2 norm label" src="http://latex.codecogs.com/gif.latex?\inline&space;\fn_phv&space;\left&space;\|&space;\cdot&space;\right&space;\|_{2}"/>
represents the _l2_ norm of the weight vector.

Here is how to perform Ridge Regression with `scikit-learn`:
{% highlight python %}
import numpy as np
from sklearn.linear_model import Ridge

X = 2 * np.random.rand(100, 1)
y = 4 + 3 * X + np.random.rand(100, 1)
ridge_reg = Ridge(alpha=1, solver='cholesky')
ridge_reg.fit(X, y)
ridge_reg.predict([[1.5]])
# array([[5.58066253]])
{% endhighlight %}

## Lasso Regression
_Least Absolute Shrinkage and Selection Operator Regression_ (simply called
_Lasso Regression_) is another regularized version of Linear Regression, it
adds a regularization term to the cost function, but uses the _l1_ norm of the
weight vector instead of half the square of the _l2_ norm.

Lasso Regression cost function:
<p align="center">
  <img alt="Lasso Regression cost function"
  src="{{ site.baseurl }}/images/20190402-lasso-regression.png"/>
</p>

An important characteristic of lasso Regression is that **it tends to
completely eliminate the weights of the least important features**.

Here is how to perform Lasso Regression with `scikit-learn`:
{% highlight python %}
from sklearn.linear_model import Lasso
lasso_reg = Lasso(alpha=0.1)
lasso_reg.fit(X, y)
lasso_reg.predict([[1.5]])
# array([5.53996101])
{% endhighlight %}

## Elastic Net
_Elastic Net_ is a middle ground between Ridge Regression and Lasso Regression.
The regularization term is a simple mix of theirs, we can also control the mix
ratio _r_. When _r_ = 0, Elastic Net is Ridge Regression; when _r_ = 1, Elastic
Net is Lasso Regression.

Elastic Net cost function:
<p align="center">
  <img alt="Elastic Net cost function"
  src="{{ site.baseurl }}/images/20190402-elastic-net.png"/>
</p>

Here is how to perform Lasso Regression with `scikit-learn`:
{% highlight python %}
from sklearn.linear_model import ElasticNet
elastic_net = ElasticNet(alpha=0.1, l1_ratio=0.5)
elastic_net.fit(X, y)
elastic_net.predict([[1.5]])
# array([5.53792412])
{% endhighlight %}

## Conclusion
So when should we use Linear Regression, Ridge Regression, Lasso Regression or
Elastic Net?

It's almost always preferable to have at least a little bit of regularization,
so we should avoid plain Linear Regression. Ridge Regression is a good choice
by default. However, if you suspect that only a few features are useful, you
should choose Lasso Regression or Elastic Net, because they tend to completely
eliminate the weights of the least important features. If the number of
features is greater than the number of training instances or if several
features are strongly correlated, Elastic Net is preferred over Lasso
Regression since Lasso may behave erratically.

## Reference
- Aurélien Géron. 2017. "Chapter 4 Training Models" _Hands-On Machine Learning
with Scikit-Learn & TensorFlow_ p 129-136
- stevepb, "Cheese", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/pawn-chess-pieces-strategy-chess-2430046/][r1]

[r1]: https://pixabay.com/photos/pawn-chess-pieces-strategy-chess-2430046/
