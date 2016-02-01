#The following Codes are to create a Tidy Dataset from a complicated data source,
#Human Activity Recognition Using Smartphones Data Set, downloaded from the UCI Machine Learning Repository
#for the Johns Hopkins Getting and Cleaning Data course project.

#Please unzip the data folder and set the directory in "/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset"
#the Tidy Data will be saved in the same directory when you perform the analysis

#setwd("D:/My Documents/Coursera/Data Science/Getting and Cleaning Data/Course_Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
#dir()

#reading the datasets
features <- read.table("features.txt", sep = "") #561*2
features <- features[,2]
activities <- read.table("activity_labels.txt", sep = "", colClasses = "character")

#reading the files under test set
x_test <- read.table("test/X_test.txt", sep = "", header = FALSE) # dimension 2947*561
y_test <- read.table("test/y_test.txt", sep = "", header = FALSE, stringsAsFactors = FALSE) #describe 6 types of activities, dim 2947*1
sub_test <- read.table("test/subject_test.txt", sep = "")

#reading the files under training set
x_train <- read.table("train/X_train.txt", sep = "") # dimension 7352*561
y_train <- read.table("train/y_train.txt", sep = "") #describe 6 types of activities, dim 7352*1
sub_train <- read.table("train/subject_train.txt", sep = "")

#bind test and train sets of data
bindedData <- rbind(x_test, x_train)
names(bindedData) <- features #assign variable names

#extracts only the measurements on the mean and standard deviation
ex_mean <- bindedData[,grepl("mean()", names(bindedData), fixed = TRUE)]
ex_std <- bindedData[,grepl("std()", names(bindedData), fixed = TRUE)]

binded_y <- rbind(y_test, y_train)
binded_sub <- rbind(sub_test, sub_train) ; names(binded_sub) <- "Subject"

#giving descriptive activity names to the activities
Activity <- factor(binded_y$V1, labels = activities$V2)

#merge all column interested
mergedData <- cbind(binded_sub, Activity, ex_mean, ex_std)

#labels the data set with descriptive variable names
names(mergedData) <- gsub("\\-mean","Mean",names(mergedData))
names(mergedData) <- gsub("\\-std","StdDev",names(mergedData))
names(mergedData) <- gsub("^(t)","time",names(mergedData))
names(mergedData) <- gsub("^(f)","freq",names(mergedData))
names(mergedData) <- gsub("\\-","",names(mergedData))
names(mergedData) <- gsub("X$","InX",names(mergedData))
names(mergedData) <- gsub("Y$","InY",names(mergedData))
names(mergedData) <- gsub("Z$","InZ",names(mergedData))
names(mergedData) <- gsub("\\()","",names(mergedData))

#creating a tidy data set with the average of each variable for each activity and each subject
library(dplyr)
mean_summary <- summarise_each(group_by(mergedData, Subject, Activity), funs(mean))
dim(mean_summary)

#write the Tidy Data in a text file
write.table(mean_summary, file = "tidyData.txt", sep = " ", col.names = TRUE)