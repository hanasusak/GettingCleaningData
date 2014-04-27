##  Hana
##  25/04/2014

## clean everything
rm(list=ls())

## load packages
#install.packages('data.table')
library(data.table)

## Working directory neet to be set where this R script is located.
## if you are not runing script from this path, you should set it manually :
setwd(getwd())
#output folder
dir.create('Tidy_Data', showWarnings = FALSE)

####################################################################################
##
## task 1, Merges the training and the test sets to create one data set.
##

## load train and test data
train.X <- read.table('./UCI HAR Dataset/train/X_train.txt', header=F)
test.X <- read.table('./UCI HAR Dataset/test/X_test.txt', header=F)

train.y <- read.table('./UCI HAR Dataset/train/y_train.txt', header=F)
test.y <- read.table('./UCI HAR Dataset/test/y_test.txt', header=F)

train.subject <- read.table('./UCI HAR Dataset/train/subject_train.txt', header=F)
test.subject <- read.table('./UCI HAR Dataset/test/subject_test.txt', header=F)

## set column names
names.col.df <- read.table('./UCI HAR Dataset/features.txt',  stringsAsFactors=FALSE)
names.col <- names.col.df$V2

colnames(train.X) <- names.col
colnames(test.X) <- names.col

colnames(train.y) <- 'activity_code'
colnames(test.y) <- 'activity_code'

colnames(train.subject) <- 'subject'
colnames(test.subject) <- 'subject'


## convert to data.table to work faster
train.X <- as.data.table(train.X)
test.X <- as.data.table(test.X)

train.y <- as.data.table(train.y)
test.y <- as.data.table(test.y)

train.subject <- as.data.table(train.subject)
test.subject <- as.data.table(test.subject)

## merge them together
l <- list(train.subject, test.subject)
all.subject <- rbindlist(l)

l <- list(train.y, test.y)
all.y <- rbindlist(l)


l <- list(train.X, test.X)
all.X <- rbindlist(l)

all.data <- cbind(all.y, all.subject, all.X)

rm(l)
rm(names.col.df)

####################################################################################
##
## task 2, Extracts only the measurements on the mean and standard deviation for each measurement. 
##

## selecting all column witch have mean or std in their name
mn.sd.cols <- as.character(names.col[grepl('mean[()]|std[()]',names.col)])
mn.sd.cols <- c('activity_code','subject',mn.sd.cols)
all.data <- all.data[ , mn.sd.cols,  with = FALSE]

####################################################################################
##
## task 3, Uses descriptive activity names to name the activities in the data set
## task 4, Appropriately labels the data set with descriptive activity names. (done in previous steps)
##


activity.code <- read.table('./UCI HAR Dataset/activity_labels.txt', header=F)
colnames(activity.code) <- c('activity_code','activity') 

activity.code <- as.data.table(activity.code)
setkey(activity.code, 'activity_code')
setkey(all.data, 'activity_code')
all.data <- merge(all.data, activity.code, by='activity_code', all.x=T)

col.ord <- c('subject','activity','activity_code', mn.sd.cols[-1:-2])
all.data <- all.data[ , col.ord,  with = FALSE]

####################################################################################
##
## task 5,  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##

snd.tidy <- all.data[, lapply(.SD, mean), by=list(activity,subject), .SDcols=4:ncol(all.data)]

## change names, as variables are not same any more, they are aggregated now as AVG value 
setnames(snd.tidy, names(snd.tidy)[3:ncol(snd.tidy)] , c(paste('groupAVG[' , names(snd.tidy)[3:ncol(snd.tidy)] , ']',sep='' ) ))

## other way
#tidy.df2 <- sapply(split(all.data[,4:ncol(all.data), with = FALSE], list(all.data$activity, all.data$subject)), colMeans)

## order a bit , first by activity then by subject
snd.tidy <- snd.tidy[order(activity,subject)]
## write final results
write.table(snd.tidy, file='./Tidy_Data/tidy_data.txt', row.names=F, col.names=TRUE, sep='\t', quote=FALSE)

