data<- read.csv("./../Data/deliveries.csv",header = TRUE)
summary(data)
#View(data)
library(dplyr)
bowler_batsman<- data %>%
  mutate(dummy=1) %>%
  group_by(batsman,bowler) %>%
  summarize(runs_scored=sum(batsman_runs),no_of_balls=sum(dummy),no_of_fours=sum(batsman_runs=="4"),no_of_sixes=sum(batsman_runs=="6"),no_of_zeroes=sum(batsman_runs=="0"),no_of_ones=sum(batsman_runs=="1"),no_of_twos=sum(batsman_runs=="2"),no_of_threes=sum(batsman_runs=="3"))
#View(bowler_batsman)        
probablity <- bowler_batsman %>%
  mutate(P0=no_of_zeroes/no_of_balls,P1=no_of_ones/no_of_balls,P2=no_of_twos/no_of_balls,P3=no_of_threes/no_of_balls,P4=no_of_fours/no_of_balls,P6=no_of_sixes/no_of_balls) %>%
  select(1:2,P0:P6)
#View(probablity)
write.csv(probablity,'./../Data/runs_prob.csv',row.names = FALSE)