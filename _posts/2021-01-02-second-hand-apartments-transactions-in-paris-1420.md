---
layout:      post
title:       "Second-hand apartments transactions in Paris (01/2014 - 06/2020)"
date:        "2021-01-02 22:20:57 +0100"
tags:        [analysis, real-estate, visualisation, geovisualisation]
comments:    true
excerpt:     >
    Paris is the capital and most populous city of France. Since the 17th
    century, Paris has been one of Europe's major centres of finance, diplomacy,
    commerce, fashion, science, and the arts. All these elements help to bring
    the increasing price of real estate in Paris. In this blog, I'll talk about
    the second-hand apartments purchases in Paris between January 2014 and June
    2020.
img_url:     /images/20210102-dvf-paris-quartier.png
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="dvf Paris per area"
  src="{{ site.baseurl }}/images/20210102-dvf-paris-quartier.png"/>
</p>

Paris is the capital and most populous city of France. Since the 17th century,
Paris has been one of Europe's major centres of finance, diplomacy, commerce,
fashion, science, and the arts. According to the Economist Intelligence Unit
Worldwide Cost of Living Survey in 2018, Paris was the second most expensive
city in the world, after Singapore, and ahead of Zürich, Hong Kong, Oslo and
Geneva. Another source ranked Paris as most expensive, on a par with Singapore
and Hong Kong, in 2018. All these elements help to bring the increasing price
of real estate in Paris. In this blog, I'll talk about the second-hand
apartments purchases in Paris between January 2014 and June 2020, with the
following points:
- Data description
- How large are the apartments?
- Which is the most expensive district?
- Relationship between area & apartment price?
- Price evolution in terms of timing?

## Data description
First of all, I downloaded real estate transactions' data on the [site of
government][datasource1]. In the dataset, we have transaction's information
from January 2014 to June 2020, like "id_mutation" to identify the transaction,
"nature_mutation" specifies the sale's nature, "nombre_pieces_principales"
indicates the number of rooms, "valeur_fonciere" presents the sold price,
"code_commune", "nom_commune" and "code_departement" specify the communities and
departments, "surface_reelle_bati" describes the real surface area, longitude
and latitude can help us to determine the location.

<p align="center">
  <img alt="vf.info()"
  src="{{ site.baseurl }}/images/20210102-vf75.png"/>
</p>

For this analysis, I only took account of second-hand apartments' transactions
with positive area in Paris.

## How large are the apartments?

<p align="center">
  <img alt="QP piece number"
  src="{{ site.baseurl }}/images/20210102-quotepart-piece-number.png"/>
</p>

I classed older apartments into 5 groups in terms of piece's number: T1, which
means one-room apartment with around 23 m2; T2, which means two-room apartment
with around 40 m2; T3 presents three-room apartment around 63 m2; T4 are
four-room apartments nearly 93 m2; T5 are five-room apartments with larger area
about 147 m2. This donut chart describes the quote-part of different pieces'
apartment among the transactions. T1 and T2 hold 60% transactions, 22%
transactions sold T3 apartments, other purchases are for larger apartments.
Let's go further on the details.

<p align="center">
  <img alt="Unit price for different piece number"
  src="{{ site.baseurl }}/images/20210102-unit-price-piece-number.png"/>
</p>

This graph describes the average price m2 for different nomber of piece
second-hand apartments in Paris, between January 2014 and June 2020. According
to the second graph, we find that although T2 and T3 are much larger than T1,
their unit prices are 5.3% and 4.7% lower than the unit price of T1. Moreover,
average area of T4 is three times larger than T1, its unit price is only 4% more
expensive than T1; similar for other piece-nomber apartments. Why are T1
apartments that expensive per m2? That might be because there are many students
or young workers in Paris, they need to rent a big enough apartment, which makes
investors to invest T1 apartments, it also leads to higher demands on T1.

## Which is the most expensive district?

<p align="center">
  <img alt="District price"
  src="{{ site.baseurl }}/images/20210102-district-price.png"/>
</p>

According to this map, we observe that the second-hand apartments in districts
1, 4, 6, 7 are much more expensive that other districts, their average unit
price is at least 12000 euros; on the contrary, the second-hand apartments in
districts 13, 19 and 20 are much cheaper than others, their average unit price
is less than 8500 euros. This might be caused by geographical positions, number
of piece, apartment's state, performance of energy, public security, etc. The
public transport in the city center is more than other areas, there are also
lots of shopping centers or tourist spots, which attracts a great deal of
people, so that make the city center to be more valuable.

Furthermore, according to the stacked bar plot below, it’s obvious that there
are much more transactions in the 16th district than other areas, nearly 50%
sold apartment are 2-room or 3-room apartments, and the transaction amount of
T4 is pretty larger than all other districts. Paris 16 is eminently residential,
as evidenced by its charming buildings with green courtyards and balconies. But
it is also a Parisian cultural hotspot with many museums and emblematic places
from both a historical and intellectual point of view. Moreover, it concentrates
many schools and establishments of choice for the education of children and
students. All these might be the reason why the transactions in Paris 16 are
much more than other distincts. For the districts as 1st, 2nd or 3rd district,
more than one third of sold apartments are T1 apartments, that might because
there is not that many apartments at the center of Paris, and its unit price is
high.

<p align="center">
  <img alt="Unit price per piece nb in different districts"
  src="{{ site.baseurl }}/images/20210102-unit-price-piece-number-district.png"/>
</p>

## Relationship between area & apartment price?

<p align="center">
  <img alt="Relationship between area and apartment price in different districts"
  src="{{ site.baseurl }}/images/20210102-area-price-district.png"/>
</p>

According to this group of scatter plots, we can simply get the relationship
between second-hand apartments’ price and their area. Each point stands for one
transaction, the plots on the red dash line mean that the price per m2 of these
transactions is 10k euros. The points above the dash line indicate their unit
price are greater than 10k euros; otherwise, it’s less than 10k euros per m2.

For the transactions of downtown area, most of them are smaller than 50 m2, but
their price varies widely to nearly 2 million euros; on the other hand, for the
8th, 16th and 17th district, almost sold apartments’ price also arrive more than
2 million euros, but their area varies widely to 200 m2; moreover, there are
also apartments whose unit price and area don’t vary that widely, as in 13th,
18th, 19th and 20th district, most of the apartments here are smaller than 100
m2 and cheaper than 1 million euros, so than less than 10k euros per m2.

## Price evolution in terms of timing?

<p align="center">
  <img alt="Tx amount & unit price evolution 14-20"
  src="{{ site.baseurl }}/images/20210102-transaction-amount-unit-price-1420.png"/>
</p>

This graph describes second-hand apartments’ transaction amount and average
price per m2 of Paris, between January 2014 and June 2020. The orange line shows
the monthly average price per m2, the blue area displays the monthly transaction
amount. During 6.5 years, the average price per m2 increases 28%(11.1/8.7 - 1),
especially from the year 2017, the average price per m2 increases nearly 31%
(11.1/8.5 - 1). Moreover, the transaction amount arrives the yearly lowest point
in August, which might because people go on holiday at that time; on the
contrary, the transactions in July or September are higher than other months,
which means that people usually sign the purchase promise in May or July
(supposed that we have 2 months for negotiating the credit between the purchase
promise and purchase agreement), so that they can sign the agreement before
their holiday or before the school opening.

<p align="center">
  <img alt="Time series decomposition"
  src="{{ site.baseurl }}/images/20210102-time-series-paris.png"/>
</p>

Then I used Time Series `additive` model to decompose data into a trend
component, a seasonal component and a residual component. The trend component
captures changes over time, the seasonal component captures cyclical effects
due to the time of year, the residual component captures the influences not
described by the trend and seasonal effects. Thanks to this model, we find that
except for July, there are another transaction peak in January, which we didn’t
find above. In March and November, the transactions arrive at their low points,
that might be because during the transition period between 2 years, the desire
for purchasing or selling apartments is not that high.

<p align="center">
  <img alt="Unit price prediction"
  src="{{ site.baseurl }}/images/20210102-price-prediction-paris.png"/>
</p>

Moreover, I used `fbprophet` module to predict the price per m2. The black
points present actual values, the blue line indicates the forecasted values,
and the light blue shaded region is the uncertainty. The uncertainty’s region
increases for the prediction because of the initial uncertainty and it grows
over time. This can be impacted by policy, social elements, or some others.

## Conclusion
According to this analysis, we find that among all transactions of second-hand
apartments in Paris, T1 and T2 hold 60% transactions. The second-hand apartments
in districts 1, 4, 6 and 7 are much more expensive than other districts, their
average unit price is at least 12000 euros; on the contrary, the second-hand
apartments in districts 13, 19 and 20 are much cheaper than others, their
average unit price is less than 8500 euros.

You can find all codes in [this notebook][notebook].

## Reference
- DGFiP, "Demandes de valeurs foncières géolocalisées", _data.gouv.fr_. [Online]. Available: [https://www.data.gouv.fr/fr/datasets/demandes-de-valeurs-foncieres-geolocalisees/][datasource1]
- Grégoire David, "Departments polygon", _github.com_. [Online]. Available: [https://github.com/gregoiredavid/france-geojson/blob/master/departements.geojson][datasource2]
- APUR, "APUR : Communes - Ile de France", _data.gouv.fr_. [Online]. Available: [https://www.data.gouv.fr/fr/datasets/apur-communes-ile-de-france/][datasource3]
- "Paris", _en.wikipedia.org_. [Online]. Available: [https://en.wikipedia.org/wiki/Paris][wiki-paris]
- Ehi Aigiomawu, "Analyzing time series data in Pandas", _towardsdatascience.com_. [Online]. Available: [https://towardsdatascience.com/analyzing-time-series-data-in-pandas-be3887fdd621][ts1]
- Will Koehrsen, "Time Series Analysis in Python: An Introduction", _towardsdatascience.com_. [Online]. Available: [https://towardsdatascience.com/time-series-analysis-in-python-an-introduction-70d5a5b1d52a][ts2]

[datasource1]: https://www.data.gouv.fr/fr/datasets/demandes-de-valeurs-foncieres-geolocalisees/
[datasource2]: https://github.com/gregoiredavid/france-geojson/blob/master/departements.geojson
[datasource3]: https://www.data.gouv.fr/fr/datasets/apur-communes-ile-de-france/
[wiki-paris]: https://en.wikipedia.org/wiki/Paris
[ts1]: https://towardsdatascience.com/analyzing-time-series-data-in-pandas-be3887fdd621
[ts2]: https://towardsdatascience.com/time-series-analysis-in-python-an-introduction-70d5a5b1d52a
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/analysis/dvf/dvf_Paris_analysis.ipynb
