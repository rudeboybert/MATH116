```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

# Load all necessary packages here
library(ggplot2)
library(dplyr)
library(mosaic)
library(lubridate)
library(knitr)
Stowe.Snowfall <- read.csv("~/problem_sets/Stowe Snowfall.csv")
Killington.Snowfall <- read.csv("~/problem_sets/Killington Snowfall.csv")
Sugarbush.Snowfall <- read.csv("~/problem_sets/Sugarbush Snowfall.csv")


Killington <- read.csv("/home/skonanc/problem_sets/Killington Snowfall.csv") %>% 
  mutate(resort="Killington")
Stowe <- read.csv("/home/skonanc/problem_sets/Stowe Snowfall.csv") %>% 
  mutate(resort="Stowe")
Sugarbush <- read.csv("/home/skonanc/problem_sets/Sugarbush Snowfall.csv") %>% 
  mutate(resort="Sugarbush")
January_weather <- read.csv("/home/skonanc/problem_sets/January_weather.csv")
elnino <- read.csv("/home/skonanc/problem_sets/elnino.csv")
ifelse(Year == 2010, TRUE, FALSE)
ggplot(January_snowfall, aes(x=date, y=Snowfall, color=resort)) +
  geom_point() +
  geom_smooth(span=0.75, se=FALSE)
winter_snowfall <- snowfall %>% filter(Month=="October" | Month=="November" | Month=="December" | Month=="January" | Month=="February" | Month=="March" | Month=="April")
January_snowfall <- snowfall %>% filter(Month=="January")
snowfall <- bind_rows(Killington, Stowe, Sugarbush) %>% 
  as_data_frame() %>% 
  mutate(
    Month = as.character(Month), 
    Day = "01",
    date = paste(Year, Month, Day, sep="-")
  ) %>% 
  mutate(date = lubridate::parse_date_time(date, "Y-Om!-d"))
January_snowfall <- January_snowfall %>% 
  as_data_frame() %>% 
  mutate(
    Month = as.character(Month), 
    Day = "01",
    date = paste(Year, Month, Day, sep="-")
  ) %>% 
  mutate(date = lubridate::parse_date_time(date, "Y-Om!-d"))
January_weather <- January_weather %>% 
  as_data_frame() %>% 
  mutate(
    Month = as.character(Month), 
    Day = "01",
    date = paste(Year, Month, Day, sep="-")
  ) %>% 
  mutate(date = lubridate::parse_date_time(date, "Y-Om!-d"))
January <- left_join(January_snowfall, January_weather, by = c("Month", "Year", "resort", "Day", "date"))

elnino <- elnino %>% 
  as_data_frame() %>% 
  mutate(
    Month = as.character(Month), 
    Day = "01",
    date = paste(Year, Month, Day, sep="-")
  ) %>% 
  mutate(date = lubridate::parse_date_time(date, "Y-Om!-d"))

elninoallseason <- left_join(winter_snowfall, elnino, by = c("Month", "Year", "Day", "date"))
elninoJanuary <- elnino %>% filter(Month=="January")
January <- left_join(January, elninoJanuary, by = c("Month", "Year", "Day", "date"))
ggplot(data=elninoallseason, aes(x=La.Nina, y=Snowfall)) +
  geom_boxplot() + facet_wrap(~resort)
ggplot(data=elninoallseason, aes(x=El.Nino, y = Snowfall)) + geom_boxplot() + facet_wrap(~resort)

observed_diff <- mean(Snowfall ~ La.Nina, data=elninoallseasons) %>% diff()

# Simulate the null distribution of the test statistic:
simulations <- do(10000) * mean(Snowfall ~ shuffle(La.Nina), data=elninoallseasons)
simulations <- simulations %>%
  as_data_frame() %>% 
  mutate(difference=FALSE-TRUE)

# Compare what we observed (red) to what happens if we assume no difference:
ggplot(data=simulations , aes(x=difference)) +
  geom_histogram() +
  geom_vline(xintercept = observed_diff, col="red") +
  geom_vline(xintercept = 0, linetype="dashed") +
  labs(x="Difference: Odd Avg - Even Avg")
```





## Main Article
For the discerning powder hounds among us,  Many factors go into determining where Middlebury students choose to ski: proximity to campus, the price of lift passes, and childhood experience, to name a few. Students often frequent Killington, Sugarbush, and Stowe, so we analyzed data for those three mountains to help Middlebury students choose where to ski. While you might not value data over your emotional ties to a particular mountain... 

We will examine historical average snowfall data for three ski resorts frequented by MiddKids and use regression to forecast where you should ski this year. Midd students have their pick of ski mountains, so we would like to help them choose where to best spend their money and time. Based on historical snowfall data, which ski mountain is likely to get the most snow this year? We will have three tables for Killington, Sugarbush, and Stowe. Depending on if we get average or total snowfall data, each table will have the variables month or year and average snowfall in inches. The observational unit is amount of snowfall for a month of a given year. The years we examine will depend on the data we receive from snow-reports.weatherdb.com.
https://snow-reports.weatherdb.com/l/1617/Stowe-Mountain-Resort#annual%20climate&s=3A77ht&st=uQ5E6b
We will use regression lines to forecast how much snow might be in store for each of the three resorts this season. In our additional data section, we will talk about how La Nina may be a confounding variable for this year's snowfall.
```{r, message=FALSE, warning=FALSE, fig.width=8, fig.height=4.5, echo=FALSE}
# Copy this blank code block as many times as you need. Note, if you want to
# code to show in your HTML files, set echo=TRUE above.
ggplot(January, aes(x=Year, y=Snowfall, color=resort)) +
geom_line()
ggplot(January, aes(x=Year, y=Snowfall, color=resort)) +
geom_point() +
geom_smooth(span=0.6, se=FALSE)
ggplot(January, aes(x=resort, y=Snowfall)) +
geom_boxplot()
ggplot(January, aes(x=Year, y=Snowfall, color=El.Nino)) +
geom_bar(stat = "identity") +


ggplot(january, aes(x=Year, fill=resort)) +
geom_bar(position = "dodge")
ggplot(January, aes(x=Year, y=Snowfall, fill=resort)) +
geom_bar(stat ="identity", position = "dodge")
ggplot(January, aes(x=Year, y=Snowfall, color=El.Nino)) +
geom_bar(stat = "identity") +
facet_wrap()

```



```{r, message=FALSE, warning=FALSE, fig.width=8, fig.height=4.5, echo=FALSE}



```



## Supplementary Materials

In addition to the factors that typically affect snowfall, meteorologists predict La Nina will enter into the mix this winter. The term La Nina describes the phenomenon when temperatures in the Pacific Ocean near the equator become cooler than normal by more than 0.5 degrees C. The temperature change affects where the most air evaporates, which changes the location of the jetstream. The jetstream influences where storms will occur, and consequently how much snow different parts of the world receive. For the United States, La Nina usually causes the jetstream and storm track to shift north and more snow to fall in the country's northern third. However, this season's La Nina is expected to be weak to moderate, meaning its effect will be lessened and probably not the determining factor in where you choose to ski in Vermont. Vermont is also a small state. If La Nina were the main determining factor in snowfall or strong this year, you might find more snow the farther north you go, but snow storms also crop up due to somewhat random, unpredictable factors. If you had a wider variety of options, your best bet for above-average snowfall in a La Nina year would be the Pacific Northwest because of this year's jetstream trajectory.

Sources: 
http://www.cpc.noaa.gov/products/analysis_monitoring/ensostuff/ensoyears.shtml
https://www.wunderground.com/history/airport/KMVL/2009/12/14/MonthlyHistory.html?req_city=Morrisville&req_state=VT&req_statename=&reqdb.zip=05672&reqdb.magic=2&reqdb.wmo=99999&MR=1
http://www.onthesnow.com/news/a/584883/how-does-la-niña-drive-snowfall-in-u-s--
http://www.onthesnow.com/news/a/620741/what-la-niña-has-in-store-for-winter-2016-2017
```{r, message=FALSE, warning=FALSE, fig.width=8, fig.height=4.5, echo=FALSE}


```


