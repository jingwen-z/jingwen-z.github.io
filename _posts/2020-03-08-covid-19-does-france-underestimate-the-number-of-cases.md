---
layout:             post
title:              "COVID-19: Does France underestimate the number of cases?"
date:               "2020-03-08 14:29:48 +0100"
last_modified_at:   2020-03-09 22:04:55 +0100
tags:               [analysis, COVID-19, visualisation]
comments:           true
excerpt:            >
    This blog talks about the actual COVID-19 situation of France, the
    definition of confirmed cases in France and some predictions of confirmed
    cases in France.
cover:              /images/20200308-france-prediction.png
img_width:          1280
img_height:         853
---

<p align="center">
  <img alt="Prediction with France history"
  src="{{ site.baseurl }}/images/20200308-france-prediction.png"/>
</p>

Today I read an article on [franceinfo][franceinfo-vrai-ou-fake] that discusses
if France underestimate the number of cases, and expressed that the difference
between the number of tests carried out in different countries is explained by
different approaches to the health crisis; in France, a "preselection" of
patients is carried out upstream: tests are therefore less frequent, but they
better target people potentially carrying the virus. I also searched some
information on the website of French government, and will talk about this
subject with the following points:
- Actual COVID-19 situation in France
- Definition of confirmed cases
- Prediction of confirmed cases in France

## Actual COVID-19 situation in France
Yesterday, the COVID-19 confirmed cases of France passed 1000 cases. As of
2020-03-07, there are 1009 confirmed cases, 12 cured and 11 death cases in
France.

<p align="center">
  <img alt="Figaro"
  src="{{ site.baseurl }}/images/20200308-figoro.png"/>
</p>

The plot below describes the new confirmed cases per daily, published
by [Sante Publique France][r2].

<p align="center">
  <img alt="France daily new cases"
  src="{{ site.baseurl }}/images/20200308-fr-daily-new.png"/>
</p>

## Definition of confirmed cases
According to the publication on [Sante Publique France][def-case], we know that
- The definition of close contact now includes all contact from 24 hours before
the onset of symptoms in a confirmed case of COVID-19.

- Possible case

a) Anyone with clinical signs of acute respiratory infection with fever or
feeling feverish, AND
Having traveled or stayed in a risk exposure zone within 14 days before the
date of onset of clinical signs:<br>
    - On a case-by-case basis and after consulting Public Health France, a
    confirmed or potential exposure to a cluster-type event, documented outside
    these risk exposure zones, may also be considered.

b) Anyone with clinical signs of acute respiratory infection within 14 days of
any of the following:<br>
    - Close contact of a confirmed case of COVID-19;<br>
    - Co-exposed person, defined as having been subjected to the same exposure
    risks (that is to say a trip or stay in a risk exposure area) as a confirmed
    case.

c) Any person, even without the notion of travel / stay in a risk exposure zone
or close contact with a confirmed case of COVID-19, presenting:<br>
    - Pneumonia for which another etiology has been excluded beforehand on the
    basis of clinical, radiological and / or virological criteria and whose
    clinical state requires hospitalization, OR<br>
    - Signs of acute respiratory distress up to ARDS (Acute Respiratory Distress
    Syndrome) in a context possibly viral and without any other etiology obvious
    from the start.

- Confirmed case

Anyone, whether symptomatic or not, with a sample confirming infection with
SARS-CoV-2.

- The list of risk exposure zones

| Continent | Country |
|:---------:|:-------:|
|    Asia   | China   |
|    Asia   | Singapore |
|    Asia   | South Korea|
|    Asia   | Iran    |
|   Europe  | Italy: Regions of Lombardy, Veneto, Emilia-Romagna and Piedmont |

## Prediction of confirmed cases in France

### Method 1: predicting with France's actual daily evolution
For the first approach, we can calculate the mean evolution value of daily
confirmed counts. Considering that there are continuously new cases since 24
Feb. 2020, we calculated the mean evolution between 2020-02-24 and yesterday
(2020-03-07), got 43.3%, then predict the confirmed cases with this value for
the following week.

<p align="center">
  <img alt="Prediction with France history"
  src="{{ site.baseurl }}/images/20200308-france-prediction.png"/>
</p>

### Method 2: simulating with Italy's different segment evolution
You may ask why we simulate Italy's evolution for France ? Since actually France
tests only the people who have been to the risk zone or who have the symptom of
COVID-19, which risks missing some cases. However, Italy tests all people from
the epidemic area of northern Italy or who have close contact with the diagnosed
person, with or without symptoms.

This method calculates firstly Italy's mean evolution for the segments greater
than and less than France's cumulative confirmed cases, then calculate the ratio
and apply on data of France. In my case, there are 1009 confirmed count in
France; in Italy, the mean value of daily evolution for the period less than 1009
cases is around 32%, the mean value for the period greater than 1009 cases is
around 26%, so the ratio between 32% and 26% is 1.23. Now we calculate the mean
value of daily evolution of France, get 17.8%, then we use 0.178/1.23, get 14.5%,
which is our predictive daily evolution. The result is shown as below:

<p align="center">
  <img alt="France simulates with Italy avg daily evolution"
  src="{{ site.baseurl }}/images/20200308-simul2.png"/>
</p>

## Easter egg

I just saw a comparison between COVID-19 and flu, which is pretty detailed and
worth sharing with you:

<p align="center">
  <img alt="COVID-19 vs. flu"
  src="{{ site.baseurl }}/images/20200308-covid19-vs-flu.png"/>
</p>

## Reference
- Aude Bariéty, Julien Boudisseau and Caroline Piquet, "EN DIRECT - Coronavirus : 11 morts en France, un nouveau cas à l'Assemblée nationale", _www.lefigaro.fr_. [Online]. Available: [https://www.lefigaro.fr/sciences/2020/03/07/01008-20200307LIVWWW00001-en-direct-coronavirus-100000-personnes-ont-ete-contaminees-dans-le-monde.php][r1]
- "Point épidémiologique du 07/03/2020, 15h", _www.santepubliquefrance.fr_. [Online]. Available: [https://www.santepubliquefrance.fr/maladies-et-traumatismes/maladies-et-infections-respiratoires/infection-a-coronavirus/articles/infection-au-nouveau-coronavirus-sars-cov-2-covid-19-france-et-monde][r2]
- "Zaia, da test Vo' studio epidemiologico", _www.ansa.it_. [Online]. Available: [http://www.ansa.it/sito/notizie/cronaca/2020/02/28/zaia-da-test-vo-studio-epidemiologico_2c3d88f3-6a4a-4e00-b255-9e1e2feb2768.html][r3]
- "COVID-19 is not like the flu", _rentry.co_. [Online]. Available: [https://rentry.co/covid-19-is-not-like-the-flu][r4]

[franceinfo-vrai-ou-fake]: https://www.francetvinfo.fr/sante/maladie/coronavirus/coronavirus-la-france-sous-estime-t-elle-le-nombre-de-cas_3853661.html
[def-case]: https://www.santepubliquefrance.fr/media/files/01-maladies-et-traumatismes/maladies-et-infections-respiratoires/infection-a-coronavirus/definition-de-cas-03-03-20
[r1]: https://www.lefigaro.fr/sciences/2020/03/07/01008-20200307LIVWWW00001-en-direct-coronavirus-100000-personnes-ont-ete-contaminees-dans-le-monde.php
[r2]: https://www.santepubliquefrance.fr/maladies-et-traumatismes/maladies-et-infections-respiratoires/infection-a-coronavirus/articles/infection-au-nouveau-coronavirus-sars-cov-2-covid-19-france-et-monde
[r3]: http://www.ansa.it/sito/notizie/cronaca/2020/02/28/zaia-da-test-vo-studio-epidemiologico_2c3d88f3-6a4a-4e00-b255-9e1e2feb2768.html
[r4]: https://rentry.co/covid-19-is-not-like-the-flu
