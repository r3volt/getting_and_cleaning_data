library(dplyr)
library(tidyr)

## Default Source Variables
sourceDirectory <- "./data"
sourceRemoteUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
sourceLocalFileName <- "sourceData.zip"
sourceDataDirectoryName <- "UCI HAR Dataset"
sourceDataSets <- c("train", "test")

## Default Output Variables
outputDataDirectoryName <- "./output"
outputDataFileName <- "output.txt"


## Function to identify, get and setup the source data for later analysis.
setupSourceData <- function(localDirectoryName=sourceDirectory, 
                            remoteUrl=sourceRemoteUrl, 
                            localFileName=sourceLocalFileName) {

  ## Create a working directory for the data if one does not already exist.
  if (!file.exists(localDirectoryName)) {
    dir.create(localDirectoryName)
  }
  else { 
    warning("The localDirectoryName \"", 
            localDirectoryName, 
            "\" already existed."
            )
  }
  
  ## Set the Local Filename for the Source Data
  downloadFilePath <- paste(localDirectoryName, localFileName, sep="/")
  
  ## If and only if the Source Data does not already exist locally,
  ## download the Source Data and Store Locally.
  if (!file.exists(downloadFilePath)) {
    download.file(remoteUrl, destfile=downloadFilePath, method="curl")
  }
  
  ## Unzip the Source Data.
  ## N.B. Provided we're not playing in the Source Data tree later, we can do this
  ## idempotently (i.e. every time anew). In fact, probably best to do this anyway.
  unzip(downloadFilePath, overwrite = TRUE, exdir=localDirectoryName)
}

writeOutputData <- function(outputDataFrame, 
                            outputDirectoryName=outputDataDirectoryName, 
                            outputFileName=outputDataFileName) {
  
  ## Create a output directory for the data if one does not already exist.
  if (!file.exists(outputDirectoryName)) {
    dir.create(outputDirectoryName)
  }
  else { 
    warning("The outputDirectoryName \"", 
            outputDirectoryName, 
            "\" already existed."
            )
  }
  
  outputFilePath <- paste(outputDirectoryName, outputFileName, sep="/")
  
  ## Write the output data, overwriting and warning, if necessary.
  if (file.exists(outputFilePath)) {
    warning(outputFileName, 
            " was overwritten in \"", 
            outputDirectoryName, 
            "\"."
            )
  }
  write.table(outputDataFrame, file = outputFilePath, sep = " ", row.names = FALSE)
  
}

## Create initial data sets for train vs. test
## Aim here is to create a complete merged set (subject + X + y)
## for either test or train and then simply rbind() them.
## The following will create a local environment variable for 
## each of the data frames.
##  subject_test, X_test, y_test OR
##  subject_train, X_train, y_train
## N.B. This function uses eval() and parse() to make more modular.
createDataSet <- function(dataDirectory=sourceDataDirectoryName, dataSetName) {
  
  # Check first to see if the dataSetName is valid
  if (!(dataSetName %in% sourceDataSets)) {
    stop("The dataSetName \"", 
          dataSetName, 
          "\" does not exist. Processing Halted!", 
          "\n\nPlease choose a value from the following: ", 
          paste(sourceDataSets, collapse = ", ")
         )
  }
  
  dataNames <- c("subject", "X", "y")

  for (i in 1:length(dataNames)) {
    varName <- paste(dataNames[i], "_", dataSetName, sep = "")
    fileName <- paste(varName, ".txt", sep="")
    filePath <- paste(dataDirectory, sourceDataDirectoryName, dataSetName, fileName, sep="/")
    cmd <- paste(varName, ' <- read.table(\'', filePath, '\', header = FALSE)', sep = "")
    eval(parse(text=cmd))
  }
  
  ## Now we need to modify the names for (subject_{train, test})
  cmd <- paste('names(subject_', dataSetName, ') <- c("subject_id")', sep = "")
  eval(parse(text=cmd))
  
  ## Read the names of all variables in from "features.txt"
  featuresFilePath <- paste(dataDirectory, sourceDataDirectoryName, "features.txt", sep = "/")
  features <- read.table(featuresFilePath, col.names = c("id", "name"), header = FALSE)
  
  ## To Ensure that names are correct use make.names
  names <- make.names(names=features$name, unique = TRUE, allow_ = TRUE)
  ## And then assign it names of (X_{train, test})
  cmd <- paste('names(X_', dataSetName, ') <- names', sep = "")
  eval(parse(text=cmd))
  
  ## Now we need to modify the names for (y_{train, test})
  cmd <- paste('names(y_', dataSetName, ') <- c("activity_id")', sep = "")
  eval(parse(text=cmd))

  ## Use cbind() to take all 3 test or train data sets and combine them together.
  cmd <- paste('df <- cbind(subject_', dataSetName, ', X_', dataSetName, ', y_', dataSetName, ')', sep="")
  eval(parse(text=cmd))

  ## Last Step here will be to read the Activity Labels from the source file
  activityLabelFilePath <- paste(dataDirectory, sourceDataDirectoryName, "activity_labels.txt", sep = "/")
  activities <- read.table(activityLabelFilePath, col.names = c("id", "name"), header = FALSE)

  ## Now that we have the activities, we can use create an activity_name  
  ## variable which uses the activity list to create a factor variable.
  df$activity_name <- factor(df$activity_id, labels=tolower(activities$name))
  
  df
}

## Perform a bunch of clean-up on the variable names
cleanNames<-function(df) {
  names<-names(df)

  names[grep("^subject_id$", names)]<-"subject"
  names[grep("^activity_name$", names)]<-"activity"
  names<-sub("^t", "time_", names)
  names<-sub("^f", "frequency_", names)
  names<-sub("^angle.", "angle_", names)
  ## Fix duplicated "Body" in name.
  names<-sub("BodyBody", "Body", names)
  names<-sub("_Body", "_body_", names)
  names<-sub("_Gravity", "_gravity_", names)
  names<-sub("_Acc", "_accelerometer_", names)
  names<-sub("_Gyro\\.", "_gyrometer_", names)
  names<-sub("_Gyro", "_gyrometer_", names)
  names<-sub("_JerkMag", "_jerkmagnitide", names)
  names<-sub("_Jerk", "_jerk", names)
  names<-sub("_Mag", "_magnitude", names)
  names<-sub("meanFreq", "meanfrequency", names)
  names<-gsub("\\.", "_", names)
  names<-gsub("_+", "_", names)
  names<-gsub("_$", "", names)
  names<-sub("_tBodyAccMean_", "_time_body_accelerometer_mean_", names)
  names<-sub("_tBodyAccJerkMean_", "_time_body_accelerometer_jerk_mean_", names)
  names<-sub("_tBodyGyroMean_", "_time_body_gyrometer_mean_", names)
  names<-sub("_tBodyGyroJerkMean_", "_time_body_gyrometer_jerk_mean_", names)
  names<-sub("gravityMean", "gravity_mean", names)
  
  names(df)<-names
  df
}

## Run Steps Below
## ---------------
setupSourceData(localDirectoryName=sourceDirectory, 
                remoteUrl=sourceRemoteUrl, 
                localFileName=sourceLocalFileName)

## Create the Data Sets
test <- createDataSet(dataDirectory=sourceDirectory, dataSetName = "test")
train <- createDataSet(dataDirectory=sourceDirectory, dataSetName = "train")

## Now merge them
fullDataSet <- rbind(test, train)

## Extracts only the measurements on the mean and standard deviation for each measurement. 
trimmed <- select(fullDataSet, subject_id, contains("mean"), contains("std"), activity_name)

## Clean up the names in the trimmed data set.
trimmed <- cleanNames(trimmed)

## Gather the dataset a bit for ease of summaqrization.
gathered <- gather(trimmed, key = measure, value = value, -subject, -activity)

## Create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidied <- gathered %>% group_by(subject, activity, measure) %>% summarise(mean = mean(value))

## Output the tidy data set to the output directory.
writeOutputData(outputDataFrame=tidied, 
                outputDirectoryName=outputDataDirectoryName, 
                outputFileName=outputDataFileName)
