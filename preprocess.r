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
coin<-data1_sam["CoinsOutofNet"]
summary(coin)
values<-vector()
k=1
for(i in 1:nrow(data1_sam)){
  values[k]=as.numeric(str_extract(coin[i,],regexp))
  k=k+1
}
mean_coin<-mean(values,na.rm=TRUE)
for(i in 1:nrow(data1_sam)){
  if(coin[i,]=="")
    coin[i,]=mean_coin
}
##Above for loop replaced the missing values by NA..
new_values<-vector()
k=1
for(i in 1:nrow(coin)){
  new_values[k]=coin[i,]
  if(is.na(coin[i,])==TRUE)
    new_values[k]=mean_coin
  k=k+1
}
#replacing NA with mean
new_coin<-as.data.frame(new_values)
data1_sam$CoinsOutofNet<-new_coin

##

iscov<-data1_sam["IsCovered"]
values<-vector()
k=1
nrow(iscov)
for(i in 1:nrow(iscov))
{
  if(iscov[i,]=="Covered")
    values[k]=1
  if(iscov[i,]=="Not Covered")
    values[k]=0
  if(iscov[i,]=="")
    values[k]=-1
  k=k+1
  
}
data1_sam$IsCovered=as.data.frame(values)
isehb<-data1_sam["IsEHB"]
values<-vector()
k=1
for(i in 1:nrow(isehb))
{
  if(isehb[i,]=="Yes")
    values[k]=1
  if(isehb[i,]=="No")
    values[k]=0
  if(isehb[i,]=="")
    values[k]=-1
  k=k+1
}
data1_sam$IsEHB=as.data.frame(values)
inMOOP<-data1_sam["IsExclFromInnMOOP"]
values<-vector()
k=1
for(i in 1:nrow(isehb))
{
  if(inMOOP[i,]=="Yes")
    values[k]=1
  if(inMOOP[i,]=="No")
    values[k]=0
  if(inMOOP[i,]=="")
    values[k]=-1
  k=k+1
}
data1_sam$IsExclFromInnMOOP=as.data.frame(values)
onMOOP<-data1_sam["IsExclFromOonMOOP"]
values<-vector()
k=1
for(i in 1:nrow(isehb))
{
  if(onMOOP[i,]=="Yes")
    values[k]=1
  if(onMOOP[i,]=="No")
    values[k]=0
  if(onMOOP[i,]=="")
    values[k]=-1
  k=k+1
}
data1_sam$IsExclFromOonMOOP=as.data.frame(values)
ist1<-data1_sam["IsSubjToDedTier1"]
values<-vector()
k=1
for(i in 1:nrow(isehb))
{
  if(ist1[i,]=="Yes")
    values[k]=1
  if(ist1[i,]=="No")
    values[k]=0
  if(ist1[i,]=="")
    values[k]=-1
  k=k+1
}
data1_sam$IsSubjToDedTier1=as.data.frame(values)
ist2<-data1_sam["IsSubjToDedTier2"]
values<-vector()
k=1
for(i in 1:nrow(isehb))
{
  if(ist2[i,]=="Yes")
    values[k]=1
  if(ist2[i,]=="No")
    values[k]=0
  if(ist2[i,]=="")
    values[k]=-1
  k=k+1
}
data1_sam$IsSubjToDedTier2=as.data.frame(values)
