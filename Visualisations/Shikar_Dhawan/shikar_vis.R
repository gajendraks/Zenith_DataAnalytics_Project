library(dplyr)
library(tidyverse)
library(plotly)

shikar<-deliveries[deliveries$batsman=="S Dhawan",]
#View(shikar)
names(shikar)[1]<- "id"
temp <- merge(shikar,matches,by="id")

temp<- temp %>%
        select(3,5:7,16,22)%>%
        arrange(season)

temp = temp %>% 
  unite(x, c(over,ball), sep = ".", remove = FALSE)

#View(temp)
temp1<-temp %>%
  group_by(over,season)%>%
  summarize(sum(batsman_runs))%>%
  arrange(season)
#View(temp1)

names(temp1)[3]<-"batsman_runs"
temp2<-spread(temp1,season,batsman_runs)
temp2[is.na(temp2)]<-0

plot_ly(data=temp1,x=temp1$over,y=temp$batsman_runs)

p <- plot_ly(temp2, x = ~temp2$over, y = ~temp2$`2008`, name = '2008', type = 'scatter', mode = 'lines',line = list(color = 'rgb(0, 0, 0)', width = 4)) %>%
  add_trace(y = ~temp2$`2009`, name = '2009', line = list(color = 'red', width = 4)) %>%
  add_trace(y = ~temp2$`2010`, name = '2010', line = list(color = 'green', width = 4)) %>%
  add_trace(y = ~temp2$`2011`, name = '2011', line = list(color = 'yellow', width = 4)) %>%
  add_trace(y = ~temp2$`2012`, name = '2012', line = list(color = 'purple', width = 4)) %>%
  add_trace(y = ~temp2$`2013`, name = '2013', line = list(color = 'violet', width = 4)) %>%
  add_trace(y = ~temp2$`2014`, name = '2014', line = list(color = 'blue', width = 4)) %>%
  add_trace(y = ~temp2$`2015`, name = '2015', line = list(color = 'brown', width = 4)) %>%
  add_trace(y = ~temp2$`2016`, name = '2016', line = list(color = 'orange', width = 4)) %>%
  add_trace(y = ~temp2$`2017`, name = '2017', line = list(color = 'rgb(28, 0, 199)', width = 4))
p

#scores  high runs in powerplay but keeps decreasing in the later overs
#as  he is opener , he may not play for 20 overs.


temp3<-temp %>%
  group_by(season) %>%
  summarize(runs=sum(batsman_runs))
View(temp3)
temp3$season<-as.factor(temp3$season)
library(ggplot2)
ggplot(temp3,aes(x=season,y=runs,fill=season))+
  geom_col()
