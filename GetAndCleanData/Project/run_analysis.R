## Load required library
require(plyr)

## Read "Train" Data
alltrainfiles=list.files("train",full.names=TRUE)
ignoretraindata=alltrainfiles[1]  ## Ignore RAW Inertial Data
trainsubjects=read.table(alltrainfiles[2])
traindata=read.table(alltrainfiles[3])
trainactivitydata=read.table(alltrainfiles[4])  

## Read "Test" Data
alltestfiles=list.files("test",full.names=TRUE)
ignoretestdata=alltestfiles[1]  ## Ignore RAW Inertial Data
testsubjects=read.table(alltestfiles[2])
testdata=read.table(alltestfiles[3])
testactivitydata=read.table(alltestfiles[4])  

## Merge "Train" and "Test" Data
allsubjects <- rbind(trainsubjects,testsubjects)
alldata <- rbind(traindata,testdata)
allactivitydata <- rbind(trainactivitydata,testactivitydata)

## Read "Activity" Data
activities <- read.table("activity_labels.txt")
colnames(activities) <- c("activityId","activityName")

## Using Descriptive Activity Names
allactivitydata$V1 <- factor(allactivitydata$V1, levels=c(1:6), labels=activities$activityName)

## Read "Features" Data
allfeatures <- read.table("features.txt")
colnames(allfeatures) <- c("featureId","featureName")

## Subset "mean" and "std" features from allfeatures
fidx <- (like(allfeatures$featureName, "mean") | like(allfeatures$featureName, "std"))
subfeatures <- allfeatures[fidx==TRUE,]

## Subset alldata for subfeatures
subdata <- alldata[,fidx==TRUE]

## Append the subject and activity data to subdata to complete
## the dataset
subdata <- cbind (allsubjects,as.character(allactivitydata$V1),subdata)

## Approrpiately labelling the dataset with descriptive names 
names(subdata)[1]<-"Subject"
names(subdata)[2]<-"Activity"
for (i in 1:nrow(subfeatures)) {
  names(subdata)[i+2]<-as.character(subfeatures$featureName[i])
}

## Creating a new independant data set
groups <- group_by(subdata,Subject,Activity)
res <- slice(groups,30)  
write.table(res, file="tidydataset.txt", row.names=FALSE)