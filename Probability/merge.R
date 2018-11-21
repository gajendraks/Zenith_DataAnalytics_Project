runs_prob=read.csv("./../Data/runs_prob.csv",header=TRUE)
wickets_prob=read.csv("./../Data/wicktet_prob.csv",header=TRUE)


pp_prob<-merge(runs_prob,wickets_prob,by=c('batsman','bowler'),all=TRUE)
pp_prob<-pp_prob[,c("batsman","bowler","P0","P1","P2","P3","P4","P6","p_not_out")]

write.csv(pp_prob,"./../Data/pp_prob.csv",row.names = FALSE)


