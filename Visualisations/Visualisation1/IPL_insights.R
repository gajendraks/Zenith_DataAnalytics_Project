##ANALYSIS ON MATCHES DATASET
##1.)Does a toss win mean match win?

#Extracting data per match into a variable
matchdb <- read.csv("./../../Data/matches.csv")
nrow(matchdb) # Evaluates to 696 matches
#variables that evaluate matches where toss win results in match win
#Using only those games where either team won
results <- matchdb[which(matchdb$winner != ""),]
gt <- nrow(subset(results, as.character(toss_winner) == as.character(winner),select=id))
bt <- nrow(subset(results, as.character(toss_winner) != as.character(winner),select=id))
col1 <- as.data.frame(rbind(gt,bt))
#Resulting dataframe
col0 <- as.data.frame(c("Toss winning the match","Toss not winning the match"))
toss_an <- as.data.frame(cbind(col0,col1$V1))
names(toss_an) <- c("Toss affecting match","no of matches")
toss_an

#Plotting a piechart
pie(main = "Toss influencing win",labels = toss_an$`Toss affecting match`,toss_an$`no of matches`)

##2.) BEST GROUNDS TO CHASE IN?
library(plyr)
results <- as.data.frame(results)
count1 <- count(results,vars = c('winner'))
results$city <- gsub('Bengaluru','Bangalore',results$city)
updated <- results[which(results$season != 2009),] # Excluding results played outside India
first <- subset(updated, as.character(win_by_runs) != 0 ,select=c(id,city))
second <- subset(updated, as.character(win_by_wickets) != 0 ,select=c(id,city))
#count based on city parameter
firstt <- count(first,vars = c('city'))
secondd <- count(second,vars = c('city'))
#Taking cities only where significant matches have been played
firstt <- firstt[which(firstt$freq >10),]
secondd <- secondd[which(secondd$freq>10),]
city_eval <- cbind(firstt$city,firstt$freq,secondd$freq)
chasing <- as.data.frame(secondd$freq*100/(secondd$freq+firstt$freq))
city_eval <- as.data.frame(cbind(city_eval,round(chasing,1)))
names(city_eval) <- c("City","Batting_winners","Chasing_winners","chasing_win")
#population[order(population$age),]
city_eval <- city_eval[order(city_eval$chasing_win,decreasing = TRUE),]
library(ggplot2)
p <-ggplot(city_eval, aes(city_eval$City,(city_eval$chasing_win)))
p +geom_bar(stat = "identity")+ xlab("City") + ylab("Win_percentage") +ggtitle("Best cities to chase in ")

#3.)WIN MARGINS

close1 <- subset(updated, as.character(win_by_runs) != 0 ,select=c(id,win_by_runs)) #Matches where the chasing team won
margins <- cut(close1$win_by_runs,breaks = c(0,10,20,30,40,60,180),labels = c("0-10","10-20","20-30","30-40","40-60","60+"))
filtered <- as.data.frame(cbind(close1,margins),) #Organized matches into categories as labelled
magnitude <- count(filtered, vars = c("margins")) #Count based on categories
barplot(magnitude$freq, main="Victory margins", xlab="Runs lost by",names.arg = magnitude$margins,ylab="No of matches")

#4.) CONSISTENT TEAMS
#Evaluating performance of most trophy winning teams vs rcb
sixteam <- matchdb[which(matchdb$season < 2016),] #For equal data for all teams
sixteam <- matchdb[,c(1,2,11)]
#head(sixteam)
library(plyr)
countf <- count(sixteam,vars = c("winner","season") ) #Counting no of wins based on season
View(countf)
cleaned <- countf[c(3:10,42:52,53:60,78:85),] #Selecting only successful IPL teams
agg2 <- aggregate(.~winner+season,cleaned,sum)
agg2 <- agg2[which(agg2$season < 2016),]
library(ggplot2)
ggplot(data=agg2, aes(x=agg2$season, y=agg2$freq, group =agg2$winner, colour = as.factor(agg2$winner)))+geom_line() 
#Compares IPL performances by wins between the league's greatest and RCB 

5.) 
#lineplot of average runs scored based on over
overb <- deliveries[,c(5,16,18)] # Keeping track of overs and runs scored in them
overagg <- aggregate(.~over,overb,sum) #Aggregate based on same
overcount <- count(deliveries[,c(5)]) #To develop an average keep track of balls bowled also
names(overcount) <- c("over","balls_faced")
overagg <- merge(overagg,overcount,by = "over")
overagg$economy <- round(((overagg$total_runs * 6)/ overagg$balls_faced),2)
View(overagg)
ggplot(data=overagg, aes(x=over, y=economy, group=1)) + geom_line(color="red")+geom_point()
#Gives us an interesting insight as to when most runs are scored in a match
?cor.test
cor.test(overagg$over,overagg$econ)
#Strong correlation between runs and scored and over , which means more chances
#of runs being scored as the game progresses.


