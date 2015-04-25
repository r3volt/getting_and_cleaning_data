# getting_and_cleaning_data

Project files for Getting and Cleaning Data Course Project.

## Instructions

Here are the required outcomes:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Submission Requirements

You will be required to submit: 

1. A tidy data set as described below, 
2. a link to a Github repository with your script for performing the analysis, and
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
4. A README.md in the repo with your scripts. This file explains how all of the scripts work and how they are connected.  

## Source Data

Data for this project can be gotten from the following location:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data purpose, collection method, etc. is outlined here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Helper Information

Getting Started with the Course Project: https://class.coursera.org/getdata-013/forum/thread?thread_id=191
David's personal course project FAQ: https://class.coursera.org/getdata-013/forum/thread?thread_id=30

## Rough Outline of Approach

...

## Required Packages

The only required package is "dplyr" by Hadley Wickham which can be installed from CRAN by running...

  install.pacakages("dplyr")
  
N.B. curl must be installed on the system running download.file (since it uses HTTPS).

## Running Script

To use this script, simply source the script using the following:

  source("run_analysis.R")

The script, by default, will create a data directory, download and unzip the source data and then create and write the output.

Notes on specific approaches follow.

#### Trimmed Data

I have included all variables which include "mean" or "std", ignoring case, for the meanwhile since they are latitudinal measures in the original data set for which resolution to recreate would be unavailable in a later data set.

#### Tidy Data

...