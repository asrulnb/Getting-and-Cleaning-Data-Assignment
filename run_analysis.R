###[ Initializing Library ]

rm(list = ls())


library(dplyr)
library(data.table)


###[ Set working Directory to where the R source file is ]
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

# < Part 1 : Merges the training and the test sets to create one data set >

###[ Reading Training Data ]
subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
label.train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
data.train <- read.table("UCI HAR Dataset/train/x_train.txt", header = FALSE)


###[ Reading Test Data]
subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
label.test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
data.test <- read.table("UCI HAR Dataset/test/x_test.txt", header = FALSE)


###[ Merging Data Table ]
subject <- rbind(subject.test,subject.train)
label <- rbind(label.test,label.train)
data <- rbind(data.test,data.train)


###[ remove temporary data ]
rm(subject.test)
rm(subject.train)
rm(label.test)
rm(label.train)
rm(data.test)
rm(data.train)


###[ Reading Features List from File ]
featureList <- read.table("UCI HAR Dataset/features.txt")


###[ Naming the Columns ]
colnames(subject) <- "Subject"
colnames(label) <- "Activity"

#### Makes sure the names we going to use are valid
valid_names <- make.names(names = t(featureList[2]),unique = TRUE,allow_ = TRUE)

#### Assign the valid names
colnames(data) <- valid_names


###[ Combining everything into one Main DataSet ]
dsMain <- cbind(subject,label,data)


###[ remove temporary data ]
rm(subject)
rm(label)
rm(data)
rm(featureList)
rm(valid_names)

# </Part 1 >

# < Part 2 : Extracts only the measurements on the mean and standard deviation for each measurement.  >

dsMain <- select(dsMain,Subject,Activity,contains("mean"),contains("std"))

# </Part 2 >

# < Part 3 : Uses descriptive activity names to name the activities in the data set > 

###[ Read the activity labels from file ]
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",header = FALSE)

###[ Change the Activity ID with Activity Label ]
dsMain <- mutate(dsMain,Activity = ActivityLabels[Activity,2])

#### Remove variable that is no longer useful
rm(ActivityLabels)

# </Part 3 >

# < Part 4 : Appropriately labels the data set with descriptive variable names >

names(dsMain)<-gsub("Acc", "Accelerometer", names(dsMain))
names(dsMain)<-gsub("meanFreq", "MeanFrequency", names(dsMain))
names(dsMain)<-gsub("^t", "Time", names(dsMain))
names(dsMain)<-gsub("^f", "Frequency", names(dsMain))
names(dsMain)<-gsub("angle", "Angel", names(dsMain), fixed = TRUE)
names(dsMain)<-gsub("tBody", "TimeBody", names(dsMain))
names(dsMain)<-gsub("mean", "Mean", names(dsMain))
names(dsMain)<-gsub("std", "Std", names(dsMain))
names(dsMain)<-gsub("Mag", "Magnitude", names(dsMain))
names(dsMain)<-gsub("Gyro", "Gyroscope", names(dsMain))
names(dsMain)<-gsub("gravity", "Gravity", names(dsMain))
names(dsMain)<-gsub("BodyBody", "Body", names(dsMain))
names(dsMain)<-gsub("...", ".", names(dsMain), fixed = TRUE)
names(dsMain)<-gsub(".", "", names(dsMain), fixed = TRUE)

# </Part 4 >

# < Part 5 : creates a second, independent tidy data set with the average of each variable for each activity and each subject >

dsMain$Subject <- as.factor(dsMain$Subject)
dsMain <- data.table(dsMain)

#### Calculate the Mean for all column except "Subject" and "Activity"
tidyData <- aggregate(. ~Subject + Activity, dsMain, mean)

#### Order the Data
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]

#### Write the output file
write.table(tidyData, file = "tidy_data.txt", row.names = FALSE)

# </Part 5 >