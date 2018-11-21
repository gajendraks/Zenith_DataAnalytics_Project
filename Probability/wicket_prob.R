data<- read.csv("./../Data/deliveries.csv",header = TRUE)
library(dplyr)
#no of balls 
bowler_batsman<- data %>%
  mutate(dummy=1) %>%
  group_by(batsman,bowler) %>%
  summarize(no_of_balls=sum(dummy))
data1<- data
#remove the rows where wicket has not been taken
data1[data$player_dismissed =="",] <- NA
data1<- na.omit(data1)
#consider only wickets for bowler
data1 <- data1%>%
        filter(dismissal_kind %in% c("bowled","caught","stumped","caught and bowled","lbw")) %>%
        mutate(dummy=1)%>%
        group_by(batsman,bowler) %>%
        summarize(no_of_times=sum(dummy))
        

#merge with the no of balls
prob <- merge(data1,bowler_batsman,by=c("batsman","bowler"))
prob<- prob %>%
  mutate(p_out=no_of_times/no_of_balls)%>%
  mutate(p_not_out=1-(no_of_times/no_of_balls))

View(prob)
write.csv(prob,"./../Data/wicktet_prob.csv",row.names = FALSE)