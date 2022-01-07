---
layout:             post
title:              "巴黎二手公寓买哪里最划算？"
lang:               zh
date:               "2022-01-06 22:20:57 +0100"
series:             [real-estate]
tags:               [analysis, real-estate, visualisation, geovisualisation]
comments:           true
excerpt:            >
    巴黎是法国的首都和人口最多的城市。自17世纪以来，巴黎一直是欧洲主要的金融、外交、商业、时尚、科学和艺术中心之一。根据经济学人智库2018年全球生活成本调查，巴黎是全球生活成本第二高的城市，仅次于新加坡，领先于苏黎世、香港、奥斯陆和日内瓦。还将巴黎列为2018年物价最贵的城市，与新加坡和香港相当。所有这些因素都促进了巴黎房地产价格的上涨。
cover:              /images/20220102-district-price.png
img_width:          1280
img_height:         853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    src: /images/20210102-paris.jpg
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
wechat:      true
---

巴黎是法国的首都和人口最多的城市。自17世纪以来，巴黎一直是欧洲主要的金融、外交、商业、时尚、科学和艺术中心之一。根据经济学人智库2018年全球生活成本调查，巴黎是全球生活成本第二高的城市，仅次于新加坡，领先于苏黎世、香港、奥斯陆和日内瓦。还将巴黎列为2018年物价最贵的城市，与新加坡和香港相当。所有这些因素都促进了巴黎房地产价格的上涨。接下来我将就以下几个点分析一下在2014年至2021年6月期间，巴黎二手公寓的交易情况：
- 数据背景
- 买二居室最划算
- 市中心寸土寸金
- 面积与价格？
- 整体而言房价平稳上涨

## 数据背景
首先，我在[政府网站][datasource1]上下载了房地产交易数据。在数据集中，我们有2014年1月到2021年6月的交易信息，如“nature_mutation”指定了销售性质，“nombre_pieces_principales”表示房间数量，“valeur_fonciere”表示售价，“code_commune”、“nom_commune”和“ code_departement”指定城市和省份，“surface_reelle_bati”描述实际居住面积。

<p align="center">
  <img alt="vf.info()"
  src="{{ site.baseurl }}/images/20220102-vf75.png"/>
</p>

## 买二居室最划算

<p align="center">
  <img alt="QP piece number"
  src="{{ site.baseurl }}/images/20220102-quotepart-piece-number.png"/>
</p>

我将二手房按户型分为5组：T1为23平方米左右的一室公寓，T2，即40平方米左右的两居室公寓，T3为约63平方米的三居室公寓，T4是近93平方米的四房公寓，其他为面积更大的公寓，约147平方米。这个环状图描述了交易中不同部分公寓的报价部分。T1和T2占据60%的交易，22%的交易为T3公寓，其他为更大的公寓。至于价格呢？接下来我们一探究竟。

<p align="center">
  <img alt="Unit price for different piece number"
  src="{{ site.baseurl }}/images/20220107-unit-price-piece-number.png"/>
</p>

上图描述了2014年1月至2021年6月期间巴黎不同户型二手公寓的平均价格/平米。通过第二张图我们发现虽然T2和T3远大于T1，但它们的单价却比T1分别低6.7%和6.4%。另外虽然T4的平均面积比T1大三倍，但单价只比T1贵4%。为什么T1公寓每平方米那么贵？可能是因为巴黎有很多学生或年轻的打工人，一居室公寓刚好能满足他们的需求，这也吸引更多的投资者来投资T1公寓，市场上对T1的需求更高，所以价格也因此升高。

## 市中心寸土寸金

<p align="center">
  <img alt="arrondissement price"
  src="{{ site.baseurl }}/images/20220107-district-price.png"/>
</p>

通过这张图，我们观察到4、6、7、8区的二手公寓比其他区贵很多，平均单价至少11800欧元；相反，18区、19区和20区的二手公寓则比其他区便宜很多，平均单价不到8000欧元。这可能是由于地理位置、户型、公寓状态、节能情况、公共安全等原因造成的。 市中心的公共交通比其他地区多，也有很多购物中心或旅游景点，吸引了大量的人，从而使市中心更加有价值。

根据下面的条形图，18区的交易量远高于其他地区，近50%的售出公寓是二居室。圣心大教堂和蒙马特使18区闻名，这是一个波西米亚风格和国际化的艺术区域。这里还有学校、夜总会以及很受大家欢迎的跳蚤市场，这些都吸引着情侣把他们的居住区域定在18区。

此外，16区四居室的交易量比其他区域都要多。16区以住宅区著称，其迷人的建筑带有绿色庭院和阳台就证明了这一点。但从历史和人文角度来看，它也是巴黎的文化热点，拥有许多博物馆和标志性场所。另外，它集中了许多学校和机构来满足学生受教育的需求，也会吸引一些家庭在此居住。这或许就是16区四居室交易量大的原因。

对于1区、2区、3区来说，可能是因为市中心房源不多且单价巨高，所以售出的公寓中超过三分之一是一居室。

<p align="center">
  <img alt="Transaction amount for different arrondissements"
  src="{{ site.baseurl }}/images/20220107-trx-nb-piece-number-district.png"/>
</p>

## 面积与价格？

<p align="center">
  <img alt="Relationship between area and apartment price in different arrondissements"
  src="{{ site.baseurl }}/images/20220107-area-price-district.png"/>
</p>

根据这组散点图，我们可以简单地知道二手公寓的价格与其面积之间的关系。每个点代表一笔交易，红色虚线表示这些交易的每平方米价格为1万欧元。虚线上方的点表示其单价大于1万欧元；否则，每平方米不及1万欧元。

在市中心卖出的二手公寓大多在50平方米以下，但价格相差很大，最贵可达200万欧元；另一方面，8区、16区和17区，许多公寓的价格也达到了200万欧元以上，但它们的面积差异很大，最大有200平方米；此外，也有单价和面积相差不大的区域，比如13区、18区、19区和20区，这些区域的公寓大部分都在100平方米以下，低于100万欧元，所以每平方米不到1万欧元。

## 整体而言房价平稳上涨

<p align="center">
  <img alt="Tx amount & unit price evolution 14-21"
  src="{{ site.baseurl }}/images/20220107-transaction-amount-unit-price-1421.png"/>
</p>

这张图表描述了2014年1月至2021年6月期间巴黎二手公寓的交易量和每平方米均价。橙色线为每平方米月均价，蓝色区域为月交易量。7.5年间，每平方米均价上涨37%（11.5/8.4-1），尤其是2017年以来，每平方米均价上涨近26%（11.5/9.1-1）。而且，可能由于8月的度假高峰期，交易额也在8月达到了年度最低点；相反，7月或9月的交易量高于其他月份，这意味着人们通常在5月或7月签署购买承诺（假设在签署购买承诺和购买协议之间我们有2个月的时间来与银行协商、申请并批准贷款），以便他们可以在假期前或开学前完成过户。此外，由于新冠，交易量在2020年4月下降了50%，但在第一次封城结束后又恢复到之前的水平。2021年依旧受疫情影响，成交量和均价都没有大幅上涨。

<p align="center">
  <img alt="Time series decomposition"
  src="{{ site.baseurl }}/images/20220102-time-series-paris.png"/>
</p>

我使用时间序列`additive`模型将数据分解为趋势分量、季节性分量和残差分量。趋势成分呈现价格随时间的变化而变化，季节性成分呈现一年中的周期性影响，残差成分呈现趋势和季节性影响未描述到的影响。通过这个模型，我们发现除了7月份之外，1月份还有另一个交易高峰，这是我们上面没有发现的。3月和6月，交易量达到低点，这可能是因为在2个月的过渡期内，购买或出售公寓的需求并不那么高。

<p align="center">
  <img alt="Unit price prediction"
  src="{{ site.baseurl }}/images/20220107-price-prediction-paris.png"/>
</p>

此外，我还借助了`fbprophet`来预测每平方米的价格。黑点表示实际值，蓝线表示预测值，浅蓝色阴影区域表示不确定性。由于初始不确定性，预测的不确定性区域会增加，并且会随着时间的推移而增长。这可能会受到政策、社会因素或其他一些因素的影响。

## 结论

通过以上的分析，我们发现在巴黎的所有二手公寓交易中，一居室和两居室占了60%的交易。4、6、7、8区的二手房比其他区贵很多，平均单价至少11800欧元；相反，18区、19区和20区的二手公寓比其他区便宜很多，平均单价不到8000欧元。

## Reference
- Ministère de l'économie, des finances et de la relance, "Demandes de valeurs foncières", _data.gouv.fr_. [Online]. Available: [https://www.data.gouv.fr/fr/datasets/5c4ae55a634f4117716d5656/][datasource1]
- Grégoire David, "Departments polygon", _github.com_. [Online]. Available: [https://github.com/gregoiredavid/france-geojson/blob/master/departements.geojson][datasource2]
- APUR, "APUR : Communes - Ile de France", _data.gouv.fr_. [Online]. Available: [https://www.data.gouv.fr/fr/datasets/apur-communes-ile-de-france/][datasource3]
- "Paris", _en.wikipedia.org_. [Online]. Available: [https://en.wikipedia.org/wiki/Paris][wiki-paris]
- Ehi Aigiomawu, "Analyzing time series data in Pandas", _towardsdatascience.com_. [Online]. Available: [https://towardsdatascience.com/analyzing-time-series-data-in-pandas-be3887fdd621][ts1]
- Will Koehrsen, "Time Series Analysis in Python: An Introduction", _towardsdatascience.com_. [Online]. Available: [https://towardsdatascience.com/time-series-analysis-in-python-an-introduction-70d5a5b1d52a][ts2]
- "Rent apartment Paris 18", _parisattitude.com_. [Online]. Available: [https://www.parisattitude.com/rent-apartment-paris-18.aspx][r1]
- "Guide immobilier Paris 16ème arrondissement", _engelvoelkers.com_. [Online]. Available: [https://www.engelvoelkers.com/fr-fr/paris/guide-immobilier-16eme-arrondissement/][r2]
- Walkerssk, "Paris France Eiffel tower night", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/paris-france-eiffel-tower-night-1836415/][backgroud-img]

[datasource1]: https://www.data.gouv.fr/fr/datasets/5c4ae55a634f4117716d5656/
[datasource2]: https://github.com/gregoiredavid/france-geojson/blob/master/departements.geojson
[datasource3]: https://www.data.gouv.fr/fr/datasets/apur-communes-ile-de-france/
[wiki-paris]: https://en.wikipedia.org/wiki/Paris
[ts1]: https://towardsdatascience.com/analyzing-time-series-data-in-pandas-be3887fdd621
[ts2]: https://towardsdatascience.com/time-series-analysis-in-python-an-introduction-70d5a5b1d52a
[r1]: https://www.parisattitude.com/rent-apartment-paris-18.aspx
[r2]: https://www.engelvoelkers.com/fr-fr/paris/guide-immobilier-16eme-arrondissement/
[backgroud-img]: https://pixabay.com/photos/paris-france-eiffel-tower-night-1836415/
