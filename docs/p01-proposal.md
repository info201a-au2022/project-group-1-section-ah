# Asian Countries and The Change in Population Throughout the Years

## CODE NAME
asian_pop
## By Kai Andreic (kandreic@uw.edu), Yoobin Lee (yl0517@uw.edu), Tom Sander (tjsander@uw.edu), and Ethan Kim (doogyoo@uw.edu)
Affiliation: INFO-201: Technical Foundations of Informatics - The Information School - University of Washington Date: Autumn 2022

### **Abstract**
We are concerned with both the growing and declining population of Asia. Without a proper balance in the birth and death rates, multiple nations could potentially face large issues in the near future. To address this concern, we plan to gather the data of population, birthrate, and deathrate across all nations in Asia, then generate a visual representation to emphasize the severity.
### **Keywords**
Population, Asia, Increase, Decrease, Change
### **Introduction**
Population has always been an issue for many Asian countries. For example, India and China always had their issues with a large growing population compared to Japan that has a major problem with their decreasing population. This project is set to cover all of the population change that has happened throughout all 51 countries that are in Asia and why they are experiencing a growth or decline. Having this type of information is important to study and understand all issues that some Asian countries are having in their respective countries. So this project should show each country's population throughout the years, what countries have grown or declined, why they have either grown or declined, and finally the UN’s population expectancy in the future years.

### **Problem Domain**
#### **Project Framing**
Our topic of study is the population dynamics of Asian countries. Our goal is to investigate the characteristics of growing countries, shrinking countries, and
stable countries in order to gain insight on what factors influence the rate of
growth of countries. For example, we will investigate the bearing of poverty rates on
fertility rates, controlling for unemployment rate. Key elements include fertility rates,
population growth and shrinkage, HDI, and [inequality](https://ijp.mums.ac.ir/article_7680_7828694c3909aa70d156fb9c8a2cb9ed.pdf).
#### **Human Values**
The primary value that we hope to embody with this project is compassion. The
goal of data science is retrieval, agglomeration and presentation of information, while a
major goal of data feminism is to ensure that human experiences aren't condensed
and made into meaningless data. We hope to investigate the sociotechnical climate
of these countries without otherizing their people by reflecting on the underlying lived experiences that culminate in the data we analyze. Similarly, we hope to investigate power - the way regionally distinct systems of social organization impact peoples lives, especially with regard to fertility rates.
#### **Stakeholders**
The _direct stakeholders_ would be anyone who would access and employ
the datasets and visualizations we put together. Hypothetically if our project
were to be used by a public policy administrator in a country concerned about
its own population dynamics, or by an NGO with the same motivations, those people
would be the primary stakeholders of this tool. Conversely, _indirect stakeholders_
would be anyone impacted by the usage of this data by the aforementioned interest
groups; because this is macro-level data concerned with large-scale population
health, it's not inconceivable that the entire population of the given country
could be considered an indirect stakeholder.
#### **Possible Harms**
Birth rates are absolutely not apolitical, and raising and lowering birthrates
has been the motivation of acts of incredible literal and systematic violence. In
the US, lowering birthrates was one strong argument wielded by pro-life
movement supporters, eventually culminating in the Supreme Court reversal of
Roe v. Wade. White supremacists in North America and Europe consistently
use falling white birthrates as proof that white people are "being replaced",
[which fuels their campaigns of racialized terrorism.](https://www.law.berkeley.edu/php-programs/centers/crrj/zotero/loadfile.php?entity_key=2K2QA27B) In China, fears of overpopulation
led to the adoption of the One-Child policy, which was used as an instrument
of severe state repression. Worldwide, birthrates are objects of intense political
focus, and it's our hope that our data - presented and visualized neutrally - does
not inspire such acts.
#### **Benefits**
Being neutral, this birth rate data can ideally be used for good as well. A better
understanding of what drives population dynamics can help policymakers to use
productive and beneficial policies when influencing their populations; for example,
understanding the [demographic transition](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2781829/)
model of population dynamics could inspire adoption of tactics like increased
women's rights, access to contraceptives, and increased funding for education
as productive alternatives to the heavy-handed, oppressive approaches listed in
the section above.
#### **Example figure**
![A graph of birth rates in China over time, from 1960 to 2014. Starting at around
6 children/mother in the mid-1960's, the birth rate gradually dropped to around
2.5/mother in 1980, at the point the One-Child policy was enacted. Rates plateaued
around 2.5 children/mother for a decade, before dropping to plateau at 1.5 until
the present day.](docs/China_OCP_Graph.PNG)

### **Research Questions**
1. Which countries are facing the most issues currently or in the near future from population increase/decrease? This is important because the data from those countries could set precedents for similar issues in the future.
2. What are common factors of nations that have the highest birth/death rate incline/decline? Which factors seem to have the biggest impact? This is important to understand the source of the issue, and the areas to focus on when resolving the issue.
3. Is there a general trend among all nations? If so, what are the trends, and if not, what is causing all the difference? This question will allow us to categorize and group up countries into some sections and provide a more generalized visualization and analysis.
4. Based on future projections, what are some necessary changes or suggestions to be made? This draws out a possible suggestion from the analysis made.

### **The Dataset**
1. We aim to study both growing and declining populations amongst Asian countries. Our dataset contains a great deal of statistics about populations and their changes over time in many countries, including Asian ones. We aim to study the populations change alongside other factors and informations in order to formulate conclusions and find solutions. Our dataset allows us to answer our research questions through statistical analysis and comparisons with other nations who have positive trends. Looking at nations on decline and looking at nations which are growing and making contrasts will allow us to formulate good conclusions A main goal is to find solutions and changes in order to specifically combat declining populations as a population in decline is a nation in decline.  
2.
|Data File | Number of Observations | Number of Variables|
|---------------| --------------| --------------
|TheGlobalEconomy.csv| 3151 Observations |14 Variables|

3. “Compare Countries.” TheGlobalEconomy.com, https://www.theglobaleconomy.com/compare-countries/.
4. (a) The data was initially collected by the United Nations Population Division with the earliest data coming from 1960, and the latest coming from 2021. The United Nations Population Division is a subdivision of the Department of Economic and Social Affairs. They conduct research on demographics, support processes which are intergovernmental and which pertain to development and population in the United Nations, and assist nations to develop, produce, and analyze population data. This data in specific was collected for a multitude of purposes as this data is extremely versatile. (b) This data was funded by the United Nations. The UN collects funding in two ways; assessed contributions and voluntary contributions. Assessed contributions to the UN are required for all member nations, and voluntary contributions are completely optional donations. This data likely benefits all member nations, with a specific emphasis on nations which are currently struggling with population growth or decline. (c) The data is validated and held secure by an entire team at the United Nations. The United Nations Population Division often conducts research and collects data in order to service the people of the member nations. It is extremely credible and trustworthy as this data influences many nations across the globe. The UN cannot utilize data which can even be considered fraudulent as it would affect foreign policy to a grand degree. (d) The data was obtained through a site called TheGlobalEconomy.com, which carefully selects data from the some of the most credible sources in the world. The data itself cannot be credited to the website, as it was collected by the United Nations, but the site gathers a plethora of important information and makes it easily accessible for those that need it.

### **Expected Implications**
In the event that all of our research questions are answered, there are many implications that those with power need to make. In countries that are struggling with population, policymakers and others will likely have to challenge cultural norms in order to combat the rapid declines. Changing cultural norms allows for citizens to completely reform their ideologies about their own nations and what it means to have a family, therefore inspiring growth within their own borders. Alongside this, those in power will have to make it a strong priority to influence economic growth. With economic growth typically comes an increase in population. More housing and facilities of all kinds are also needed, especially in areas where population is in a strong decline. A population cannot grow without places to house the population. Alongside this a population cannot thrive without infrastructure to support it. In modern day, people need schools and healthcare amongst other things essentially to live.

### **Limitations**
Some limiations we need to address are that aside from the data collected and visualized, which are also estimates, a lot of our analysis will be based on prediction. The subject of our research relies heavily on assumption or an educated guess at best. For example, since surveying the entire population for the reason for their choice on to have a child or not is impossible, we study their culture, religion, ethics, and etc, to make an educated guess backed with evidence. Another limitation is that historical events will affect our data analysis. Events like plagues, wars, or any other event that impacted population count can all potentially somewhat skew our data. We will attempt to do our best in identifying those outliers, but it is near impossible to filter all of it.
### **Acknowledgements**
### References
* “World Population 1950-2022.” MacroTrends, https://www.macrotrends.net/countries/WLD/world/population.  *(found all population datasets)*
* S, Sandhya. “Asian Countries by Population.” Kaggle, 26 May 2022, https://www.kaggle.com/datasets/sansuthi/asian-countries-by-population?resource=download.
* “Compare Countries.” TheGlobalEconomy.com, https://www.theglobaleconomy.com/compare-countries/.
### Questions for TA
