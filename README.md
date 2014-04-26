GettingCleaningData
===================

Getting and Cleaning Data | Peer Assessment

###  IMPORTANT NOTES

* fread was not used to read files as it was reporting problem with positioning. There was several reports on the web with same mistake, where this problem was listed as bug which will be fixed in next versions of data.table package.
* For second task, subseting mean and std columns assumtion was mead that only columns having mean() and std() in their name are the ones which need to be kept.


### The raw data


### The raw data


### The tidy data set


### The code book


### How to code variables

How to reproduce tidy data
===========

Script run_analysis.R containes code to reproduce tidy data from row data. 
Few things you need to be careful before runing script:

* Working directory ( setwd() ) need to be set to path where run_analysis.R is located. The simplest  way is to run script from location where is located.
* Structure of files (row data + script + other files) should not be changed. You chould keep hiararchy as in gitHub repository. 
* libraries used: data.table. If not instaled, need to uncoment lines for installing packages.
* Scrip was tested on Mac OS X, version 10.7.5. It should work on other systems, but it was not tested.
