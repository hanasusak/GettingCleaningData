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
train.X <- read.table('/Users/hanasusak/Desktop/Coursera/GCD/assigmnent/GettingCleaningData/UCI HAR Dataset/train/X_train.txt', header=F)
test.X <- read.table('/Users/hanasusak/Desktop/Coursera/GCD/assigmnent/GettingCleaningData/UCI HAR Dataset/test/X_test.txt', header=F)

train.y <- read.table('/Users/hanasusak/Desktop/Coursera/GCD/assigmnent/GettingCleaningData/UCI HAR Dataset/train/y_train.txt', header=F)
test.y <- read.table('/Users/hanasusak/Desktop/Coursera/GCD/assigmnent/GettingCleaningData/UCI HAR Dataset/test/y_test.txt', header=F)

## set column names
names.col.df <- read.table('/Users/hanasusak/Desktop/Coursera/GCD/assigmnent/GettingCleaningData/UCI HAR Dataset/features.txt')
names.col <- names.col.df$V2

colnames(train.X) <- names.col
colnames(test.X) <- names.col

## convert to data.table to work faster
train.X <- as.data.table(train.X)
test.X <- as.data.table(test.X)

train.y <- as.data.table(train.y)
test.y <- as.data.table(test.y)

## merge them together
l <- list(train.X, test.X)
all.X <- rbindlist(l)

l <- list(train.y, test.y)
all.y <- rbindlist(l)

rm(l)
rm(names.col.df)

####################################################################################
##
## task 2, Extracts only the measurements on the mean and standard deviation for each measurement. 
##

## selecting all column witch have mean or std in their name
mn.sd.cols <- as.character(names.col[grepl('mean[()]|std[()]',names.col)])

all.X <- all.X[ , mn.sd.cols,  with = FALSE]

####################################################################################
##
## task 3, Uses descriptive activity names to name the activities in the data set
##








