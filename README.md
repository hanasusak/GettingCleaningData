GettingCleaningData
===================

Getting and Cleaning Data | Peer Assessment

IMPORTANT NOTES
-------------------------

* fread was not used to read files as it was reporting problem with positioning. There was several reports on the web with same error, where this problem was listed as bug which will be fixed in next versions of _data.table_ package. 
* For second task, sub-selecting mean and std columns assumption was mead that only columns having _mean()_ and _std()_ in their name are the ones which need to be kept.



### The raw data
Raw data, used to create tidy data, is provided in folder **UCI HAR Dataset**.
Descriptions and README files are also provided with raw data.

### The tidy data set and the code book
The tidy data set is in folder **Tidy_Data**. 
Code book for tidy data can be found in file *CodeBook.Rmd*.  
Additional informaton about tidy data can be found in this file or in code book.  


### How to code variables

* In the tidy data there is one __allX.txt__ set and one __ally.txt__ file.   
First one, __allX.txt__ contains 66 features which are mean and standard deviation for different measurements specified in raw data.  
Second one,  __ally.txt__ contains only one column and it represents activity labels.   
* All variables in __allX.txt__  file are numeric. 
* Activity labels in file activity __ally.txt__ is categorical variable.
* Both files have 10299 observations/rows (plus 1 row, first row for column names)
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

