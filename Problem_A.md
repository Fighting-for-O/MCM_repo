# Requirement

- Build a mathematical model that describes **the breakdown of ground litter and woody fibers through fungal activity** in the presence of **multiple species of fungi**.
- In your model, incorporate the interactions between **different species of fungi**, which have **different growth rates** and **different moisture tolerances** as shown in Figures 1 and 2.
- Provide an analysis of the model and **describe the interactions between the different types of fungi**. The dynamics of the interactions should be characterized and described including both **short- and long-term trends**. Your analysis should examine the **sensitivity to rapid fluctuations** in the environment, and you should determine the overall impact of **changing atmospheric trends** to assess the impact of variation of local weather patterns.
- Include predictions about the **relative advantages and disadvantages** for each species and combinations of species likely to persist, and do so for different environments including **arid, semi-arid, temperate, arboreal, and tropical rain forests**.
- Describe how the diversity of fungal communities of a system impacts the overall efficiency of a system with respect to the breakdown of ground litter. Predict the importance and role of **biodiversity** in the presence of different degrees of variability in the local environment.

- 数学模型：描述固定地区真菌对地面凋落物和木质纤维等的影响，不同类真菌之间短时间和长时间的作用，对环境变量进行敏感度分析

- 变量：真菌种类---->生长率&耐潮湿度，环境变量--->湿度，

- 因变量：分解速率

- 自变量：

  - 真菌类型

    

    

    ```mermaid
    graph LR
    
    A[方形] -->B(圆角)
    
      B --> C{条件a}
    
      C -->|a=1| D[结果1]
    
      C -->|a=2| E[结果2]
    
      F[横向流程图]
      
    ```

# Models

## 人口模型

P163

$\frac{\partial p}{\partial r}+\frac{\partial p}{\partial t}=-\mu(r,t)p(r,t)$

## 种群的竞争

$\dot{x}_1 = r_1x_1(1-\frac{x_1}{N_1}-\sigma_1\frac{x_2}{N_2})$

## Our Model

### Parameters

| Name                             | Symbol       |
| -------------------------------- | ------------ |
| Growth rate                      | $GR$         |
| Decomposition rate of whole area | $DR_{whole}$ |
| Decomposition rate of a fungus   | $DR$         |
| Moisture                         | $M$          |
| Temperature                      | $T$          |
| Number of fungus                 | $N$          |
| Moisture Tolearnce               | $MT$         |
|                                  |              |
|                                  |              |
|                                  |              |
|                                  |              |

### Models

$DR_{whole}= \sum_{i}{DR_iN_i}$

#### Logistic Models

$\dot{N}_i = r_iN_i(1-\frac{N_i}{N_{i\max}}+\sum_{j\neq i}{k_{ij}\frac{N_j}{N_{j\,max}}})$

$r_i = r_0(2\pi\sigma_M\sigma_T\sqrt{1-\rho^2})^{-1}\exp[\frac{1}{2\pi\sigma_M\sigma_T\sqrt{(1-\rho^2)}}(\frac{(M-M_0)^2}{\sigma_M^2}+\frac{(T-T_0)^2}{\sigma_T^2}-\frac{2\rho(M-M_0)(T-T_0)}{\sigma_T\sigma_M})]$

In simple model, $k_{ij} = 1/k_{ji}$, they are decided by our judgement

In upper model, $k_{ij} = f(M,T,MT_i,GR_i,MT_j,GR_j)$

##### Question

$N_{i\max}$

$r_0,\sigma_M,\sigma_T,\rho, M_0,T_0$

$k_{ij} = f(M,T,MT_i,GR_i,MT_j,GR_j)$

#### DR Models

$DR_i = f_1(T)f_2(M) = c_1Te^{-\frac{c_2}{T}}\times (c_3M^2+c_4M+c_5)$

$GR_i,MT_i$ originate from $DR_i$

https://www.researchgate.net/profile/Charles_Lee14/publication/5991613_The_effect_of_temperature_on_enzyme_activity_New_insights_and_their_implications/links/00b49530d220e32e07000000.pdf

http://lawr.ucdavis.edu/classes/ssc219/biogeo/decomp.htm

#### Question

#### Choices

$V_{\max} = k_{cat}[E_0]e^{-k_{incat}t}$

$k_{cat} = \frac{k_bT}{h}e^{-\frac{\Delta G_{cat}}{RT}}$

$k_{inact} = \frac{k_bT}{h}e^{-\frac{\Delta G_{inact}}{RT}}$



### Names

Fungus(single),fungi(multiple)



土壤温度和含水量是影响分解速率的重要因素。在有利的湿度条件下，温度升高导致分解率呈指数增长（Q10约为2）。在恒温条件下，土壤含水量对分解速率的影响呈抛物线型，在中等含水量条件下分解速率最大。高含水量限制了土壤气体交换，从而导致低氧浓度和潜在的厌氧条件。在低水分条件下，水分的缺乏限制了微生物的代谢；然而，许多微生物可以保持活性，使土壤水势（在-3.0MPa时）比植物（在-1.5MPa时）低得多。除了温度和湿度条件外，极端土壤酸度（pH值<4或>9）也可能严重降低分解速率。





