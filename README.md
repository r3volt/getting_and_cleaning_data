# Getting and Cleaning Data Course Project

This repository contains files for the Getting and Cleaning Data Course Project.


## Table of contents

- [Course Instructions](#course-instructions)
- [Submission Requirements](#submission-requirements)
- [Approach Outline](#approach-outline)
  - [Source Data](#source-data)
  - [Helper Information](#helper-information)
- [About the Output Data Sets](#about-the-output-data-sets)
  - [Trimmed Data Set](#trimmed-data-set)
  - [Tidy Data Set](#tidy-data-set)
- [Running the Analysis](#running-the-analysis)
  - [Required Packages](#required-packages)
  - [Running the Script](#running-the-script)
- [Reviewing the output](#reviewing-the-output)

## Course Instructions

Here are the required outcomes:

0. Merges the training and the test sets to create one data set.
0. Extracts only the measurements on the mean and standard deviation for each measurement. 
0. Uses descriptive activity names to name the activities in the data set
0. Appropriately labels the data set with descriptive variable names. 
0. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Submission Requirements

You will be required to submit: 

0. A tidy data set as described below, 
0. a link to a Github repository with your script for performing the analysis, and
0. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
0. A README.md in the repo with your scripts. This file explains how all of the scripts work and how they are connected.  


## Approach Outline

This is a high-level description of the approach. 

0. Setup the working data directory
  0. Create a working data directory
  0. Download the source data
  0. Unzip the source data
0. For each of the test and train data sets (using a single function for both):
  0. For each of the "subject", "X", "y" files, read them in to a separate data frame
  0. Attach names to each of the "subject", "X", "y" data frames
    * For the X data frame, read the variables in from the "features.txt" file
  0. Bind all of the data frames together into a single data frame
  0. Create a new column called "activity_name" to include the activity_label
    * Activity names are read from the "activity-labels.txt" file and are converted to lower case before mapping as a factor to the activity_id variable
0. Merge the test and train data sets
0. Trim the merged data set to only include subject, activity and mean or std variables
0. Modify the names for the trimmed dataset to be cleared (and to fix errors in the source data)
0. Gather the data set (effectively transposing from columns to rows)
0. Summarize the Gathered data set (mean by subject by activity by measure)
0. Write the output data file

Where possible all involved or reusable pieces of code have been made modularized as parameterized functions. 

* setupSourceData(localDirectoryName, remoteUrl, localFileName)
* writeOutputData(outputDataFrame, outputDirectoryName, outputFileName)
* createDataSet(dataDirectory, dataSetName)
* cleanNames(df)

In-depth detail on the output dataset can be found in the [CodeBook](CodeBook.md).

#### Source Data

Data for this project can be gotten from the following location:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data purpose, collection method, etc. is outlined here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### Helper Information

Getting Started with the Course Project

- https://class.coursera.org/getdata-013/forum/thread?thread_id=191

David's personal course project FAQ

- https://class.coursera.org/getdata-013/forum/thread?thread_id=30


## About the Output Data Sets

#### Trimmed Data Set

I have included all variables which include "mean" or "std", ignoring case, for the meanwhile since they are latitudinal measures in the original data set for which resolution to recreate would be unavailable in a later data set.

#### Tidy Data Set

The Tidy Data Set (and the interim set) uses the Narrow Format with the following as an example of the output:

    "subject" "activity" "measure" "mean"
    1 "walking" "time_body_accelerometer_mean_X" 0.277330758736842
    1 "walking" "time_body_accelerometer_mean_Y" -0.0173838185273684
    1 "walking" "time_body_accelerometer_mean_Z" -0.111148103547368
    1 "walking" "time_gravity_accelerometer_mean_X" 0.935223201473684
    1 "walking" "time_gravity_accelerometer_mean_Y" -0.282165021263158
    1 "walking" "time_gravity_accelerometer_mean_Z" -0.068102864
    1 "walking" "time_body_accelerometer_jerk_mean_X" 0.0740416333157895
    1 "walking" "time_body_accelerometer_jerk_mean_Y" 0.0282721095884211
    1 "walking" "time_body_accelerometer_jerk_mean_Z" -0.00416840617789474

Reading the output data set is outlined in [Reviewing the output](#reviewing-the-output).

The output data set code book can be found [here](CodeBook.md).

## Running the Analysis

#### Required Packages

The only required packages are "dplyr" and "tidyr", both by Hadley Wickham, which can be installed from CRAN by running...

```
install.packages("dplyr")
install.packages("tidyr")
```
  
N.B. curl must be installed on the system running download.file (since it uses HTTPS).

#### Running the Script

To use this script, simply source the script using the following:

```
source("run_analysis.R")
```

The script, by default, will create a "./data" directory, download and unzip the source data and then create and write the output to and "./output" directory.

See [Approach Outline](#approach-outline) for detail on the approach.

## Reviewing the Output

Following the successful run of the analysis script you can review the data output with the following R command, where "output/output.txt" is the location of the output file.

```
output <- read.table("output/output.txt", header = TRUE)
```

Information on the variables in the output data set is outlined in the [CodeBook](CodeBook.md).
