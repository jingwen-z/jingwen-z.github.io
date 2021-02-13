---
layout:      post
title:       "Youtube video's comments analysis Jay Chou Mojito"
date:        "2020-06-28 22:20:18 +0200"
tags:        [analysis, visualisation]
comments:    true
excerpt:     >
    I extract one video's (Mojito Jay Chou) comments on YouTube with YouTube
    Data API and in this blog I will analyse them in different views.
cover:       /images/20200628-mojito.jpg
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
  <img alt="20200628-mojito"
  src="{{ site.baseurl }}/images/20200628-mojito.jpg"/>
</p>

Jay Chou is a Taiwanese musician, singer, songwriter, record producer, film
producer, actor, and director. In 2000, Chou released his debut album, titled
Jay (2000), under the record company Alfa Music. In 2001, Chou released his
second album, titled Fantasy (2001), which combined Western and Eastern music
style. Since then his music has gained recognition throughout Asia, most notably
in regions such as Mainland China, Hong Kong, Taiwan, Singapore, Southeast Asia,
Korea, Japan and in the Asian communities of Western countries such as the
United States and Australia. I've listened to his songs for nearly 20 years.
Recently, he released his new song "Mojito" on YouTube, which attracts me to
get a better understanding of the audience's opinions. Thus, I extract its
comments on YouTube with YouTube Data API and in this blog I will analyse them
with the following points:
- Daily comments count
- Comments during 24 hours after the release
- Word clouds

## Daily comments count

<p align="center">
  <img alt="daily-comments-count"
  src="{{ site.baseurl }}/images/20200628-daily-comments-count.png"/>
</p>

Until 22h37 28 June 2020(GMT+2), there are 14817539 views, 16007 comments,
164641 likes and 7256 dislikes on the video on YouTube. This plot describes the
daily comments count since the release. The attention that the video is released
at 16h on 11 June 2020 (Central European Summer Time, GMT+2), which means there
are nearly 3500 comments during 8 hours after release !! Afterward, the comments
count decreases with time, but around 100 comments per day.

## Comments during 24 hours after the release

<p align="center">
  <img alt="first24h-comments-count"
  src="{{ site.baseurl }}/images/20200628-first24h-comments-count.png"/>
</p>

Here I zoom the first 24 hours since the release, show the comment counts of
every 5 minutes with this graph. The first comment is posted only 12 seconds
after release! There are 383 comments during the first 5 minutes since release.
The amount decreases with time, but it has around 15 - 20 comments per 5
minutes after 18h on 11 June 2020.

## Word clouds

<p align="center">
  <img alt="comments-all"
  src="{{ site.baseurl }}/images/20200628-comments-all.png"/>
</p>

It might be a good idea to show comments with word clouds. Before creating
word clouds, I used `jieba` module and `nltk` module to tokenize comments in
Chinese and non-Chinese to split off punctuation other than periods; then
created word clouds with `wordcloud` module.

### Comments in Chinese

<p align="center">
  <img alt="comments-cn"
  src="{{ site.baseurl }}/images/20200628-comments-cn.png"/>
</p>

Most of Chinese-written listeners like this song, especially its prelude and the
rap in the middle part, they also think the prelude is similar to one of his old
song "Mi Die Xiang"(Rosemary).

### Comments in non-Chinese

<p align="center">
  <img alt="comments-not-cn"
  src="{{ site.baseurl }}/images/20200628-comments-not-cn.png"/>
</p>

Non-Chinese-written listeners love this song as well, especially its Cuban style.

If you are curious about the scripts, you will find them [here][notebook].

## Reference
- Ping Shiuan Chua, "Using YouTube API to Analyse YouTube Comments on Python", _www.pingshiuanchua.com_. [Online]. Available: [https://www.pingshiuanchua.com/blog/post/using-youtube-api-to-analyse-youtube-comments-on-python][r1]
- "YouTube Data API docs", _developers.google.com_. [Online]. Available: [https://developers.google.com/youtube/v3/docs][r2]
- CDA数据分析师, "一小时销量破百万，Python告诉你周杰伦的《Mojito》到底有多火！", _mp.weixin.qq.com_. [Online]. Available: [https://mp.weixin.qq.com/s?__biz=MzA3OTAxMDQzNQ==&mid=2650634652&idx=1&sn=104cbecc0012c712cdce2e0ab72bd2ab&chksm=87b3d670b0c45f6615d6ac1e0a7e84d91be0ce40d3438fd8ad07c93c60d527ee5fdd58029849&mpshare=1&scene=1&srcid=0624JMdqJbP0ys1upG1tq30M&sharer_sharetime=1592945973355&sharer_shareid=2d100b6ace613eef7480bb415901df3c&exportkey=At1ZMWa1jqV2QNQGaaU%2BcUc%3D&pass_ticket=hNXEM3S%2Bs9yefk1vRE%2FduDaeOI6i9UUJdV4UBrL1mio%3D#rd][r3]
- stopwords-iso/stopwords-zh, "stopwords-zh.txt", _github.com_. [Online]. Available: [https://github.com/stopwords-iso/stopwords-zh/blob/master/stopwords-zh.txt][r4]
- uzairadamjee, "Introduction to NLP Library: TextBlob", _uzairadamjee.com_. [Online]. Available: [http://uzairadamjee.com/blog/textblob/][r5]
- TextBlob, "Tutorial: Quickstart", _textblob.readthedocs.io_. [Online]. Available: [https://textblob.readthedocs.io/en/dev/quickstart.html#sentiment-analysis][r8]
- "Jay Chou", _en.wikipedia.org_. [Online]. Available: [https://en.wikipedia.org/wiki/Jay_Chou][r9]
- fxsjy/jieba, "'结巴'中文分词：做最好的 Python 中文分词组件", _github.com_. [Online]. Available: [https://github.com/fxsjy/jieba][r10]
- "Chat icon isolated on white background", _www.google.fr_. [Online]. Available: [https://www.google.fr/search?q=chat+logo+white+background&tbm=isch&ved=2ahUKEwiShIu9kZrqAhUB_BoKHZxkCZsQ2-cCegQIABAA&oq=chat+logo+white+background&gs_lcp=CgNpbWcQAzoECAAQEzoICAAQBxAeEBM6BggAEAcQHjoICAAQBxAFEB46CAgAEAgQBxAeUL_EQFifykBg5s5AaABwAHgAgAFHiAH1AZIBATSYAQCgAQGqAQtnd3Mtd2l6LWltZw&sclient=img&ei=oRzzXtKvLIH4a5zJpdgJ&bih=826&biw=1440#imgrc=femkTVmL6Y9ooM][r11]
- "Jay Chou logo", _www.google.fr_. [Online]. Available: [https://www.google.fr/search?q=jay+chou+logo&tbm=isch&ved=2ahUKEwjDpZ2tjJrqAhWUwoUKHRxPC0QQ2-cCegQIABAA&oq=jay+chou+logo&gs_lcp=CgNpbWcQAzIECAAQE1Ck0whYjtYIYN_XCGgAcAB4AIABwAGIAdACkgEDMy4xmAEAoAEBqgELZ3dzLXdpei1pbWc&sclient=img&ei=QhfzXsP8EZSFlwScnq2gBA&bih=826&biw=1440#imgrc=e5qmK-0-nr-vMM&imgdii=4p_FGFC0_sCI8M][r12]
- "mojito cocktail", _static4.depositphotos.com_. [Online]. Available: [https://static4.depositphotos.com/1004221/347/i/950/depositphotos_3479588-stock-photo-mojito-cocktail-on-white-background.jpg][r13]
- "like logo", _www.google.fr_. [Online]. Available: [https://www.google.fr/search?q=like+logo+white+background&tbm=isch&ved=2ahUKEwiW4ebVrqLqAhXH_4UKHYsPBEUQ2-cCegQIABAA&oq=like+logo+white+ba&gs_lcp=CgNpbWcQARgAMgQIABATOgQIABBDOgIIADoECAAQHjoGCAAQHhATOggIABAIEB4QE1C05zRYgfQ0YJX9NGgAcAB4AIABQIgBtwOSAQE5mAEAoAEBqgELZ3dzLXdpei1pbWc&sclient=img&ei=_Gz3XpbzBcf_lwSLn5CoBA&bih=1366&biw=2560#imgrc=y8lRvg-O-MpsMM&imgdii=7smPkhKSoH7StM][r14]
- "dislike logo", _google.fr_. [Online]. Available: [https://www.google.fr/search?q=dislike+logo+white+background&tbm=isch&ved=2ahUKEwiMocH0saLqAhUO04UKHSIgBFQQ2-cCegQIABAA&oq=dislike+logo+white+background&gs_lcp=CgNpbWcQA1DGrDxYra48YOGvPGgAcAB4AIABPogBrgGSAQEzmAEAoAEBqgELZ3dzLXdpei1pbWc&sclient=img&ei=YXD3XszsMI6mlwSiwJCgBQ&bih=1366&biw=2560#imgrc=Qy7qmC1XzFtJuM][r15]
- StockSnap, "mojito cocktail drink", _pixabay.com_. [Online]. Available: [https://pixabay.com/photos/mojito-cocktail-drink-beverage-698499/][img]

[r1]: https://www.pingshiuanchua.com/blog/post/using-youtube-api-to-analyse-youtube-comments-on-python
[r2]: https://developers.google.com/youtube/v3/docs
[r3]: https://mp.weixin.qq.com/s?__biz=MzA3OTAxMDQzNQ==&mid=2650634652&idx=1&sn=104cbecc0012c712cdce2e0ab72bd2ab&chksm=87b3d670b0c45f6615d6ac1e0a7e84d91be0ce40d3438fd8ad07c93c60d527ee5fdd58029849&mpshare=1&scene=1&srcid=0624JMdqJbP0ys1upG1tq30M&sharer_sharetime=1592945973355&sharer_shareid=2d100b6ace613eef7480bb415901df3c&exportkey=At1ZMWa1jqV2QNQGaaU%2BcUc%3D&pass_ticket=hNXEM3S%2Bs9yefk1vRE%2FduDaeOI6i9UUJdV4UBrL1mio%3D#rd
[r4]: https://github.com/stopwords-iso/stopwords-zh/blob/master/stopwords-zh.txt
[r5]: http://uzairadamjee.com/blog/textblob/
[r8]: https://textblob.readthedocs.io/en/dev/quickstart.html#sentiment-analysis
[r9]: https://en.wikipedia.org/wiki/Jay_Chou
[r10]: https://github.com/fxsjy/jieba
[r11]: https://www.google.fr/search?q=chat+logo+white+background&tbm=isch&ved=2ahUKEwiShIu9kZrqAhUB_BoKHZxkCZsQ2-cCegQIABAA&oq=chat+logo+white+background&gs_lcp=CgNpbWcQAzoECAAQEzoICAAQBxAeEBM6BggAEAcQHjoICAAQBxAFEB46CAgAEAgQBxAeUL_EQFifykBg5s5AaABwAHgAgAFHiAH1AZIBATSYAQCgAQGqAQtnd3Mtd2l6LWltZw&sclient=img&ei=oRzzXtKvLIH4a5zJpdgJ&bih=826&biw=1440#imgrc=femkTVmL6Y9ooM
[r12]: https://www.google.fr/search?q=jay+chou+logo&tbm=isch&ved=2ahUKEwjDpZ2tjJrqAhWUwoUKHRxPC0QQ2-cCegQIABAA&oq=jay+chou+logo&gs_lcp=CgNpbWcQAzIECAAQE1Ck0whYjtYIYN_XCGgAcAB4AIABwAGIAdACkgEDMy4xmAEAoAEBqgELZ3dzLXdpei1pbWc&sclient=img&ei=QhfzXsP8EZSFlwScnq2gBA&bih=826&biw=1440#imgrc=e5qmK-0-nr-vMM&imgdii=4p_FGFC0_sCI8M
[r13]: https://static4.depositphotos.com/1004221/347/i/950/depositphotos_3479588-stock-photo-mojito-cocktail-on-white-background.jpg
[r14]: https://www.google.fr/search?q=like+logo+white+background&tbm=isch&ved=2ahUKEwiW4ebVrqLqAhXH_4UKHYsPBEUQ2-cCegQIABAA&oq=like+logo+white+ba&gs_lcp=CgNpbWcQARgAMgQIABATOgQIABBDOgIIADoECAAQHjoGCAAQHhATOggIABAIEB4QE1C05zRYgfQ0YJX9NGgAcAB4AIABQIgBtwOSAQE5mAEAoAEBqgELZ3dzLXdpei1pbWc&sclient=img&ei=_Gz3XpbzBcf_lwSLn5CoBA&bih=1366&biw=2560#imgrc=y8lRvg-O-MpsMM&imgdii=7smPkhKSoH7StM
[r15]: https://www.google.fr/search?q=dislike+logo+white+background&tbm=isch&ved=2ahUKEwiMocH0saLqAhUO04UKHSIgBFQQ2-cCegQIABAA&oq=dislike+logo+white+background&gs_lcp=CgNpbWcQA1DGrDxYra48YOGvPGgAcAB4AIABPogBrgGSAQEzmAEAoAEBqgELZ3dzLXdpei1pbWc&sclient=img&ei=YXD3XszsMI6mlwSiwJCgBQ&bih=1366&biw=2560#imgrc=Qy7qmC1XzFtJuM
[img]: https://pixabay.com/photos/mojito-cocktail-drink-beverage-698499/
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/analysis/Jay%20Chou%20Mojito/analysis_mojito_youtube.ipynb
