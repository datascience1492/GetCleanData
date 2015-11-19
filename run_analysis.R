# Load reshape2 package:
if(!require(reshape2)) {
  install.packages("reshape2")
  require(reshape2)
}

# Download data:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","UCI_HAR.zip")
unzip("UCI_HAR.zip")

# Load data:
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")

# 1. Merge data:
allData <- rbind(testData,trainData)
rm(testData,trainData)

# 2. Extract only the measurements on the mean and standard deviation:
measurementNames <- readLines("UCI HAR Dataset/features.txt")
measurementNames <- unlist(strsplit(measurementNames," "))[1:length(measurementNames)*2]
whichMean <- grepl("mean",measurementNames)
whichStd <- grepl("std",measurementNames)
myIndices <- which(whichMean|whichStd)
selectedData <- allData[,myIndices]
rm(whichMean,whichStd,allData)

# 3. Name the activites:
testActivities <- read.table("UCI HAR Dataset/test/y_test.txt")
trainActivities <- read.table("UCI HAR Dataset/train/y_train.txt")
allActivities <- as.factor(rbind(testActivities,trainActivities)[,1])
selectedData <- cbind(allActivities,selectedData)
levels(selectedData[,1]) <- unlist(strsplit(readLines("UCI HAR Dataset/activity_labels.txt")," "))[1:6*2]
rm(testActivities,trainActivities,allActivities)

# I will also add the subjects:
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
allSubjects <- as.factor(rbind(testSubjects,trainSubjects)[,1])
selectedData <- cbind(allSubjects,selectedData)
rm(testSubjects,trainSubjects,allSubjects)

# 4. Label the columns:
names(selectedData) <- c("Subject","Activity",measurementNames[myIndices])
rm(measurementNames,myIndices)

# 5. New data set, with the average of each variable for each activity and each subject:
moltenData <- melt(selectedData,id=1:2)
tidyData <- dcast(moltenData,Activity+Subject~variable,mean)
write.table(tidyData,"tidyData.txt",row.names=FALSE)