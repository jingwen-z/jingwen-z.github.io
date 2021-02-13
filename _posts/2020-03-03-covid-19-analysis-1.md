---
layout:      post
title:       "COVID-19 analysis (up to 2020-03-02) COVID-19分析（截至2020年3月2日）"
date:        "2020-03-03 21:16:07 +0100"
tags:        [analysis, COVID-19, visualisation, geovisualisation]
comments:    true
excerpt:     >
    The outbreak of the COVID-19 has been more than two months. The initial
    outbreak has greatly affected China and other Asian countries, and it has
    spread in other countries around the world in the past two weeks. In this
    blog, I will analyse COVID-19 outbreak with multiple points.
cover:       /images/20200303-china-map.png
img_width:   1280
img_height:  853
---

<p align="center">
  <img alt="China COVIF-19 map"
  src="{{ site.baseurl }}/images/20200303-china-map.png"/>
</p>

2019新型冠状病毒疫情爆发已有两个多月，爆发初期对中国及亚洲其他国家产生很大影响，近两周在全球其他
国家开始扩散。此篇博客将从一下几点对2019新型冠状病毒疫情进行分析：
- 中国整体疫情
- 中国各省疫情
- 中国各地区疫情
- 全球疫情

The outbreak of the COVID-19 has been more than two months. The initial outbreak
has greatly affected China and other Asian countries, and it has spread in other
countries around the world in the past two weeks. In this blog, I will analyse
COVID-19 outbreak with the following points:

- Overall epidemic in China
- Epidemics in provinces of China
- Epidemics in regions of China
- Global outbreak

## Overall epidemic in China (中国整体疫情)

### Confirmed count (确诊病例)
<p align="center">
  <img alt="20200302_china_confirmed_cases"
  src="{{ site.baseurl }}/images/20200302_china_confirmed_cases.png"/>
</p>

截至北京时间2020年3月2日24时，中国累计确诊新冠肺炎病例约80175例，较前一天增长203例。需要
注意的是，2020年2月5日的新增确诊病例量达到顶峰，如果按7-14天潜伏期来算，说明在1月24日与1
月29日之间，感染新冠并处于潜伏期的人偏多。此时正值中国新年假期，人们走亲访友可能成为被传染
的一个因素。但随后每日新增确诊人数开始下降，环比确诊数也下降到+/-20%，可以反映出1月底人们
防范意识开始加强，降低了被传染的可能性。

2020年2月13日，由于湖北省诊断标准更改，新增确诊数大大增加。按原有诊断标准，疑似病例且进行
核酸/基因测序检查结果为阳性者被视为新增确诊病例；更改后的诊断标准添加了临床诊断病例，所谓
临床诊断病例，是指疑似病例具有肺炎影像学特征者，也就是说，只要符合疑似标准，且有CT特征，即
可被视为新增确诊病例，不再需要进行核酸检测。

2020年2月21日，三省五个监狱发现疫情：武汉女子监狱（武汉）确诊230例，湖北省未成年犯管教
（武汉）所疑似1例，沙洋汉津监狱（荆门）确诊41例，疑似9例，任城监狱（济宁）确诊200例，疑
似10例，十里丰监狱（衢州）确诊34例。监狱系统确诊病例爆发，原因可能是以下三个方面：一、前
期防控不足，对密切接触者、疑似人员没有做到“早发现、早隔离、早治疗”；二、在封闭的环境中更
容易造成疾病的大范围传播；三、在相关人员（如狱警）确诊后，监狱马上开展了集中的大范围排查，
一次性确诊了较多病例。

Up to 24:00 Beijing time on 2/3/2020, China has cumulatively diagnosed about
80175 confirmed cases of coronavirus, an increase of 203 over the previous
day. It should be noted that the number of newly confirmed cases on February
5, 2020 reached its peak. If our calculation is based on the 7-14 days'
incubation period, it means that between January 24 and January 29, people who
were infected and were in the incubation period are a little bit more. It was
exactly the Chinese New Year holiday, people visited relatives and friends may
become a factor of infection. However, the number of newly confirmed cases
started to decline daily, and the number of confirmed cases dropped to +/- 20%
from the previous day, which can reflect that people's awareness of prevention
began to strengthen at the end of January, which reduces the possibility of
infection.

On February 13, 2020, the number of newly confirmed cases increased
significantly due to changes in diagnostic standards in Hubei Province.
According to the original diagnostic criteria, suspected cases and positive
results of nucleic acid / gene sequencing are considered as newly confirmed
cases; the updated diagnostic criteria added clinical diagnosis cases. The
so-called clinical diagnosis cases refer to the suspected cases with pneumonia
imaging features, that is, as long as they meet the suspected criteria and have
CT features, they can be regarded as newly confirmed cases, and no nucleic acid
test is required.

On February 21, 2020, outbreaks were found in five prisons in three provinces:
230 cases were confirmed in Wuhan Women's Prison (Wuhan), 1 case was suspected
by Hubei Province Juvenile Delinquent (Wuhan), and 41 cases were confirmed in
Shayang Hanjin Prison (Jingmen). Nine cases were suspected, 200 cases were
confirmed by Rencheng Prison (Jining), 10 cases were suspected, and 34 cases
were confirmed by Shilifeng Prison (Luzhou). The outbreak of confirmed cases in
the prison system may be due to the following three aspects: 1. Inadequate
pre-control and lack of "early detection, early isolation, and early treatment"
of close contacts and suspects; 2. virus is more likely to spread widely in a
closed environment; 3. After the relevant personnel (such as prison guards)
being confirmed, the prison immediately launched a large-scale investigation
and confirmed many cases at the same time.

### Cured count vs. Dead count (治愈病例 vs. 死亡病例)
<p align="center">
  <img alt="20200302_china_cure_mortality"
  src="{{ site.baseurl }}/images/20200302_china_cure_mortality.png"/>
</p>

截至北京时间2020年3月2日24时，中国累计治愈新冠肺炎病例44843例，累计死亡新冠肺炎病例2915例。
自2020年1月31日起，中国新冠肺炎病例治愈数量和治愈率超过死亡数量和死亡率，且差值越来越大，目前
已达到55.93%。这和医务人员的不懈努力是分不开的。

Up to 24:00 Beijing time on 2/3/2020, China has cumulatively cured 44843 cases
of coronavirus and accumulated 2915 cases of deaths. Since January 31, 2020, the
number of cured cases and the cure rate of new cases of pneumonia in China have
exceeded the number of deaths and death rates, and the difference is getting
larger and larger, currently reaching 55.93%. This is inseparable from the
tireless efforts of medical staff.

## Epidemics in provinces of China (中国各省疫情)

<p align="center">
  <img src="{{ site.baseurl }}/images/20200303-china-map-ts.gif"
       style="max-width: 720px"
       alt="20200303-china-map-time series">
</p>

### Hubei vs. other provinces (湖北省 vs. 非湖北省)

<p align="center">
  <img alt="20200302_province_confirmed_cases"
  src="{{ site.baseurl }}/images/20200302_province_confirmed_cases.png"/>
</p>

截至北京时间2020年3月2日24时，中国各省（直辖市、自治区）中湖北省确诊病例最多，累计高达67103
例，远超其余省份确诊数量之和（13072）；湖北省治愈率为50.6%，其余省份为83.5%；湖北省新冠肺炎
死亡率为4.2%，其余省份为0.9%。

As of 24:00 Beijing time on 2/3/2020, Hubei Province has the largest number of
confirmed cases in all provinces (municipalities and autonomous regions) in
China, with a cumulative total of 67103 cases, far exceeding the sum of the
confirmed number of other provinces (13072); the cure rate in Hubei Province is
50.6%, the remaining provinces accounted for 83.5%; Hubei Province had a
coronavirus' mortality rate of 4.2%, and the remaining provinces were 0.9%.

### Cumulative confirmed count per province (not Hubei) (非湖北省累计确诊病例数)

<p align="center">
  <img alt="20200302_province_details_confirmed_cases"
  src="{{ site.baseurl }}/images/20200302_province_details_confirmed_cases.png"/>
</p>

上图省份按照现存确诊数降序排列。除湖北省，广东省、河南省和浙江省，累计确诊均多于1000例，对照
2018年人口数据，人口多、人员流动性强也许是其中一个原因；西藏自治区于2020年1月29日出现1例确诊，
且该患者已于2月12日被治愈出院；2月21日10时20分，青海省最后2例新冠肺炎病例从青海省第四人民医
院出院。至此，青海收住在青海省第四人民医院的15例确诊病例全部出院，加之前期收住在西宁市第三人
民医院已经出院的3例确诊病例，青海18例确诊病例全部出院。西藏自治区和青海省目前为中国唯一两个零
确诊病例的省（直辖市、自治区）。

The provinces above are listed in descending order of the number of confirmed
cases. Except for Hubei Province, Guangdong Province, Henan Province and
Zhejiang Province, the cumulative cases was more than 1000 cases. Compared with
the 2018 population data, the large population and strong mobility may be one of
the reasons. One case was confirmed in Tibet Autonomous Region on January 29,
2020, and the patient was cured and discharged on February 12; at 10:20 on
February 21, the last 2 cases of coronavirus in Qinghai Province were discharged
from the Fourth People's Hospital of Qinghai Province. So far, all 18 confirmed
cases in Qinghai Province have been discharged. The Tibet Autonomous Region and
Qinghai Province are currently the only two provinces in China with zero
confirmed cases.

### Cured rate & mortality per province (各省治愈率与死亡率)

<p align="center">
  <img alt="20200302_province_scatter"
  src="{{ site.baseurl }}/images/20200302_province_scatter.png"/>
</p>

由于湖北省是最早出现病例且爆发的省份，医疗设备紧缺，导致湖北省的死亡率在所有省份中很高；除此之外，
黑龙江省新冠肺炎的死亡率也很高，由丁香园2月8日的日报得知，黑龙江省死亡率高的原因主要有以下两点：
人民警惕性偏低和家庭聚集。东北三省，发现第一例病例均为1月22日，且都为外地返乡人员，且三省均在1月
25日启动了重大突发公共卫生事件I级响应，然而对比三省人民对这次疫情的态度，我们发现黑龙江人民相对
警惕性偏低；截止2月6日，黑龙江家庭聚集占比93.75%，48起因“聚集”引发的肺炎，有45起都是因为“家庭
聚集”，其中黑龙江死亡病例的3人均因“家庭聚集”。

其次，有几个省份的治愈率达到了80%，西藏自治区累计确诊1例且治愈，故治愈率为100%；青海省累计确诊
18例且已全部治愈，故治愈率为100%；甘肃省累计确诊病例也偏少（91例），所以相对来说治愈率高；澳门
特别行政区，同理。

Because Hubei Province is the first case with an outbreak and medical equipment
is in short supply, the mortality rate in Hubei Province is very high in all
provinces. In addition, the mortality rate of coronavirus in Heilongjiang
Province is also high. According to the daily news of Dingxiangyuan, we learned
that the main reasons for the high mortality rate in Heilongjiang Province are
the following two points: people's low alertness and family gathering. In the
three provinces of Northeast China, the first case was found on January 22, and
all were returnees from other places. All three provinces initiated a Grade I
response to a major public health emergency on January 25. With regard to the
attitude towards the epidemic, we found that the relative vigilance of the
people in Heilongjiang was relatively low. As of February 6, Heilongjiang ’s
family gathering accounted for 93.75%, 48 cases of coronavirus were caused by
“gathering”, 45 were due to “family gathering”, 3 of the deaths were due to
"family gathering".

Secondly, several provinces have a cure rate of 80%. The Tibet Autonomous Region
has a total of 1 confirmed diagnosis and cure, so the cure rate is 100%; Qinghai
Province has cumulatively confirmed 18 cases and all cured, so the cure rate is
100%; Gansu Province The cumulative number of confirmed cases is relatively small
(91 cases), so the cure rate is relatively high; the same reason for Macao.

### Daily new confirmed count & daily cumulative confirmed count (not Hubei) (非湖北省每日新增确诊数与累计确诊数)

<p align="center">
  <img alt="20200302_province_not_hubei"
  src="{{ site.baseurl }}/images/20200302_province_not_hubei.png"/>
</p>

截至北京时间2020年3月2日24时，除湖北省以外的省份，每日新增确诊病例已从2月5日起连续下降，且从2月
14日起，每日新增确诊已低于1月24日水平了，这一天是武汉封城的第二天。

2020年2月21日，三省五个监狱发现疫情，导致新增确诊病例大增：武汉女子监狱（武汉）确诊230例，湖北省
未成年犯管教（武汉）所疑似1例，沙洋汉津监狱（荆门）确诊41例，疑似9例，任城监狱（济宁）确诊200例，
疑似10例，十里丰监狱（衢州）确诊34例。

--- English version ---

As of 24:00 Beijing time on 2/3/2020, the number of newly confirmed cases per
day in provinces other than Hubei Province has been declining continuously since
February 5, and since February 14, the daily number of newly confirmed cases has
been lower than the January 24th, which is the second day of Wuhan's closure.

On February 21, 2020, outbreaks were found in five prisons in three provinces:
230 cases were confirmed in Wuhan Women's Prison (Wuhan), 1 case was suspected
by Hubei Province Juvenile Delinquent (Wuhan), and 41 cases were confirmed in
Shayang Hanjin Prison (Jingmen). Nine cases were suspected, 200 cases were
confirmed by Rencheng Prison (Jining), 10 cases were suspected, and 34 cases
were confirmed by Shilifeng Prison (Luzhou).

### Daily cumulative confirmed count for each province (各省每日累计确诊数量)

<p align="center">
  <img alt="20200302_province_timeseries"
  src="{{ site.baseurl }}/images/20200302_province_timeseries.png"/>
</p>

由上图可以看出，湖北省新增确诊病例数从2020年2月4日逐渐放缓，2月13日湖北省诊断标准更改，新增确
诊数大大增加，随后新增确诊数量恢复至13日之前的速度。可以体现出与湖北省自身情况相比，已经有好转
的迹象，但由于湖北省是新冠肺炎始发省份，最初的确诊病例就多于其他省份，且人们对此病毒的抵抗力偏
低，所以导致湖北省的确诊病例远远高于其他省份（直辖市、自治区）。

此外，由下面的图不难看出，我们可以把除湖北省外的省份（直辖市、自治区）分成三组：一、累计确诊高于
1100例的三个省份（广东省、河南省和浙江省），二、累计确诊介于900与1100例的三个省份（湖南省、安
徽省和江西省），三、其他所有省份（直辖市、自治区）。第一组中起初累计确诊病例最多的省份为广东省，
但于1月29日被浙江省反超，后来于2月5日超过浙江省，而浙江省的累计确诊病例数自2月8日起趋于平缓且于
2月12日被河南省超过。广东省累计确诊病例多的原因可能跟广东省人口多有关，人口多，基数大，是导致累
计确诊数量大的其中一个原因。河南省南临湖北省，地理位置相邻也许是该省累计确诊数量多的其中一个原因；
另外，据央视新闻客户端报道，2020年1月23日，河南省许昌市刘某某在疫情期间为其儿子在许昌东城区某大
酒店举办婚宴。2月5日，刘某某女儿确诊为新型冠状病毒肺炎病例后，面对疾控部门工作人员的询问，刘某
刻意隐瞒其从武汉返乡的事实，也绝口不提家中曾办过婚礼大宴宾客。之后工作人员通过调查，发现婚宴的参
与者共有约200人。此类“家庭聚集”事件也是促使新冠病毒传染的一大因素。

2020年2月21日，三省五个监狱发现疫情，导致新增确诊病例大增：武汉女子监狱（武汉）确诊230例，湖北
省未成年犯管教（武汉）所疑似1例，沙洋汉津监狱（荆门）确诊41例，疑似9例，任城监狱（济宁）确诊200
例，疑似10例，十里丰监狱（衢州）确诊34例。

According to the above figure, the number of newly confirmed cases in Hubei
Province has gradually slowed down from February 4, 2020, and the diagnostic
standards in Hubei Province have changed on February 13, the number of newly
confirmed cases has increased significantly, the number of new confirmed
subsequently recovered to the speed before the February 13. It can be shown
that compared with the situation in Hubei Province, there are already signs of
improvement, but since Hubei Province is the originating province of COVID-19,
the initial confirmed cases are more than other provinces, and people's
resistance to this virus is low, so as a result, the number of confirmed cases
in Hubei Province is much higher than in other provinces.

In addition, it is not difficult to see from the second figure that we can
divide the provinces (municipalities, autonomous regions) other than Hubei
Province into three groups: 1. Three provinces (Guangdong, Henan, and Zhejiang)
with a cumulative confirmed cases of more than 1100 cases Second, the three
provinces (Hunan, Anhui and Jiangxi provinces) with a cumulative confirmed cases
between 900 and 1100 cases, and all other provinces (municipalities, autonomous
regions). In the first group, the province with the most cumulative confirmed
cases was Guangdong Province, but was overtaken by Zhejiang Province on January
29, and later passed Zhejiang Province on February 5, and the cumulative number
of confirmed cases in Zhejiang Province began on February 8. It flattened and
was overtaken by Henan Province on February 12. The reason why the cumulative
number of confirmed cases in Guangdong Province may be related to the large
population in Guangdong Province. The large population is one of the reasons
for the large number of cumulative diagnoses. The proximity of Henan Province
to Hubei Province in the south may be one of the reasons why it has accumulated
a large number of diagnoses. In addition, according to a CCTV news, on January
23, 2020, Liu hosted a wedding for his son in a restaurant during the epidemic.
On February 5th, after Liu's daughter was diagnosed with a COVID-19, Liu
concealed the fact that she returned from Wuhan. After investigation, the police
found that there were about 200 participants in the wedding reception. Such
"family gathering" events are also a major factor in the transmission of the
COVID-19.

On February 21, 2020, outbreaks were found in five prisons in three provinces:
230 cases were confirmed in Wuhan Women's Prison (Wuhan), 1 case was suspected
by Hubei Province Juvenile Delinquent (Wuhan), and 41 cases were confirmed in
Shayang Hanjin Prison (Jingmen). Nine cases were suspected, 200 cases were
confirmed by Rencheng Prison (Jining), 10 cases were suspected, and 34 cases
were confirmed by Shilifeng Prison (Luzhou).

## Epidemics in regions of China (中国各地区疫情)
### Huabei Region (华北地区)

<p align="center">
  <img alt="20200302_huabei"
  src="{{ site.baseurl }}/images/20200302_huabei.png"/>
</p>

<p align="center">
  <img src="{{ site.baseurl }}/images/20200302-huabei-ts.gif"
       style="max-width: 720px"
       alt="20200303-huabei-time series">
</p>

截至北京时间2020年3月2日24时，华北地区累计确诊病例平均值为18例，累计确诊病例最多的城市（区）
为北京市-朝阳区，共有71例。在累计确诊病例大于该地区平均值且死亡率为正的城市（区）中，河北省-秦
皇岛死亡率最高，为10.0%。

需要特别注意的是天津市宝坻区和河北省唐山市，他们分别于2020年2月1日和1月28日才出现第一例确诊病
例，却出现快速增长的现象，于2月21日达到华北地区确诊病例并列第三的情况。

(注：上图只对累计确诊病例大于该地区平均值且死亡率为正的城市（区）进行了标注。)

Up to 24:00, 2/3/2020 Beijing time, the average number of confirmed cases in
North China was 18, and the city (district) with the largest number of confirmed
cases is Beijing-Chaoyang District, with a total of 71 cases. Among the cities
(districts) where the cumulative confirmed cases were larger than the region's
average and the mortality rate was positive, Hebei Province Qinhuangdao had the
highest mortality rate of 10.0%.

It is important to note that Baodi District of Tianjin and Tangshan of Hebei
Province had their first confirmed cases only on February 1, 2020, and January
28, 2020, but they experienced rapid growth, reaching on February 21. The number
of confirmed cases in North China is the third.

(Note: The above figure only labels the cities (districts) whose cumulative
confirmed cases are greater than the average of the region and whose mortality
is positive.)

### Dongbei Region (东北地区)

<p align="center">
  <img alt="20200302_dongbei"
  src="{{ site.baseurl }}/images/20200302_dongbei.png"/>
</p>

截至北京时间2020年3月2日24时，东北地区累计确诊病例平均值为16例，累计确诊病例最多的城市（区）为黑龙江省-哈尔滨，共有198例。在累计确诊病例大于该地区平均值且死亡率为正的城市（区）中，黑龙江省-绥化死亡率最高，为8.51%。

注：上图只对累计确诊病例大于该地区平均值且死亡率为正的城市（区）进行了标注。

As of 24:00 Beijing time 2/3/2020 , the average number of cumulative confirmed cases in Northeast China was 16 and the city (district) with the largest number of cumulative confirmed cases was 黑龙江省-哈尔滨(Heilongjiang Province-Harbin) with a total of 198 cases. Among the cities (districts) where the cumulative number of confirmed cases was greater than the regional average and the mortality rate was positive, 黑龙江省-绥化(Heilongjiang Province-Suihua) had the highest mortality rate of 8.51%.

Note: The above figure only labels the cities (districts) whose cumulative confirmed cases are greater than the average of the region and whose mortality is positive.

### Huadong Region (华东地区)

<p align="center">
  <img alt="20200302_huadong"
  src="{{ site.baseurl }}/images/20200302_huadong.png"/>
</p>

<p align="center">
  <img src="{{ site.baseurl }}/images/20200302-huadong-ts.gif"
       style="max-width: 720px"
       alt="20200303-huadong-time series">
</p>

截至北京时间2020年3月2日24时，华东地区累计确诊病例平均值为56例，累计确诊病例最多的城市（区）为浙江省-温州，共有504例。在累计确诊病例大于该地区平均值且死亡率为正的城市（区）中，山东省-泰安死亡率最高，为5.71%。

需要特别注意的是山东省济宁和任城监狱确诊病例于2020年2月21日的大幅度增长来自于任城监狱确诊了200例病例。

注：上图只对累计确诊病例大于该地区平均值且死亡率为正的城市（区）进行了标注。

As of 24:00, 2/3/2020 Beijing time, the average cumulative number of confirmed cases in East China was 56. The city (district) with the largest number of cumulative confirmed cases was 浙江省-温州(Zhejiang-Wenzhou), with a total of 504 cases. Among the cities (districts) with cumulative diagnosed cases that were larger than the regional average and positive mortality rates, 山东省-泰安(Shandong-Taian) had the highest mortality rate of 5.71%.

It is important to note that the substantial increase in confirmed cases in Jining and Rencheng prisons in Shandong Province on February 21, 2020 came from the 200 confirmed cases in Rencheng prison.

Note: The above figure only labels the cities (districts) whose cumulative confirmed cases are greater than the average of the region and whose mortality is positive.

### Zhongnan Region (中南地区)

<p align="center">
  <img alt="20200302_zhongnan"
  src="{{ site.baseurl }}/images/20200302_zhongnan.png"/>
</p>

截至北京时间2020年3月2日24时，中南地区累计确诊病例平均值为691例，累计确诊病例最多的城市（区）为湖北省-武汉，共有49315例。在累计确诊病例大于该地区平均值且死亡率为正的城市（区）中，海南省-定安死亡率最高，为33.33%。

注：上图只对累计确诊病例大于该地区平均值且死亡率为正的城市（区）进行了标注。

Up to 24:00 Beijing time on 2/3/2020, the average number of confirmed cases in Central and South China was 691, and the city (district) with the largest number of confirmed cases was 湖北省-武汉(Hubei Province-Wuhan), with a total of 49315 cases. Among the cities (districts) where the cumulative number of confirmed cases was greater than the regional average and the mortality rate was positive, 海南省-定安(Hainan Province-Ding'an) had the highest mortality rate of 33.33%.

Note: The above figure only labels the cities (districts) whose cumulative confirmed cases are greater than the average of the region and whose mortality is positive.

### Xinan Region (西南地区)

<p align="center">
  <img alt="20200302_xinan"
  src="{{ site.baseurl }}/images/20200302_xinan.png"/>
</p>

截至北京时间2020年3月2日24时，西南地区累计确诊病例平均值为16例，累计确诊病例最多的城市（区）为四川省-成都，共有143例。在累计确诊病例大于该地区平均值且死亡率为正的城市（区）中，贵州省-六盘水死亡率最高，为10.0%。

注：上图只对累计确诊病例大于该地区平均值且死亡率为正的城市（区）进行了标注。

As of 24:00 Beijing time 2/3/2020, the average number of confirmed cases in the southwestern region was 16 and the city (district) with the largest number of confirmed cases was 四川省-成都(Sichuan Province-Chengdu), with a total of 143 cases. Among the cities (districts) where the cumulative confirmed cases were larger than the average in the region and the mortality rate was positive, 贵州省-六盘水(Guizhou Province-Liupanshui) had the highest mortality rate, at 10.0%.

Note: The above figure only labels the cities (districts) whose cumulative confirmed cases are greater than the average of the region and whose mortality is positive.

### Xibei Region (西北地区)

<p align="center">
  <img alt="20200302_xibei"
  src="{{ site.baseurl }}/images/20200302_xibei.png"/>
</p>

截至北京时间2020年3月1日24时，西北地区累计确诊病例平均值为10例，累计确诊病例最多的城市（区）为陕西省-西安，共有120例。在累计确诊病例大于该地区平均值且死亡率为正的城市（区）中，新疆维吾尔自治区-兵团第八师石河子市死亡率最高，为25.0%。

注：上图只对累计确诊病例大于该地区平均值且死亡率为正的城市（区）进行了标注。

Up to 24:00, 1/3/2020 Beijing time, the average number of cumulative confirmed cases in the Northwest is 10, and the city (district) with the largest number of cumulative confirmed cases is 陕西省-西安(Shaanxi Province-Xi'an), with a total of 120 cases. Among the cities (districts) where the cumulative number of confirmed cases was greater than the regional average and the mortality rate was positive, 新疆维吾尔自治区-兵团第八师石河子市(the Xinjiang Uygur Autonomous Region-Bingtuan Eighth Division Shihezi City) had the highest mortality rate, at 25.0%.

Note: The above figure only labels the cities (districts) whose cumulative confirmed cases are greater than the average of the region and whose mortality is positive.

## Global outbreak (全球疫情)

### Cumulative confirmed count per country & confirmed cases per 1000 persons (各国累计确诊数量与每千人确诊数量)

<p align="center">
  <img alt="20200302_countries_population"
  src="{{ site.baseurl }}/images/20200302_countries_population.png"/>
</p>

上图国家按照现存确诊数降序排列。现存确诊病例最多的三个国家为China、South Korea和Italy，分别有32417例、4277例和1835例。虽然中国累计确诊病例远超韩国，但结合2019年人口总数比较，每千人的确诊病例数韩国在三个国家中位居第一位，这可能与人们重视程度有关。

The countries in the figure above are listed in descending order of the number of confirmed diagnoses. The three countries with the highest number of confirmed cases are China, South Korea, and Italy, with 32417, 4277, and 1835, respectively. Although China has far more confirmed cases than Korea, combined with the total population in 2019, Korea ranks first among the three in the number of confirmed cases per 1,000 people, which may be related to people's attention.


### Daily cumulative confirmed count for each country (各国累计确诊数量)

<p align="center">
  <img src="{{ site.baseurl }}/images/20200302-country-ts.gif"
       style="max-width: 720px"
       alt="20200303-country-time series">
</p>

<p align="center">
  <img alt=""
  src="{{ site.baseurl }}/images/20200302_countries_top12_evol.png"/>
</p>

对于累计确诊病例最多的12个国家，上图描绘了各国确诊病例环比增长的百分比。其中韩国2月20日新增确诊病例较前一日增加例3倍多，意大利2月21日的新增确诊病例较前一日增加了5倍，法国2月27日的新增确诊病例较前一日增加了3倍有余。

For the top 12 countries with the highest number of confirmed cases, the chart above describes the percentage increase in the number of confirmed cases. Among them, the number of newly confirmed cases in South Korea on February 20 increased three times over the previous day, the number of newly confirmed cases in Italy on February 21 increased five times compared to the previous day, and the number of newly confirmed cases in France on February 27 was three times more than the previous day.

If you are interested in the scripts, please find them [here][notebook].

## Reference
- Isaac Lin, "DXY-COVID-19-Data", _www.github.com_. [Online]. Available: [https://github.com/BlankerL/DXY-COVID-19-Data][r1]
- CSSEGISandData, "csse_covid_19_data", _www.github.com_. [Online]. Available: [https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_daily_reports][r2]
- 丁香园 丁香医生, "VOL.23 三省五个监狱发现疫情", _mama.dxy.com_. [Online]. Available: [https://mama.dxy.com/outbreak/daily-of-nationwide-new?index=20200221&locationIds=999&from=todh5][r3]
- 人民网微博, "青海新冠肺炎确诊患者清零", _m.weibo.cn_. [Online]. Available: [https://m.weibo.cn/status/4474349975557803?][r4]

[r1]: https://github.com/BlankerL/DXY-COVID-19-Data
[r2]: https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_daily_reports
[r3]: https://mama.dxy.com/outbreak/daily-of-nationwide-new?index=20200221&locationIds=999&from=todh5
[r4]: https://m.weibo.cn/status/4474349975557803?
[notebook]: https://github.com/jingwen-z/python-playground/blob/master/analysis/2019_nCoV/2019_nCoV.ipynb
