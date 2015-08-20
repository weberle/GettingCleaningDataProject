#
# This script:
# - reads in the specified training and testing data,
# - merges the data, 
# - adds appropriate subjects and activities,
# - creates meaningful names for the activities,
# - calculates the averages of each column by subject and activity, and
# - writes the results to the file run_analysis.txt
#
# Assumptions:
#
# - The "dplyr" package is already installed and loaded:
#
#   install.packages("dplyr")
#   library(dplyr)
#
# - The following Samsung data is in the working (current) directory:
#
#   features.txt
#   X_train.txt
#   subject_train.txt
#   y_train.txt
#   X_test.txt
#   subject_test.txt
#   y_test.txt
#
header <- read.table("./features.txt",header=FALSE)
headerData <- header[,2]
#
trainData <- read.table("./X_train.txt",col.names=headerData)
trainSubject <- read.table("./subject_train.txt",col.names=c("subject"))
trainActivity <- read.table("./y_train.txt",col.names=c("activity"))
mergedTrain <- cbind(trainSubject,trainActivity,trainData)
#
testData <- read.table("./X_test.txt",col.names=headerData)
testSubject <- read.table("./subject_test.txt",col.names=c("subject"))
testActivity <- read.table("./y_test.txt",col.names=c("activity"))
mergedTest <- cbind(testSubject,testActivity,testData)
#
total <- rbind(mergedTrain, mergedTest)
meanStdData <- total[,grepl("*[mM]ean*|*[sS]td*|subject|activity",names(total))]
#
meanStdData$activity[meanStdData$activity == 1] <- "WALKING"
meanStdData$activity[meanStdData$activity == 2] <- "WALKING_UPSTAIRS"
meanStdData$activity[meanStdData$activity == 3] <- "WALKING_DOWNSTAIRS"
meanStdData$activity[meanStdData$activity == 4] <- "SITTING"
meanStdData$activity[meanStdData$activity == 5] <- "STANDING"
meanStdData$activity[meanStdData$activity == 6] <- "LAYING"
#
meanCol <- meanStdData %>% group_by(subject,activity) %>% summarise_each(funs(mean))
#
write.table(meanCol, file = "run_analysis.txt", row.name=FALSE)