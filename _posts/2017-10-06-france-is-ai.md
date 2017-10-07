---
layout:      post
title:       "france is AI"
date:        "2017-10-06 13:48:00 +0200"
comments:    true
---

<p align="center">
  <img alt="france is AI"
  src="{{ site.baseurl }}/images/20171006-franceisai.jpg"/>
</p>

I participated the conference "[france is AI][france is AI]" in this Thursday
and Friday. In this conference, lots of companies and institutes talked about
their thinking of AI, like Google, Microsoft, INS, INSA Rouen, ENSAE. Thanks to
them, I know more about Data Science and AI, and I'd like to share with you some
interesting points.

## What is AI?

Rather than the natural intelligence (NI) of humans and other animals, artificial
intelligence (AI, also machine intelligence, MI) is apparently intelligent
behaviour by machines. In computer science AI research is defined as the study
of "intelligent agents": any device that perceives its environment and takes
actions that maximize its chance of success at some goal. Colloquially, the term
"artificial intelligence" is applied when a machine mimics "cognitive" functions
that humans associate with other human minds, such as "learning" and "problem
solving". (source: [Wikipedia][Wikipedia])

In the conference, Microsoft thinks that AI is using big compute, powerful algo
and massive data to attain more general intelligence, so that to master human-AI
collaboration and to provide insights on AI, people and society.

## Data Science Ecosystem

Data science is an interdisciplinary domain. Besides the usual challenges
involving experts of two distinct domains, a successful data science project
also need to include a third pole of software and system enfineers, which can
implement the methods developed by data scientists, and maintain the tools.
CNRS's researcher showed us a complete data science ecosystem with the following
figure.

<p align="center">
  <img alt="data science ecosystem"
  src="{{ site.baseurl }}/images/20171006-ds-ecosys.png"/>
</p>

This figure presents the roles of each actor. We don't mean to isolate different
actor, real profile can even overlap several roles at the same time. Due to
limited space, I won't go through in detail. You can read [this blog][ds ecosys]
to understand more about different actors.

## Challenges

Since AI is a new technical domain, there are many challenges to address.
Microsoft mentioned several keys challenges: learning about the world is an
_unspervised manner_, so it's difficult to endow AI systems with commonsense
reasoning that provide them with core understandings about the world; besides,
we also need to imbue systems with key sets of social and emotional skills that
people rely on in communicating, coordinating and collaborating with one another,
and find method for endowing systems with knowledge about the surrounding
physical world and interacting with people and objects in the real world.

Some other companies and institutes also talked about the challenges.
PriceMinister faced attribute test normalisation as a machine translation
problem. CNRS's researcher talked about the data challenges with code submission.
He pointed out the importance of coding prototype and of code review among team
member. Because code review can help us learn from each other and collaborate
with teammates. For this point, I'm totally agree with him.

## Solution

### Chain of data value

<p align="center">
  <img alt="france is AI"
  src="{{ site.baseurl }}/images/20171006-datavalue-chain.jpg"/>
</p>

By the figure above, Dreamquark mentioned the chain of data value. Since it's
easy to read, I won't explain it here.

### Deep Learning in timelines ranking

Twitter uses deep learning in timelines ranking. As we can imagine, Twitter has
billions of data. In oder to ensure the functionality, Twitter customised code
CPU/GPU to speed up, used the max normalization and MDL to make better ranking,
and for fast training, Twitter used partitioned HDFS streamer and customised
data deserializer.

### How to improve data team's productivity?

Twitter talked about the capacities that so-called "Machine Learning experts"
should have: they should master pure research (model exploration, training and
flexibility), applied research (dataset/feature exploration, flexibility and
robustness) and production (feature engineering, data addition, robust training,
deployment and A/B test). In order to increase experiments of ML expert, we
should keep the following points in mind: automation and visualisation, which
facilitate the reproducibility and refreshing of program, result testing,
comparing and analyzing; creating an AI environment, which can help us to
explore data, train fast and manipulate data.

Serena Capital, ISAI and Partech mentioned some important elements of a data
team: technical background(IT + statistic) is necessary, full stack talent (data
correction, integration of business), understanding application of algorithms,
the problem to be solved, and the set of data.

### Golden rules for AI-first product design

Before applying algorithm into your business or product, we should firstly well
understand them. Tinyclues presented us their golden rule for AI product design:
understanding your algorithms' failure modes. That makes sense, only if you know
its failure modes you can analyse the result in your case. Another rule is
keeping an eye on long-term/ayatemic stability. This is important, many people
don't realise that we should not only think for this moment or short-term, but
also should make a plan for long-term, so that we can regconise which points are
more important for us.

## AI rethinking Retail: Walmart Use Case

As a data scientist of retail business, it's really inspiring to hear the
speaking of the largest grocery retailer in the world, Walmart. They used AI to
discovery digital relationships: how people buy? how products stock in the stores?

According to catalog of data, they observed the preference of clients, which
contribute to recommendation and personalization program, and can ensure the
stockage in fullfillment center. During the holidays, it's a challenge for
scanning capacity, because holiday traffic is 10 times more than usual. Moreover,
in this intelligent world, many merchants sell their products online, so does
Walmart. It's really important to ensure the safety of clients' information. In
order to let clients shop safely, Walmart concentrates their efforts on web
security.

## Future of AI

As rising of AI, we have to face many challenges and try to find solution.
Google's AI researcher François Chollet  said next frontier of AI will be
abstraction, reasoning and planning, and should expand the model search space as
well.

Thanks to this fantastic conference, it opens the door of AI to me, it makes me
to realise the amazing technique of AI.

[france is AI]: https://franceisai.com
[Wikipedia]: https://en.wikipedia.org/wiki/Artificial_intelligence
[ds ecosys]: https://medium.com/@balazskegl/the-data-science-ecosystem-678459ba6013
