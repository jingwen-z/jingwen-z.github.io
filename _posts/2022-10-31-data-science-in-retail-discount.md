---
layout:      post
title:       "Data Science in Retail Discount"
lang:        en
date:        "2022-10-31 15:26:34 +0100"
tags:        [retail]
comments:    true
excerpt:     >
    We talk about how recommendation engines contribute to retail promotion and
    how could we follow the performance of a promotion.
cover:       /images/20221101-discount.jpg
img_width:   1280
img_height:  853
article_header:
  type: overlay
  theme: dark
  background_color: "#203028"
  background_image:
    gradient: "linear-gradient(135deg, rgba(0, 0, 0, .6), rgba(0, 0, 0, .4))"
---
## Introduction
Retail discount plays an important role in increasing turnover, increasing
customer loyalty and attracting customers. To have a good strategy of discount,
data mining can help retailers to build a recommendation engine that recommends
products for customers and retailers. In this blog, I'll share my experience on
how to apply data mining on retail discounts with the following points:
- What is a retail discount strategy?
- What is a recommendation engine?
- Use cases of recommendation engine
- Promotion Analysis

## What is a retail discount strategy?
Retail discounting is used to decrease the price of specific products for a set
amount of time. In some cases, retailers offer a store-wide discount to move
excess inventory and create space for new collections. Retailers usually run
discounts to attract new customers, increase sales, and clear out old inventory.
Large retailers have an easier time selling low-priced merchandise in high
volumes, but this strategy doesn’t always work for small to mid-sized retail
boutiques. With discounting, it’s important to keep an eye on your profit margins
and break-even point, avoid conditioning customers to wait for a sale, and
understand exactly why and when you want to discount products.

## What is a recommendation engine?
A recommendation system is a platform that provides its users with various
content based on their preferences and likings. A recommendation system takes
the information about the users and their behaviours as inputs. This information
can be in the form of the past usage of the product or the ratings that were
provided for the product. It then processes this information to predict how much
the user would rate or prefer the product. A recommendation system makes use of
a variety of machine learning algorithms.

Another important role that a recommendation system plays today is to search for
similarities between different products. In retailing domain, the recommendation
system searches for products that are similar to the ones you have purchased
previously. This is an important method for scenarios that involve a cold start.
In a cold start, the retailer does not have much user data available to generate
recommendations. Therefore, based on the products that are sold, the engine can
provide recommendations of the products that share a degree of similarity or
satisfy the discount rules. There are three types of Recommendation Engine:

### Content-based Recommendation System
In a content-based recommendation system, the background knowledge of the
products and customer information are taken into consideration. Based on the
products that you have purchased in a retailer chain, it provides you with
similar suggestions. For example, if you have purchased a product that belongs
to the "alcohol" category, the content-based recommendation system will provide
you with suggestions for similar products that have the same category.

### Collaborative Filtering Recommendation System
Unlike content-based filtering that provided recommendations of similar
products, Collaborative Filtering provides recommendations based on the similar
profiles of its users. One key advantage of collaborative filtering is that it
is independent of product knowledge. Rather, it relies on the users with a basic
assumption that what the users liked in the past will also like in the future.
For example, if person A purchases alcohol, snacking and baker categories and B
purchases snacking, baker and ice-cream categories then A will also like ice
cream and B will like the alcohol category.

### Hybrid Recommendation System
There is also a third type of recommendation system that combines both Content
and Collaborative techniques.

## Use cases of recommendation engine
There are many use cases in the retailing domain like recommending products that
are complementary to the product the shopper has chosen, offering a discount to
the potential customers to encourage the purchase or even recommending some new
products that might be interesting for customers. Here I'll talk about two use
cases.

### CRM (Customer Relationship Management)
Customer relationship management (CRM) refers to the principles, practices, and
guidelines that a retailer follows when interacting with its customers. One of
the CRM approaches is offering a discount on different products to various
profiles of customers, which is an application of the Collaborative Filtering
Recommendation System. The discounts target different objectives:
- **Loyalty rewards**: Most consumers in today’s world expect to be rewarded for
shopping at your store and taking home memorable experiences. Studies say 75% of
consumers say they favour companies that offer rewards. You can give out a cash
discount on every nth purchase, a points-based rewarding system that can be
redeemed whenever they want, or gifts on completing purchases of X amount of
merchandise.
- **Conditional discount**: Conditional discounts can help you maintain a
healthy profit margin while also increasing your revenue. For example, 20% off
on purchases of $500 worth of merchandise rather than a straight 15% on every
item is likely to be healthier for your business. It will also be more helpful
in increasing the average basket size and average revenue per consumer.
- **First purchase or first interaction discount**: Some consumers may browse
through your website or your shop and like some of your offerings. But, they
might be on the edge and not able to decide if your products are worth the
value. You can use a special first-purchase discount to tip them over in the
category of paying customers.

<p align="center">
  <img alt="flyer example"
  src="{{ site.baseurl }}/images/20221101-flyer-ex.png"/>
</p>

### Recommending leaflet products to retailers
Usually, retailers start to build the promotion plan several months or even 1
year in advance, since it takes lots of time to negotiate with the supply,
define the category and brand for each leaflet, and also design the discount
for different products. The promotion plan recommendation system is not that
common but it exists and it's pretty helpful for retailers. It can recommend
products for different leaflets by considering various elements like target
turnover, target product amount, discount periods, category distribution, brand
distribution, etc, and it helps retailers to save lots of time.

<p align="center">
  <img alt="leaflet example"
  src="{{ site.baseurl }}/images/20221101-leaflet-ex.jpg"/>
</p>

## Promotion Analysis
After promotion implementation, we need to do some analysis to understand the
promotion effect. For example, among all target customers, how many of them
benefit from the discount? Thanks to the promotion, how much did turnover
increase? Furthermore, the following figure shows the effects of a retailer
promotion on the sales of the promoted product (Gedenk 2002, Neslin 2002).

<p align="center">
  <img alt="promotion effects"
  src="{{ site.baseurl }}/images/20221101-promotion-effects.png"/>
</p>

We distinguish between short-term effects, which occur during the promotion, and
long-term effects, which involve behaviour that takes place after the promotion.
Sales for the promoted brand can increase during the promotion by attracting
customers from other stores (store switching), inducing customers to switch
brands (brand switching), inducing customers to buy from the promoted category
rather than another category (category switching), inducing customers who
normally do not use the product category to purchase it (new users), or inducing
customers to move their purchases forward in time (purchase acceleration).
Purchase acceleration can occur because consumers purchase earlier or because
they purchase more than they would have done without the promotion. Consumers
can either stockpile the extra quantity for future use or consume it at a faster
rate. Total category consumption can also increase owing to category switching
or if the promotion attracts new users.

## Conclusion
In this blog, we talked about how recommendation engines contribute to retail
promotion and how could we follow the performance of a promotion. Since
promotion plays an important role in the retail domain, it's also important to
build a suitable promotion plan and analyse its effects,
[In The Memory](https://www.inthememory.com/?lang=en) could be the expert which
helps retailers to accelerate and improve the decision-making process, define
the promotion plan, optimise category management levers (promotion, assortment,
CRM, etc) and follow the business performance.

<p align="center">
  <img alt="In The Memory"
  src="{{ site.baseurl }}/images/20221101-memory.png"/>
</p>

## References
- Alexis Damen, "Discount Strategy in Retail: How to Offer Discounts & Markdowns Without Slashing Profits", _www.shopify.com_. [Online]. Available: [https://www.shopify.com/retail/retail-discounts-with-profits][r1]
- "How to Execute a Profitable Retail Discounting Strategy: A Definitive Guide", _blog.appointy.com_. [Online]. Available: [https://blog.appointy.com/2021/09/17/retail-discounting/][r2]
- Goran, "40 Amazing Customer Loyalty Statistics in 2022", _www.smallbizgenius.net_. [Online]. Available: [https://www.smallbizgenius.net/by-the-numbers/customer-loyalty-statistics/#gref][r3]
- Karen Gedenk, Scott A. Neslin, and Kusum L. Ailawadi, "Sales Promotion", _faculty.tuck.dartmouth.edu_. [Online]. Available: [https://faculty.tuck.dartmouth.edu/images/uploads/faculty/kusum-ailawadi/Promotions_Metro_Book_Chapter.pdf][r4]
- "6 Examples of FMCG Brands That Publish Digital Leaflets and Flyers", _www.publitas.com_. [Online]. Available: [https://www.publitas.com/blog/6-examples-of-fmcg-brands-that-publish-digital-leaflets-and-flyers/alcampo-deals-discounts-in-brochure.jpg][r5]
- "Customize this Christmas Retail Instagram Post Template", _d1csarkz8obe9u.cloudfront.net_. [Online]. Available: [https://d1csarkz8obe9u.cloudfront.net/posterpreviews/christmas-season-sale-flyer-template-design-e969eba50ca2c2bcc2e5c432f5ec5080_screen.jpg?ts=1605530185][r6]
- Skitterphoto, "store prices rabat discount sale", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/store-prices-rabat-discount-sale-3867742/][image]

[r1]: https://www.shopify.com/retail/retail-discounts-with-profits
[r2]: https://blog.appointy.com/2021/09/17/retail-discounting/
[r3]: https://www.smallbizgenius.net/by-the-numbers/customer-loyalty-statistics/#gref
[r4]: https://faculty.tuck.dartmouth.edu/images/uploads/faculty/kusum-ailawadi/Promotions_Metro_Book_Chapter.pdf
[r5]: https://www.publitas.com/blog/6-examples-of-fmcg-brands-that-publish-digital-leaflets-and-flyers/alcampo-deals-discounts-in-brochure.jpg
[r6]: https://d1csarkz8obe9u.cloudfront.net/posterpreviews/christmas-season-sale-flyer-template-design-e969eba50ca2c2bcc2e5c432f5ec5080_screen.jpg?ts=1605530185
[image]: https://pixabay.com/photos/store-prices-rabat-discount-sale-3867742/
