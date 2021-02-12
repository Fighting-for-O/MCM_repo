# Model Analysis and Implementation

## Analysis - Dynamic of Interactions through Time

The number of fungal species needs to be determined before evaluating the interaction between different species of fungi. Take North America as an example, we find that the total number of fungi is about 20000$^{[1]}$. However, our model only considers the behavior of fungi in a given patch of land, in which geographical scale is much smaller than that of  a continent. It is reasonable to estimate the number of fungal species smaller than 10 in the investigated area. Five species are used as the representative below. We choose "l.conif.n","m.meri.s","m.trem.s","p.sang.s" and "x.sub.s" to discribe the dynamic of interactions between different species. Their key traits are shown in Table 1.

在评估不同物种真菌之间交互前，需要确定真菌种类的数量。在文献[1]中可以发现，整个北美地区的真菌种类量约为20,000。然而，我们的模型考虑的是一个种群的行为，其地理尺度远小于州，因此合理估计为考察的地区真菌种类量在1～10之间，下面采用5种作为代表。我们选用的真菌为A，B，C，D，E，其相关参数见表1

Table 1：见Book1-Sheet1

In this section, assuming that the environment temperature is 25 ℃ and the humidity is 70%. We investigate the changes of five kinds of fungi with time when the environment does not change. In previous chapter, we show that when there is only one kind of fungus, the number curve is in S shape. It increases exponentially in a short-term, and the number is stable at carrying capacity in long-term. In our model, the behavior of the coexistence of multiple species of fungi is different from that of the existence of one kind of fungus. It can be seen from Figure 1 that in short-term, the number of the five fungi increased rapidly, but it does not reach the exponential level.  After a short period of time, the smaller the competitive ranking, the faster the fungi reached the peak of the population. In long-term, the number of all fungi was stable at a fixed value. Only "m.trem.s" with the largest competitive ranking reached carrying capacity. The proportion between the stable number of other fungi and their carrying capacity was negatively correlated with the moisture niche width. We change the environment parameters and the trend does not change.

本节中，假设环境温度25摄氏度、湿度60%，考察当环境不发生变化时，5个种群数量随时间的变化情况。我们知道当仅有一种菌存在时，其数量曲线成“S型”，在时间较短时呈指数级增长，时间较长后数量稳定在carrying capacity。我们的模型中，多种真菌共存时的行为与一种菌存在时现象不同。由图1可以看出，在时间较短时，五种真菌的数量增长迅速，然而并没有到达指数级，而是近似线性；随着时间的增长，competitive ranking 越小的真菌越快达到种群数量的峰值，然后开始下降。当经过很长时间以后，所有的真菌数量均稳定在一个固定值上，但仅有competitive ranking最大的“m.trem.s”达到carrying capacity。其他真菌数量稳定值与carrying capacity的比例与Moisture niche width负相关。

![image-20210208192614307](/Users/scott/Library/Application Support/typora-user-images/image-20210208192614307.png)



[1] Mueller, G.M., Schmit, J.P. Fungal biodiversity: what do we know? What can we predict?. *Biodivers Conserv* **16,** 1–5 (2007). https://doi.org/10.1007/s10531-006-9117-7

## Inplementation - The Impact of Species Number

In this part, we preliminarily explore the impact of biodiversity on fungal system in different environments. Since the number of species is directly related to biodiversity, we analyze the TDR changes with different numbers of fungal species in five actual environments. In order to be simple and rigorous, each analysis of the environment will be divided as follow cases: one kind of fungi in the environment, three different types of fungi in the environment, and five different types of fungi in the environment. For the first two cases, we choose 5 pieces of data for each.

在这一部分，我们初步探索生物多样性对于不同环境下真菌系统的影响。由于物种数量与生物多样性直接正相关，因此这里我们分析在5种实际环境中不同数量的真菌种的TDR变化情况。为了简单又不失严谨，每种环境下会分别如下情况：环境中仅存在一个种群，环境中存在3个不同类型的种群，环境中存在5个不同类型的真菌种群。对于前两种情况，我们每种情况选择5条数据进行分析。

### In Arid Environment 

There is a severe lack of water in the area with arid climate, so the humidity is maintained at a relatively low level. Taking the data of the Sahara Desert as a representative, the typical daily temperature changes from 0 ℃ to 40 ℃ and the relative humidity remains at about 25%. 

![Arid](/Users/scott/Desktop/Arid.png)

在干旱的环境中，区域中缺少水分，因此湿度维持在一个相对较低的水平。以撒哈拉沙漠的数据作为代表，其每典型的日温度变化为0摄氏度到40摄氏度，相对湿度保持在10%左右。我们以40摄氏度作为初始温度，等到Decomposizion Rate 稳定时，将温度突然改变为10摄氏度，以模拟干旱环境中的极端气候影响。在图中可以看出，土地上只有一种真菌时，其值

### In Semi-arid Environment

In the semi-arid environment, the annual precipitation is usually between 10 and 20 inches, so the humidity is at a low level. Temperature in semi-arid areas varies with latitude. We take Yuma, Arizona as an example. The temperature in Yuma is about 15 ℃ in winter and 32 ℃ in summer; the relative humidity is about 0% in winter and 30% in summer.

在半干旱环境中，年降水量通常在10-20inches 之间，因此湿度处于较低的水平。半干旱地区的温度随纬度不同而不同，我们选取了Arizona州的Yuma作为例子，其温度冬季约为15摄氏度，夏季约为32摄氏度；相对湿度冬季约为0%，夏季约为30%。我们

https://weatherspark.com/y/2266/Average-Weather-in-Yuma-Arizona-United-States-Year-Round

### In Temperate Environment

Area in temperate have an average temperature above 10 °C in their warmest months, and a coldest month average between −3 °C and 18 °C. Take New York City as example, the average temperature from April to September is 15 ℃, and the average temperature in other months is 5 ℃. The relative humidity remains at about 60%. 

### In Arboreal Environment

In arboreal, the average temperature is relatively higher than temperate. So we choose temperatures varies from 15 ℃ to 30 ℃, and the relative humidity remains at about 60%. 

### In Tropical Rain Forest Environment

Port Moresby is a  typical tropical rainforest climate city. The temperature in Port Moresby is around 27°C in all time, and relative humidity remains at about 77%.

## Inplementation - The Impact of Diversity Index

According to the previous analysis, it can be found that the more species, the more TDR. However, species diversity is affected not only by the number, but also by the distribution of species. Therefore, DI  is used to measure species diversity, more specific, diversity of fungal communities. We selected data of 34 fungal species and calculated $N_i$, the stable number of each fungus in the possible combination under five environmental conditions mentioned in previous section. According to the above data, the corresponding DI and TDR can be obtained, as shown in Fig2. It can be seen that when DI is small, the growth rate of TDR is big. With the increase of DI (generally caused by the increase of fungal communities number), the growth rate of TDR gradually slows down. Although DI is positively correlated with TDR, when the $n$ reaches a certain level, newly added fungal species can not improve the efficiency of the whole system a lot. The role of species diversity decreases.

根据前文的分析，可以发现在环境一定的情况下，物种数量越多，TDR越大。但物种多样性不仅受物种数量的影响，还受到物种数量分布的影响。因此这里采用模型中的DI来衡量物种多样性。我们选用34种真菌的数据，在5.2部分中提到的五种环境条件下，将其可能组合中每种真菌的稳定数量进行计算。根据上述数据可以得到对应的DI和TDR，如Fig2所示。可以看到，当DI较小时，TDR增长速度较快；但随着物种丰富度的增加（一般是物种数量的增加而导致），TDR的增长速率逐渐放缓。这说虽然DI与TDR呈正相关，但是物种数量到达一定程度后，新增加的物种并不能使的整个系统的效率提高很多，物种多样性的作用程度下降。

![1](/Users/scott/Desktop/1.png)

# Sensitivity Analysis

DRF Model 参数有很多，但是大部分参数的影响已经在前文中叙述。由图1.1可知，模型中呢独立的参数主要有Moisture Niche Width， Competitive Ranking， Environmental Capacity， 以及环境变量Temperature and Moisture。其中，Moisture Niche Width和Competitive Ranking的影响（即不同物种的影响）在Chapter 5中已经讨论，因此本章主要考虑Environmental Capacity以及微小温度、湿度变化对于模型的影响。

## Environmental Capacity

假设环境温度25摄氏度、湿度60%，考察当环境不发生变化，5个种群共处时，选择其中两个的环境容纳量进行最大10%的改变，计算稳定时间、稳定值的变化情况。由图1可以看出，当初始值变化在10%以内时，达到的稳定值的时间变化率均在10%以内。图2展示了初始值变化在10%以内时，种群最终达到的稳定值变化率在5%以内。

## Temperature and Humidity

假设环境温度25摄氏度、湿度60%，5个种群共处时，考察温度和湿度的变化对于TDR的影响。可以看到当温度和湿度分别改变10%以内时，







