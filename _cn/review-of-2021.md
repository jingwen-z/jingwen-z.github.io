---
layout:      post
title:       "回顾2021"
lang:        zh
date:        "2021-12-31 10:41:41 +0200"
tags:        [review]
comments:    true
excerpt:     >
    回顾2021。
cover:       /images/20211230-2021.jpg
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
wechat:      true
---
## 前言
2021年仍然是与COVID-19作斗争的一年。由于接种了疫苗，我们的生活逐渐恢复正常，我们开始更频繁地回到办公室，有机会像以前一样旅行。今年我继续深入研究如何将数据科学应用于零售领域，并使用开源数据进行一些数据分析。在这篇博客中，我将通过以下几点来回顾我的2021年：
- 在零售业工作（In The Memory）
- COVID-19疫苗分析
- 博客

## 将数据科学应用于零售领域（In The Memory）
[In The Memory][Memory]是一家零售科技公司，帮助零售业者充分利用内部和外部数据源来应对其战略和运营业务的挑战。我们的产品能够让经销商和品牌商加快决策速度，从而吸引更多的客户，并在其实体和在线销售渠道中作出最佳的分类、销售、定价和促销的选择。我们提供量身定制的增强智能解决方案，与客户共同定义恰当的KPI来应对客户的挑战，并根据客户的需求、限制和流程调整我们的解决方案，从而满足客户的优先目标并为他们的战略服务。此外，今年我们赢得了由LSA Live参与者投票选出的“Pépite du Retail 2020”奖杯，还在“法国行动创业奖”类别中被选为Microsoft 2021最佳合作伙伴; 我们现在有近50名同事，而2020年只有25名。

<p align="center">
  <img alt="20211230-awards"
  src="{{ site.baseurl }}/images/20211230-awards.png"/>
</p>

### 我在工作期间做了什么？
今年我完成了大约20个CRM（客户关系管理）项目，有些是给经销商的，有些是给品牌商的。通过我们的分析，我们帮助他们将每位消费者的消费额提高10%。我还为一个模块开发了新功能，该模块可以为不同级别的商品提取大约1年期限内的50个KPI，例如每个产品/商店、每个产品类别/商店组或时间维度x产品/商店，例如月x产品或天x商店等。这个模块的SLA（Service-Level Agreement）大约是2-5分钟，在发布后的2周内，该模块已经被使用了大约1500次。此外，我们还和同事一起创建了一个模型，用于估算产品的营业额，并为不同的促销活动推荐产品，这些模型将应用到一个新模块中。不过目前还是保密阶段，所以在此先不细说。

此外，随着公司的扩张，我们更新了[Welcome to the Jungle][wttj]的信息。我参与了一个视频拍摄，展示了数据团队在日常工作中的工作，以及我们如何与其他团队（如咨询团队和开发团队）合作。

### 我在工作中学到了什么？
在不同的零售项目中，我对[不同的][part1][指标][part2]有了更多的了解。通过CRM项目，我明白了根据客户的需求我们应该关注什么以及如何将消费者与他们的消费行为进行分组。 在日常工作中，我学会了如何切割一个项目并与同事一起完成项目的不同部分。不过最大的收获还是在做促销项目的时候，丰富了自己的促销知识，明白了不同的促销操作不同的手法和力度；定义每一次促销的产品，我们需要达到各种目标，比如营业额目标，产品数量，品牌类型分布，促销力度分布等。通过这个项目，我与业务人员（产品经理、购买、促销等）有更密切的交流，让我更好地了解他们的需求/痛点，以便我们开发出合适的产品来满足需求或解决痛点。

## COVID-19 疫苗分析
2020年伊始，来自世界各地的人们都在与COVID-19病毒作斗争，科学家们也在积极寻找解决方案。要实现群体免疫，目前最有效的方法可以说是接种疫苗。关于疫苗的各种声音也一直处于社会舆论的风口浪尖，对它的褒奖或争议从未停止。而一个疫苗从理论设计到临床试验，需要科学家太多的智慧和努力。

多亏有开源数据集和文献，我分析了辉瑞疫苗、科兴疫苗、阿斯利康疫苗和莫德纳疫苗的不良反应：
- [你知道辉瑞疫苗的反应吗？][b1]
- [你知道科兴疫苗的反应吗？][b2]
- [你知道牛津/阿斯利康疫苗的反应吗？][b3]
- [你知道莫德纳疫苗的反应吗？][b4]
- [你知道哪种COVID-19疫苗带来的反应最明显吗？][b5]

<p align="center">
  <img alt="20211010-global-comparaison"
  src="{{ site.baseurl }}/images/20211010-global-comparaison.png"/>
</p>

不论是局部反应还是全身反应，都是在注射莫德纳后的反应最明显，86%的人出现了局部反应，如注射部位疼痛、肿胀、发红，近67%的人出现了全身反应，如疲劳、发冷、关节痛、肌肉痛等。 其次是科兴疫苗，注射后62%的人出现局部反应，58%的人出现全身反应。4个疫苗中引起不良反应最少的是辉瑞-生物科技疫苗，接种后出现局部反应和全身反应的概率分别为29.5%和22.4%。

## 博客
今年围绕着不同的主题写了22篇博客（包括这篇）：零售、COVID-19、人口和就业。此外，相比于2020年，2021年博客的流量增长了21.4%。如果我的博客可以帮助到你并为你解决问题，我很高兴。

<p align="center">
  <img alt="Blog traffic 1"
  src="{{ site.baseurl }}/images/20211230-blog1.png"/>
</p>

<p align="center">
  <img alt="Blog traffic 2"
  src="{{ site.baseurl }}/images/20211230-blog2.png"/>
</p>

另外，今年4月我开通了一个微信公众号。在这个平台上，我把我的一些英文博客翻译成中文，分享给我在国内朋友。从开通至今，我已经写了11篇博客，阅读量8500次，并且有61位关注者。

感谢大家的支持！我们2022年见！

## 参考文献
- Tumisu, "New year 2021 moon New year's eve", _pixabay.com_. [Online]. Available:
[https://pixabay.com/photos/new-year-2021-moon-new-year-s-eve-5678207/][image]

[Memory]: https://www.inthememory.com/?lang=en
[wttj]: https://www.welcometothejungle.com/fr/companies/memory
[blog-crm]: https://jingwen-z.github.io/crm-in-retailing/
[part1]: https://jingwen-z.github.io/multiple-kpis-in-retailing-1/
[part2]: https://jingwen-z.github.io/multiple-kpis-in-retailing-2/
[b1]: https://jingwen-z.github.io/cn/pfizer-biontech-covid-19-vaccine-reactions/
[b2]: https://jingwen-z.github.io/cn/coronavac-covid-19-vaccine-reactions/
[b3]: https://jingwen-z.github.io/cn/astrazeneca-oxford-covid-19-vaccine-reactions/
[b4]: https://jingwen-z.github.io/cn/moderna-covid-19-vaccine-reactions/
[b5]: https://jingwen-z.github.io/cn/four-covid-19-vaccines-reactions/
[image]: https://pixabay.com/photos/new-year-2021-moon-new-year-s-eve-5678207/
