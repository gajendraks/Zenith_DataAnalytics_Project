Data1 <- read.csv("G:/SEM5/DataAnalytics/BenefitsCostSharing.csv",header = TRUE,sep=",")
rData2 <- read.csv("G:/SEM5/DataAnalytics/BusinessRules.csv",header = TRUE,sep=",")
Data3<-read.csv("G:/SEM5/DataAnalytics/PlanAttributes.csv",header = TRUE,sep=",")
Data4 <- read.csv("G:/SEM5/DataAnalytics/Rate.csv",header = TRUE,sep=",")
Data5<- read.csv("G:/SEM5/DataAnalytics/ServiceArea.csv",header = TRUE,sep=",")
crosswalk2015<- read.csv("G:/SEM5/DataAnalytics/Crosswalk2015.csv",header = TRUE,sep=",")
crosswalk2016<- read.csv("G:/SEM5/DataAnalytics/Crosswalk2016.csv",header = TRUE,sep=",")

ct1<-Data1["CoinsInnTier1"]
table(is.na(ct1[]))
for(i in 1:nrow(ct1)){
  print(ct1[i])
}
sum(is.na(Data1$CoinsInnTier1))
summary(ct1)
mean(ct1)
count=0
nrow(ct1)
for(i in 1:nrow(ct1)){
  if(ct1[i,]=="")
    count=count+1
}
print(count)
#It is observed that dealing with 5048408 is really difficult...hence using random sampling:-
regexp <- "[[:digit:]]+"
library(stringr)
data1_sam<-Data1[sample(nrow(Data1), 10000), ]
ct1<-data1_sam["CoinsInnTier1"]
values<-vector()
k=1
for(i in 1:nrow(data1_sam)){
values[k]=as.numeric(str_extract(ct1[i,],regexp))
k=k+1
}
mean_ct1<-mean(values,na.rm=TRUE)
new_values<-vector()
k=1
for(i in 1:nrow(ct1)){
  new_values[k]=ct1[i,]
  if(is.na(ct1[i,])==TRUE)
    new_values[k]=mean_ct1
  k=k+1
}
new_ct1<-as.data.frame(new_values)
data1_sam$CoinsInnTier1<-new_ct1

           
