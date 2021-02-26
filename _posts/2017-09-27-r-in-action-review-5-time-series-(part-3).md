---
layout:      post
title:       "R IN ACTION Review 5 - Time series (Part 3)"
date:        "2017-09-27 22:15:39 +0200"
tags:        [R, Machine-Learning, Time-series]
comments:    true
cover:       /images/20170729-night.jpg
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---

In this blog, I'll introduce ARIMA forecasting models. In the _autoregressive
integrated moving average (ARIMA)_ approach to forecasting, predicted values are
a linear function of recent actual values and recent errors of prediction
(residuals). Before describing ARIMA models, we need to define a number of terms:
lags, autocorrelation, partial autocorrelation, stationarity and differencing[1].

## Prerequisite concepts

When you _lag_ a time series, you shift it back by a given number of
observations. _Autocorrelation_ measures the way observations in a time series
relate to each other. <img alt="AC_k" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;AC_{k}"/>
is the correlation between a set of observations
(<img alt="Y_t" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;Y_{t}"/>) and
observationsk periods earlier
(<img alt="Y_t-k" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;Y_{t-k}"/>).
So <img alt="AC_1" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;AC_{1}"/>
is the correlation between the Lag 1 and Lag 0 time series,
<img alt="AC_2" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;AC_{2}"/> is the
correlation between the Lag 2 and Lag 0 time series, and so on. Plotting these
correlations produices an _autocorrelation function (ACF) plot_. The ACF plot is
used to select appropriate parameters for the ARIMA model and to assess the fit
of the final model. An ACF plot can be produced with the `acf()` function in the
`stats` package or the `Acf()` function in the `forecast` package. Here, `Acf()`
function is used because it produces a plot that is somewhat easier to read.

A _partial autocorrelation_ is the correlation between
<img alt="Y_t" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;Y_{t}"/>
and <img alt="Y_t-k" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;Y_{t-k}"/>
with the effects of all Y values between the two removed. Partial
autocorrelations can also be plotted for multiple values of _k_. The PACF plot
can be generated with either the `pacf()` function in the `stats` package or the
`Pacf()` function in the `forecast` package. The PACF plot is also used to
determine the most appropriate parameters for the ARIMA model.

ARIMA models are designed to fit _stationary_ time series. In a stationary time
series, the statistical properties of the series don't change over time. Because
stationary time series are assumed to have constant means, they can't have a
trend component. Many non-stationary time series can be made stationary through
_differencing_. In differencing, each value of a time series
<img alt="Y_t" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;Y_{t}"/>
is replace with
<img alt="Y_t-1-Y_t" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;Y_{t-1}-Y_{t}"/>.
Differencing a time series once removes a linear trend. Differencing it a second
time removes a quadratic trend. A third time removes a cubic trend. It's rarely
necessary to difference more than twice.

Stationarity is often evaluated with a visuel inspection of a time-series plot.
If the variance isn't constant, the data are transformed. If there are trends,
the data are difference. You can also use a statistical procedure called the
_Augmented Dickey-Fuller (ADF) test_ to evaluate the assumption of stationarity.

With these concepts in hand, we can turn to fitting models with an
autoregressive (AR) component, a moving averages (MA) component, or both
components (ARMA). Finally, we'll examine ARIMA models that include ARMA
components and differencing to achieve stationarity.

## ARMA and ARIMA models

In an _autoregressive_ model of order _p_, each value in a time series is
predicted from a linear combinatioin of the previous p values

<p align="center">
<img alt="AR" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;AR(p):&space;Y_{t}&space;=&space;\mu&space;&plus;&space;\beta&space;_{1}Y_{t-1}&space;&plus;&space;\beta&space;_{2}Y_{t-2}&space;&plus;&space;...&space;&plus;&space;\beta&space;_{p}Y_{t-p}&space;&plus;\epsilon&space;_{t}"/>
</p>

where <img alt="Y_t" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;Y_{t}"/>
is a given value of the series, _µ_ is the mean of the series, the
<img alt="betas" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;\beta&space;_{s}"/>
are the weights, and <img alt="epsilon" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;\epsilon&space;_{s}"/>
is the irregular component.

In a _moving average_ model of order _q_, each value in the time series is
predicted from a linear combination of q previous errors. In this case

<p align="center">
<img alt="MA" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;MA(q):&space;Y_{t}&space;=&space;\mu&space;-&space;\theta&space;_{1}\epsilon&space;_{t-1}&space;-&space;\theta&space;_{2}\epsilon&space;_{t-2}&space;...&space;-&space;\theta&space;_{q}\epsilon&space;_{t-q}&space;&plus;&space;\epsilon&space;_{t}"/>
</p>

where the <img alt="epsilons" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;\epsilon&space;_{s}"/>
are the errors of prediction and the <img alt="thetas" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;\theta&space;_{s}"/>
are the weights.

Combining the two approaches yields an ARMA(p, q) model of the form

<p align="center">
<img alt="ARMA model" src="https://latex.codecogs.com/gif.latex?\fn_jvn&space;Y_{t}&space;=&space;\mu&space;&plus;&space;\beta&space;_{1}Y_{t-1}&space;&plus;&space;\beta&space;_{2}Y_{t-2}&space;&plus;&space;...&space;&plus;&space;\beta&space;_{p}Y_{t-p}&space;-&space;\theta&space;_{1}\epsilon&space;_{t-1}&space;-&space;\theta&space;_{2}\epsilon&space;_{t-2}&space;-&space;...&space;-&space;\theta&space;_{q}\epsilon&space;_{t-q}&space;&plus;&space;\epsilon&space;_{t}">
</p>

that predicts each value of the time series from the past _p_ values and _q_
residuals.

An ARIMA(p, d, q) model is a model in which the time series has been differenced
_d_ times, and the resulting values are predicted from the previous _p_ actual
values and _q_ previous errors. The predictions are "un-differenced" or
_integrated_ to achieve the final prediction. 

Let's apply each step in turn to fit an ARIMA model to the `Nile` time series.

### Ensuring that the time series is stationary

First we plot the time series and assess its stationarity.

<p align="center">
  <img alt="Nile"
  src="{{ site.baseurl }}/images/20170927-nile.png"/>
</p>

The variance appears to be stable across the years observed, so there's no need
for a transformation. There may be a trend, which is supported by the results of
the `ndiffs()` function.

{% highlight r %}
dNile <- diff(Nile)
plot(dNile)
adf.test(dNile)
{% endhighlight %}

The differenced time series is plotted as following and certainly looks more
stationary. Applying the ADF test to the differenced series suggest that it's
now stationary, so we can proceed to the next step.

<p align="center">
  <img alt="diff Nile"
  src="{{ site.baseurl }}/images/20170927-diff-nile.png"/>
</p>

### Identifying one or more reasonable models

Possible models are selected based on the ACF and PACF plots:

<p align="center">
  <img alt="ACF"
  src="{{ site.baseurl }}/images/20170927-acf.png"/>
  <img alt="PACF"
  src="{{ site.baseurl }}/images/20170927-pacf.png"/>
</p>

For the figure above, there appears to be one large autocorrelation at lag 1,
and the partial autocorrelation trail off to zero as the lags get bigger. This
suggests trying an ARIMA(0, 1, 1) model.

### Fitting the model(s)

{% highlight r %}
fit <- arima(Nile, order = c(0, 1, 1))
fit

# Call:
#   arima(x = Nile, order = c(0, 1, 1))
# Coefficients:
#   ma1
# -0.7329
# s.e.   0.1143
# sigma^2 estimated as 20600:  log likelihood = -632.55,  aic = 1269.09

accuracy(fit)
{% endhighlight %}

The coefficient for the moving averages (-0.73) is provided along with the AIC.
If you fit other models, the AIC can help you choose which one is most
reasonable. _Smaller AIC values suggest better models._ The accuracy measures
can help you determine whether the model fits with sufficient accuracy.

### Evaluating model fit

If the model is appropriate, the residuals should be normally distributed with
mean zero, and the autocorrelations should be zero for every possible lag.

{% highlight r %}
qqnorm(fit$residuals)
qqline(fit$residuals)
Box.test(fit$residuals, type = "Ljung-Box")
{% endhighlight %}

<p align="center">
  <img alt="qqplot"
  src="{{ site.baseurl }}/images/20170927-qqplot.png"/>
</p>

_Normally distributed data should fall along the line._ In this case, the
results look good.

The `Box.test()` function provides a test that the autocorrelations are all zero.
The results suggest that the autocorrelations don't differ from zero. This ARIMA
model appears to fit the data well.

### Making forecasts

Once a final model has been chosen, it can be used to make predictions of future
values.

<p align="center">
  <img alt="forecast"
  src="{{ site.baseurl }}/images/20170927-forecast.png"/>
</p>

Point estimates are given by the blue dots, and 80% and 95% confidence bands are
represented by dark and light bands, respectively.

In the last 3 blogs, we've looked at how to create time series in R, assess
trends, and examine seasonal effects. Then we considered two of the most popular
approaches to forecasting: exponential models and ARIMA models. Although these
methodologies can be crucial in understanding and predicting a wide variety of
phenomena, it's important to remember that they each entail extrapolation -
going beyond the data.

## Reference

[1] Robert I. Kabacoff. 2015. "Chapter 15 Time series" _R IN ACTION Data
analysis and graphics with R_ p 359-366
- Pexels, "night stars rotation starry sky", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/night-stars-rotation-starry-sky-1846734/][backgroud-img]

[backgroud-img]: https://pixabay.com/photos/night-stars-rotation-starry-sky-1846734/
