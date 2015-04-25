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

...


## Running the Analysis

#### Required Packages

The only required package is "dplyr" by Hadley Wickham which can be installed from CRAN by running...

```
install.pacakages("dplyr")
```
  
N.B. curl must be installed on the system running download.file (since it uses HTTPS).

#### Running the Script

To use this script, simply source the script using the following:

```
source("run_analysis.R")
```

The script, by default, will create a data directory, download and unzip the source data and then create and write the output.

Notes on specific approaches follow.

