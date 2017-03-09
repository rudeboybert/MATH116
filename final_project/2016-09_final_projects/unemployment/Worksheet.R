gold <- 
  Quandl("BUNDESBANK/BBK01_WT5511", start_date="2013-01-01", end_date="2016-01-01")
unemployment<-Quandl("BLSE/CES0000000001", start_date="2000-10-31", end_date="2016-10-31")

midwest_unemployment<-Quandl("FRED/CMWRUR", collapse="annual", start_date="2000-01-01", end_date="2016-01-01")
south_unemployment<-Quandl("FRED/CSOUUR", collapse="annual", start_date="2000-01-01", end_date="2015-12-30")
northeast_unemployment<-Quandl("FRED/CNERUR", collapse="annual", start_date="2000-01-01", end_date="2015-12-30")
west_unemployment<-Quandl("FRED/CWSTUR", collapse="annual", start_date="2000-01-01", end_date="2016-01-01")
  
  
census <- read.csv("~/Final Project Math 116 Will Perry and Theodore Henderson/2000-2015 movement.csv")

census<-census%>% 
  select(year:net_migration) %>% 
  slice(1:64)

census %>% 
  filter(region=="northeast") %>% 
  ggplot(aes(x=year,y=inmigrants,group=1))+geom_line()

census %>% 
  ggplot(aes(x=year,y=inmigrants,group=1))+geom_line()+facet_wrap(~region)



census <- read.csv("~/Final Project Math 116 Will Perry and Theodore Henderson/2000-2015 movement.csv")

Draft
census %>% 
  ggplot(aes(x=year,y=unemployment,group=1))+geom_line()+facet_wrap(~region)

census %>% 
  ggplot(aes(x=year,y=outmigrants,group=1))+geom_line()+facet_wrap(~region)

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
  mutate(net_migration_percent_diff=((lead(net_migration)-lag(net_migration))/(lag(net_migration))*100)) %>% mutate(unemployment_in_difference=unemployment_percent_diff-inmigrants_percent_diff) %>% 
  mutate(unemployment_in_difference=unemployment_percent_diff-inmigrants_percent_diff) %>% 
  mutate(unemployment_out_difference=unemployment_percent_diff-outmigrants_percent_diff) %>% 
  mutate(unemployment_net_difference=unemployment_percent_diff-net_migration_percent_diff)

northeast<-census %>%
  filter(region=="northeast") %>% 
  select(-net_internal_migration,-movers_from_abroad) %>% 
  mutate(unemployment_percent_diff=((lead(unemployment)-lag(unemployment))/(lag(unemployment))*100))%>% 
  mutate(inmigrants_percent_diff=((lead(inmigrants)-lag(inmigrants))/(lag(inmigrants))*100)) %>%
  mutate(outmigrants_percent_diff=((lead(outmigrants)-lag(outmigrants))/(lag(outmigrants))*100)) %>% 
  mutate(net_migration_percent_diff=((lead(net_migration)-lag(net_migration))/(lag(net_migration))*100)) %>% mutate(unemployment_in_difference=unemployment_percent_diff-inmigrants_percent_diff) %>% 
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

# Compute observed test statistic
observed_diff <- mean(unemployment_diff ~ inmigrants_diff, data=west) %>% diff()

# Simulate the null distribution of the test statistic:
simulations <- do(10000) * mean(final ~ shuffle(major), data=grades)
simulations <- simulations %>%
  as_data_frame() %>% 
  mutate(difference=Other-Economics)

# Compare what we observed (red) to what happens if we assume no difference:
ggplot(data=simulations , aes(x=difference)) +
  geom_histogram() +
  geom_vline(xintercept = observed_diff, col="red") +
  geom_vline(xintercept = 0, linetype="dashed") +
  labs(x="Other Avg - Econ Avg")


  mutate(average_diff_unemployment_in=mean(unemployment_in_difference)) %>% 
  mutate(average_diff_unemployment_out=mean(unemployment_out_difference)) %>% 
  mutate(average_diff_unemployment_net=mean(unemployment_out_difference))


  observed_diff <- mean(final ~ major, data=grades) %>% diff()
m



#p-value calculation
simulations# %>%
  mutate(more_extreme_left = difference <= observed_diff) %>% 
  summarise(more_extreme_left = sum(more_extreme_left))