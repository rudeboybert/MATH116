
---
  title: "Final Project"
author: "Theo Henderson and Will Perry"
date: "Sunday December 18th, 2016"
output: html_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

# Load all necessary packages here
library(ggplot2)
library(dplyr)
library(mosaic)
```





## Unemployment and Migration in the United States

Write your main article here i.e. the part that will show in print or online.
If you are interested in formatting tips, go to RStudio Menu Bar -> Help -> 
  Markdown Quick Reference

The relationship between unemployment and migration is a highly contested political issue that has 

```{r, message=FALSE, warning=FALSE, fig.width=8, fig.height=4.5, echo=FALSE}
census <- read.csv("/home/tahenderson/Final Project Math 116 Will Perry and Theodore Henderson/2000-2015 movement.csv")

census %>% 
  ggplot(aes(x=year,y=unemployment,group=1))+geom_line()+facet_wrap(~region)

census %>% 
  ggplot(aes(x=year,y=outmigrants,group=1))+geom_line()+facet_wrap(~region)+geom_smooth(se=FALSE, span=0.5)

census %>% 
  ggplot(aes(x=year,y=inmigrants,group=1))+geom_line()+facet_wrap(~region)+geom_smooth(se=FALSE, span=0.5)

census %>% 
  ggplot(aes(x=year,y=net_migration,group=1))+geom_line()+facet_wrap(~region)+geom_smooth(se=FALSE, span=0.5)
```



```{r, message=FALSE, warning=FALSE, fig.width=8, fig.height=4.5, echo=FALSE}

```



```{r, message=FALSE, warning=FALSE, fig.width=8, fig.height=4.5, echo=FALSE}
# Copy this blank code block as many times as you need. Note, if you want to
# code to show in your HTML files, set echo=TRUE above.

```











```{r, message=FALSE, warning=FALSE, fig.width=8, fig.height=4.5, echo=FALSE}
# Copy this blank code block as many times as you need. Note, if you want to
# code to show in your HTML files, set echo=TRUE above.

```




## Supplementary Materials

This is an outline of the methods we used to create our article, including data, collection, manipulation, and the hypothesis tests we completed to write our article.


We obtained the data for movement off of https://www.census.gov. However, the data was not in tidy format. We cleaned it by making both region and year variable so that they had thir own collumns. Then, we obtained the unemployment data from Quandle. These data sets were separated by the same census regions used in the movemnt data, so it was easy to combine the two data sets. Once we combined the two data sets into one in Excel, we uploaded it to R and have further manipulated the data by using the 5 main verbs.   


First we created data sets for each of the regions by filtering by region. We also calculated the percent_difference from year to year in unemployment,inmigrants, outmigrants, and net_migration. These values were then used to calculate the abosolute difference between percent_difference in unemployment and percent_difference in each of the three migration metrics.
```{r, message=FALSE, warning=FALSE, fig.width=8, fig.height=4.5, echo=TRUE}

midwest<-census %>%
  filter(region=="midwest") %>% 
  select(-net_internal_migration,-movers_from_abroad) %>% 
  mutate(unemployment_percent_diff=((lead(unemployment)-lag(unemployment))/(lag(unemployment))*100))%>% 
  mutate(inmigrants_percent_diff=((lead(inmigrants)-lag(inmigrants))/(lag(inmigrants))*100)) %>%
  mutate(outmigrants_percent_diff=((lead(outmigrants)-lag(outmigrants))/(lag(outmigrants))*100)) %>% 
  mutate(net_migration_percent_diff=((lead(net_migration)-lag(net_migration))/(lag(net_migration))*100)) %>% 
  mutate(unemployment_in_difference=unemployment_percent_diff-inmigrants_percent_diff) %>% 
  mutate(unemployment_out_difference=unemployment_percent_diff-outmigrants_percent_diff) %>% 
  mutate(unemployment_net_difference=unemployment_percent_diff-net_migration_percent_diff)

south<-census %>%
  filter(region=="south") %>% 
  select(-net_internal_migration,-movers_from_abroad) %>% 
  mutate(unemployment_percent_diff=((lead(unemployment)-lag(unemployment))/(lag(unemployment))*100))%>% 
  mutate(inmigrants_percent_diff=((lead(inmigrants)-lag(inmigrants))/(lag(inmigrants))*100)) %>%
  mutate(outmigrants_percent_diff=((lead(outmigrants)-lag(outmigrants))/(lag(outmigrants))*100)) %>% 
  mutate(net_migration_percent_diff=((lead(net_migration)-lag(net_migration))/(lag(net_migration))*100)) %>% 
  mutate(unemployment_in_difference=unemployment_percent_diff-inmigrants_percent_diff) %>% 
  mutate(unemployment_out_difference=unemployment_percent_diff-outmigrants_percent_diff) %>% 
  mutate(unemployment_net_difference=unemployment_percent_diff-net_migration_percent_diff)

northeast<-census %>%
  filter(region=="northeast") %>% 
  select(-net_internal_migration,-movers_from_abroad) %>% 
  mutate(unemployment_percent_diff=((lead(unemployment)-lag(unemployment))/(lag(unemployment))*100))%>% 
  mutate(inmigrants_percent_diff=((lead(inmigrants)-lag(inmigrants))/(lag(inmigrants))*100)) %>%
  mutate(outmigrants_percent_diff=((lead(outmigrants)-lag(outmigrants))/(lag(outmigrants))*100)) %>% 
  mutate(net_migration_percent_diff=((lead(net_migration)-lag(net_migration))/(lag(net_migration))*100)) %>% 
  mutate(unemployment_in_difference=unemployment_percent_diff-inmigrants_percent_diff) %>% 
  mutate(unemployment_out_difference=unemployment_percent_diff-outmigrants_percent_diff) %>% 
  mutate(unemployment_net_difference=unemployment_percent_diff-net_migration_percent_diff)

west<-census %>%
  filter(region=="west") %>% 
  select(-net_internal_migration,-movers_from_abroad) %>% 
  mutate(unemployment_percent_diff=((lead(unemployment)-lag(unemployment))/(lag(unemployment))*100))%>% 
  mutate(inmigrants_percent_diff=((lead(inmigrants)-lag(inmigrants))/(lag(inmigrants))*100)) %>%
  mutate(outmigrants_percent_diff=((lead(outmigrants)-lag(outmigrants))/(lag(outmigrants))*100)) %>% 
  mutate(net_migration_percent_diff=((lead(net_migration)-lag(net_migration))/(lag(net_migration))*100)) %>% 
  mutate(unemployment_in_difference=unemployment_percent_diff-inmigrants_percent_diff) %>% 
  mutate(unemployment_out_difference=unemployment_percent_diff-outmigrants_percent_diff) %>% 
  mutate(unemployment_net_difference=unemployment_percent_diff-net_migration_percent_diff)
```



The unemployment_in_difference, unemployment_out_difference, and unemployment_net_difference prepared the data for hypothesis tests exploring whether unemployment varries with any of the three migration metrics. Our exploratory data analysis can be seen above in the four graphs facet_wrapped by region, all of which suggest that the relationships warrent further analysis.

Midwest Hypothesis Tests
```{r, message=FALSE, warning=FALSE, fig.width=8, fig.height=4.5, echo=TRUE}
midwest1<-midwest %>% 
  summarise(average_diff_unemployment_in=mean(unemployment_in_difference,na.rm=TRUE)) 

simulations1 <- do(10) * midwest1 %>% 
  mutate(sample_diff=unemployment_percent_diff - shuffle(inmigrants_percent_diff)) %>% 
  summarise(sample_diff_mean=mean(sample_diff,na.rm=TRUE)) 

ggplot(data=simulations1,aes(x=sample_diff_mean))+geom_histogram(bins=10)+geom_vline(xintercept = average_diff_unemployment_in, col="red")

midwest2<-midwest %>% 
  summarise(average_diff_unemployment_out=mean(unemployment_out_difference,na.rm=TRUE)) 

simulations2 <- do(10) * midwest2 %>% 
  mutate(sample_diff=unemployment_percent_diff - shuffle(outmigrants_percent_diff)) %>% 
  summarise(sample_diff_mean=mean(sample_diff,na.rm=TRUE)) 

ggplot(data=simulations2,aes(x=sample_diff_mean))+geom_histogram(bins=10)+geom_vline(xintercept = average_diff_unemployment_out, col="red")

midwest3<-midwest %>% 
  summarise(average_diff_unemployment_net=mean(unemployment_net_difference,na.rm=TRUE))

simulations3<- do(10) * midwest3 %>% 
  mutate(sample_diff=unemployment_percent_diff - shuffle(net_migration_percent_diff)) %>% 
  summarise(sample_diff_mean=mean(sample_diff,na.rm=TRUE)) 

ggplot(data=simulations3,aes(x=sample_diff_mean))+geom_histogram(bins=10)+geom_vline(xintercept = average_diff_unemployment_net, col="red")

```

South Hypothesis Tests
```{r, message=FALSE, warning=FALSE, fig.width=8, fig.height=4.5, echo=TRUE}
south1<-south %>% 
  summarise(average_diff_unemployment_in=mean(unemployment_in_difference,na.rm=TRUE)) 

simulations4 <- do(10) * south1 %>% 
  mutate(sample_diff=unemployment_percent_diff - shuffle(inmigrants_percent_diff)) %>% 
  summarise(sample_diff_mean=mean(sample_diff,na.rm=TRUE)) 

ggplot(data=simulations4,aes(x=sample_diff_mean))+geom_histogram(bins=10)+geom_vline(xintercept = average_diff_unemployment_in, col="red")

south2<-south %>% 
  summarise(average_diff_unemployment_out=mean(unemployment_out_difference,na.rm=TRUE)) 

simulations5 <- do(10) * south2 %>% 
  mutate(sample_diff=unemployment_percent_diff - shuffle(outmigrants_percent_diff)) %>% 
  summarise(sample_diff_mean=mean(sample_diff,na.rm=TRUE)) 

ggplot(data=simulations5,aes(x=sample_diff_mean))+geom_histogram(bins=10)+geom_vline(xintercept = average_diff_unemployment_out, col="red")

south3<-south %>% 
  summarise(average_diff_unemployment_net=mean(unemployment_net_difference,na.rm=TRUE))

simulations6<- do(10) * south3 %>% 
  mutate(sample_diff=unemployment_percent_diff - shuffle(net_migration_percent_diff)) %>% 
  summarise(sample_diff_mean=mean(sample_diff,na.rm=TRUE)) 

ggplot(data=simulations6,aes(x=sample_diff_mean))+geom_histogram(bins=10)+geom_vline(xintercept = average_diff_unemployment_net, col="red")

```

Northeast Hypothesis Tests
```{r, message=FALSE, warning=FALSE, fig.width=8, fig.height=4.5, echo=TRUE}
northeast1<-northeast %>% 
  summarise(average_diff_unemployment_in=mean(unemployment_in_difference,na.rm=TRUE)) 

simulations7 <- do(10) * northeast1 %>% 
  mutate(sample_diff=unemployment_percent_diff - shuffle(inmigrants_percent_diff)) %>% 
  summarise(sample_diff_mean=mean(sample_diff,na.rm=TRUE)) 

ggplot(data=simulations7,aes(x=sample_diff_mean))+geom_histogram(bins=10)+geom_vline(xintercept = average_diff_unemployment_in, col="red")

northeast2<-northeast %>% 
  summarise(average_diff_unemployment_out=mean(unemployment_out_difference,na.rm=TRUE)) 

simulations8 <- do(10) * northeast2 %>% 
  mutate(sample_diff=unemployment_percent_diff - shuffle(outmigrants_percent_diff)) %>% 
  summarise(sample_diff_mean=mean(sample_diff,na.rm=TRUE)) 

ggplot(data=simulations8,aes(x=sample_diff_mean))+geom_histogram(bins=10)+geom_vline(xintercept = average_diff_unemployment_out, col="red")

northeast3<-northeast %>% 
  summarise(average_diff_unemployment_net=mean(unemployment_net_difference,na.rm=TRUE))

simulations9<- do(10) * northeast3 %>% 
  mutate(sample_diff=unemployment_percent_diff - shuffle(net_migration_percent_diff)) %>% 
  summarise(sample_diff_mean=mean(sample_diff,na.rm=TRUE)) 

ggplot(data=simulations9,aes(x=sample_diff_mean))+geom_histogram(bins=10)+geom_vline(xintercept = average_diff_unemployment_net, col="red")

```

West Hypothesis Tests
```{r, message=FALSE, warning=FALSE, fig.width=8, fig.height=4.5, echo=TRUE}
west1<-west %>% 
  summarise(average_diff_unemployment_in=mean(unemployment_in_difference,na.rm=TRUE))

simulations10 <- do(10) * west1 %>% 
  mutate(sample_diff=unemployment_percent_diff - shuffle(inmigrants_percent_diff)) %>% 
  summarise(sample_diff_mean=mean(sample_diff,na.rm=TRUE)) 

ggplot(data=simulations10,aes(x=sample_diff_mean))+geom_histogram(bins=10)+geom_vline(xintercept = average_diff_unemployment_in, col="red")

west2<-west %>% 
  summarise(average_diff_unemployment_out=mean(unemployment_out_difference,na.rm=TRUE))

simulations11 <- do(10) * west2 %>% 
  mutate(sample_diff=unemployment_percent_diff - shuffle(outmigrants_percent_diff)) %>% 
  summarise(sample_diff_mean=mean(sample_diff,na.rm=TRUE)) 

ggplot(data=simulations11,aes(x=sample_diff_mean))+geom_histogram(bins=10)+geom_vline(xintercept = average_diff_unemployment_out, col="red")

west3<-west %>% 
  summarise(average_diff_unemployment_net=mean(unemployment_net_difference,na.rm=TRUE))

simulations12<- do(10) * west3 %>% 
  mutate(sample_diff=unemployment_percent_diff - shuffle(net_migration_percent_diff)) %>% 
  summarise(sample_diff_mean=mean(sample_diff,na.rm=TRUE)) 

ggplot(data=simulations12,aes(x=sample_diff_mean))+geom_histogram(bins=10)+geom_vline(xintercept = average_diff_unemployment_net, col="red")

```




