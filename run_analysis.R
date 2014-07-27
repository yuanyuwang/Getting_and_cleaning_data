##Step1:Merges the training and the test sets to create one data set.

#Reading input from files
trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingLabel<-read.table("./UCI HAR Dataset/train/y_train.txt")
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabel<-read.table("./UCI HAR Dataset/test/y_test.txt")
trainingSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#merge training and test datasets
dataSet<-rbind(trainingSet,testSet)
dataLabel<-rbind(trainingLabel,testLabel)
subject<-rbind(trainingSubject,testSubject)
#data<-cbind(dataSet,dataLabel,subject)

##Step2:Extracts only the measurements on the mean and standard deviation for each measurement. 

#read measurement feature from file
features <- read.table("./UCI HAR Dataset/features.txt")

#grab column  for mean and standard deviation
cols <- grep(".*mean.*|.*std.*", features[,2])
features <- features[cols,]
dataSet<-dataSet[,cols]

#add label and subject to dataset
data<-cbind(dataSet,dataLabel,subject)

#tidy column name
features[,2] = gsub('[()]', '', features[,2])
features[,2] = gsub('-', '', features[,2])

#add column name to dataset
colnames(data) <- c( as.character(features$V2), "activity", "subject")

##step3:Uses descriptive activity names to name the activities in the data set

#read activity label
activityLabel<-read.table("./UCI HAR Dataset/activity_labels.txt")

#replace activity label in dataset
data$activity<-activityLabel[data$activity,2]

##step4:Appropriately labels the data set with descriptive variable names.
#They are all appropriated named

##step5:Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#add average of each variable for each activity and each subject
tidyData = aggregate(data, by=list(Subject=data$subject,Activity=data$activity), FUN=mean, na.rm=TRUE)

#drop unused columns
tidyData <- subset(tidyData, select = -c(activity,subject) )

#sort by subject
tidyData<-tidyData[ order(tidyData$Subject),]
row.names(tidyData) <- NULL 

write.table(tidyData, "Average_by_subject_and_activity.txt")




