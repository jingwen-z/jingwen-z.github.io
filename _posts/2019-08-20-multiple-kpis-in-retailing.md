---
layout:             post
title:              "Multiple KPIs in retailing"
date:               "2019-08-20 21:07:54 +0200"
last_modified_at:   2019-10-11 22:15:01 +0200
comments:           true
excerpt:            >
    As a Data Scientist in retailing, I have a deeper understanding on
    operating of retailing and support business teams with multiple KPIs. In
    this blog, I will talk about KPIs in retailing with the following points of
    view...
img_url:            /images/20190820-supermarket.jpg
img_width:          1280
img_height:         853
---

<p align="center">
  <img alt="Supermarket"
  src="{{ site.baseurl }}/images/20190820-supermarket.jpg"/>
</p>

As a Data Scientist in retailing, I have a deeper understanding on operating of
retailing and support business teams with multiple KPIs. In this blog, I will
talk about KPIs in retailing with the following points of view:
- Performance of stores
- Performance of products
- Profile of clients
- Case studies

## Performance of stores
Some of the following are pretty easy to understand, I'll still list all KPIs,
in order to have a whole view.

- Sold volume
- Turnover
- Margin: there are 2 kinds of products: products stoken in warehouse and
products bought directly from supplier. For the products stoken in warehouse,
the warehouse's margin is the difference between warehouse's selling price and
warehouse's purchase price, the store's margin is the difference between
store's turnover excluding tax and store's purchase price. For the products
bought directly from supplier, the margin is only the difference between
store's turnover excluding tax and store's purchase price.
- Margin rate: For the products stoken in warehouse, the warehouse's margin
rate is the ratio of warehouse's margin value and warehouse's selling price,
the store's margin rate is the ratio of store's margin value and store's
turnover excluding tax.
- Transaction amount
- Quote-part in terms of volume / turnover / transaction amount
- Evolution of volume / turnover / margin / margin rate / transaction amount

## Performance of products
For the performance of products, some points are the same as stores' KPIs.

- Sold volume
- Turnover
- Margin
- Margin rate
- Transaction amount
- Quote-part in terms of volume / turnover / transaction amount
- Evolution of volume / turnover / margin / margin rate / transaction amount
- Weekly sales: for discovering the day when the products are more sold than
other days, during the weekday or weekend ?
- Hourly sales: for discovering the hour when the products are more sold than
other hours, during the breakfast, lunch or dinner ?
- Sales of nomenclature in terms of universe, group, sub-group, etc.
- Baskets' average in terms of volume / turnover / transaction number
- Association analysis: for analysing which products are always sold together
- Product amount that ordered from warehouse: this KPI allows us to compare
it to sold volume, to judge if the ordered amount is reasonable.
- Analysis with weather

## Profile of loyal clients
- Sold volume
- Turnover
- Transaction amount
- Quote-part in terms of volume / turnover / transaction amount
- Evolution of volume / turnover / margin / margin rate / transaction amount
- Activated loyal clients amount
- Purchase frequency
- Weekly / Monthly new loyal clients' amount

## Potential issues
### Cannot find warehouse's purchase price for fresh orange juice squeezed
We have a juicer in our stores, the employees put fresh orange in the machine,
and clients can use the bottle which is just next to the machine to contain the
juice. To calculate its margin, we need to extract its selling price excluding
tax, warehouse's selling price and warehouse's purchase price. Unfortunately,
we cannot find the warehouse's purchase price for the product. What should we
do ? Since the fresh orange juice squeezed is consisted of kilograms of orange
and one bottle, we need to use warehouse's purchase price of 1 kilogram's
orange multiply by kilograms amount, plus one bottle's warehouse's purchase
price. For example, if a 33-cl bottle of fresh orange juice squeezed need 2 kg
of orange, the warehouse's purchase price of orange is 1 euro per kg, the
warehouse's purchase price of a 33-cl bottle is 0.5 euro, so the warehouse's
purchase price of one 33-cl bottle of fresh orange juice squeezed is equal to
1 euro * 2 kg + 0.5 euro = 2.5 euros.

## Case studies
(_All sensitive data in this part is either simulated or hidden by mosaic._)

### Reporting merchandise

<p align="center">
  <img alt="Reporting merchandise"
  src="{{ site.baseurl }}/images/20181225-bench.jpg"/>
</p>

To follow the evolution of turnover, volume and price for each universe and
sub-group of product in each store, with respect to the same period of last
year.


### Reporting restauration

<p align="center">
  <img alt="Reporting restauration"
  src="{{ site.baseurl }}/images/20181225-restauration.png"/>
</p>

It's a report for supply of restaurant business with two dimensions:
- Global dimension for company/store communication: measure share of turnover.

- Operational dimension for measuring performance of different categories and
their application.

### Analysis for a new service
Most requirements of analysis in retailing is analysing performance of stores
and products, and analysing clients' preferences. Imagine that we released a
new service: [transfering money with Western Union][WU]

<p align="center">
  <img alt="Volume and turnover for hourly sales"
  src="{{ site.baseurl }}/images/20181225-hourly-sales.jpg"/>
</p>

This graph presents service's volume and turnover of hourly sales. Obviously,
majority of clients purchase service-product before working, after working or
after school, so store manager should ensure the stock and well prepare products
on the shelf at these moments.

### Analysis with current events
Sometimes, the analysing motivation is not only since we released a new service
or a new product, but also because of the current events. For example, world
cup or heatwave. The heatwave (> 30 degrees) usually continues 2 weeks in
Paris, we need to learn the sales that different than normal days. Should we
prepare more stock for some products? What kind of products should we ensure
the stock?

<p align="center">
  <img alt="Top 4 shelves during heatwave"
  src="{{ site.baseurl }}/images/20181225-heatwave-top4-shelves.jpg"/>
</p>

The first graph shows the daily maximum temperature for 2018-07-23 to 2018-08-09,
the second graph shows the daily sales of top 4 shelves during the same period.
All these 4 shelves are anti-heatstroke products, which is logical. Thanks to
the analysis, we can prepare their stock before the next heatwave.

### Analysis products' sales with weather

<p align="center">
  <img alt="precipitation umbrella"
  src="{{ site.baseurl }}/images/20171222-umbrella.jpg"/>
</p>

To find the impact of weather on sales, I created a linear regression, which
can specify the impact of weather on each subfamily. We found various effects
of weather, for instance, in this graph, the blue line means the tendency of
daily average precipitation, the orange one presents daily volume of women's
umbrella, the purple one shows daily volume of men's umbrella. We can easily
find that the effect of precipitation on women's umbrella is more than the
effect on men's umbrella. Now, let's see the details. When precipitation
increases 1 mm, 6 more women's umbrellas will be sold; if it rains, 11 more
women's umbrellas will be sold. However, nearly 3 more men's umbrella can be
sold once precipitation increases 1 mm; only 3 more men's umbrella can be sold
if it rains.

### Association analysis

<iframe
  src="{{ site.baseurl }}/images/20171222-top3-association.html"
  style="display: block; width:100%; height: 650px">
  <p>top3 association</p>
</iframe>

In order to help merchandise team to organise the shelves, I used apriori
algorithm analysed consumers' preference, determined the shelves that often
sold together, and found an association between each two shelves. This graph
shows some attractive results, like sweet biscuits are associated with cereals
and bars, chocolate confectionery, rusks and chocolates in tablets;
non-alcoholic drinks can bring together with spirits, chips, dry sausages and
salty aperitif; and meats are related with dry sausages and sea caterers.

## Reference
- Alexas_Fotos, "Minion banana fruit healthy", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/minion-banana-fruit-healthy-1168873/][image]

[WU]: https://www.franprix.fr/article/quand-franprix-rencontre-western-union_a13551/1
[image]: https://pixabay.com/photos/minion-banana-fruit-healthy-1168873/
