GettingCleaningData
===================

Getting and Cleaning Data | Peer Assessment

IMPORTANT NOTES
-------------------------

* For first task assumption was made that information from 6 files (X_train.txt, y_train.txt, subject_train.txt , X_test.txt, y_test.txt and subject_test.txt) need to be correctly combined in one file.
* For second task, sub-selecting mean and std columns assumption was mead that only columns having _mean()_ and _std()_ in their name are the ones which need to be kept.
* Due to the ambiguity and similarity of task 3 and 4 next assumption was made:   
descriptiv column for acitivity is added, and all numeric columns were given names provided in file __features.txt__. In code book full description of features can be found. 
* data.table package was used to speed up operations
* fread was not used to read files as it was reporting problem with positioning. There was several reports on the web with same error, where this problem was listed as bug which will be fixed in next versions of _data.table_ package. 



### The raw data
Raw data, used to create tidy data, is provided in folder **UCI HAR Dataset**.
Descriptions and README files are also provided with raw data.

### The tidy data set and the code book
The tidy data set is in folder **Tidy_Data**. 
Code book for tidy data can be found in file *CodeBook.md*.  
Additional informaton about tidy data can be found in this file or in code book.  

### How to code variables

* Tidy data have 68 columns and 180 rows plus 1 row (first) for column names. File name is __tidy_data.txt__.   
* Each row represent one combination of subject and activity (6x30)
* activity column is categorical variable, one of 6 activities person can performed.
* subject column is integer variable with values between 1 and 30. Each number code for person performing the tests.
* All other variables in __tidy_data.txt__  file are numeric.  
They are avrege value for grouped acitivity and subject of means and SD features previousy selected (66 of them).
* Features are normalized and bounded within [-1,1].


How to reproduce tidy data
===========

Script run_analysis.R contains code to reproduce tidy data from row data. 
Few things you need to be careful before running script:

* Working directory ( setwd() ) need to be set to path where run_analysis.R is located. The simplest  way is to run script from location where is located.
* Structure of files (row data + script + other files) should not be changed. You should keep hierarchy as in git Hub repository. 
* libraries used: data.table. If not installed, you need to remove comments in front of the lines for installing packages.
* Scrip was tested on Mac OS X, version 10.7.5. It should work on other systems, but it was not tested.  

All code needed for reproducing tidy data set is in __run_analysis.R__ file.


Feature Selection (copy from row data)
=================

_Description of variables used for geting mean when grouped by activity and subject._

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation


