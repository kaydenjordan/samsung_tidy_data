##Load necessary packages
library(dplyr); library(Hmisc); library(data.table); library(reshape2)
#Set working directory
setwd("C:/Users/Kayla/Desktop/R Packages")
#Create temp file and download zip data files
temp = tempfile("zippy", tmpdir="C:/Users/Kayla/Desktop/R Packages")
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)

#Read in training dataset
training = read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"))
#Add in variable labels and subject and activity identifiers
labels = read.table(unz(temp, "UCI HAR Dataset/features.txt"))
colnames(training) = as.character(labels$V2)
vars = grep("mean|std", labels$V2)
training = training[vars]
act_train = read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))
colnames(act_train) = "Activity"
act = factor(act_train$Activity, labels = c("Walking", "Walking Upstairs", "Walking Downstairs", 
                                            "Sitting", "Standing", "Laying"))
training = cbind(act, training)
subjects_train = read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))
colnames(subjects_train) = "Subject"
training = cbind(subjects_train, training)

#Read in test dataset
test = read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"))
#Add in variable labels and subject and activity identifiers
colnames(test) = as.character(labels$V2)
test = test[vars]
act_test = read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"))
colnames(act_test) = "Activity"
act = factor(act_test$Activity, labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting",
                                           "Standing", "Laying"))
test = cbind(act, test)
subjects_test = read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))
colnames(subjects_test) = "Subject"
test = cbind(subjects_test, test)

#Combine training and test data
data = rbind(training, test)

#Find indices for accelerometer and gyroscope data
mean_acc = grep("Acc.*mean", colnames(data))
std_acc = grep("Acc.*std", colnames(data))
mean_gyro = grep("Gyro.*mean", colnames(data))
std_gyro = grep("Gyro.*std", colnames(data))

#Averages all accelerometer mean, accelerometer sd, gyroscope mean, and gyroscrop sd columns for each row.
sum = mutate(data, mean_accel = rowMeans(data[mean_acc]), sd_accel = rowMeans(data[std_acc]), 
             mean_velocity = rowMeans(data[mean_gyro]), sd_velocity = rowMeans(data[std_gyro]))
sum = sum[c(1,2,82:85)]

#Averages each subjects data by activity
tidy = group_by(sum, Subject, act)%>%summarise(mean_acceleration = mean(mean_accel), 
        sd_acceleration = mean(sd_accel), mean_velocity = mean(mean_velocity),sd_velocity = 
        mean(sd_velocity))

#Rearranges the data such that there is one column for each variable and one row for each subject
tidy = melt(tidy, measure.vars = c("mean_acceleration", "sd_acceleration", "mean_velocity", "sd_velocity"))
tidy = dcast(setDT(tidy), Subject~act+variable, value.var = "value")
tidy = spread(tidy, act, c(mean_acceleration, sd_acceleration, mean_velocity, sd_velocity))

write.table(tidy, "tidy.txt", row.name=FALSE)
