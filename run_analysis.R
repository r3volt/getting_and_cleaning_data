# Check and create a data directory
# Download the data zip file from: 
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Use unzip to extract the file in place
# Use week3 Merging Data Lecture to merge into a single Data Frame
# Create another Data Frame for mean and sd data
# User dplyr rename to rename items
# Proper variable names
# Create another data frame using summarize

## Function to identify, get and setup the source data for later analysis.
setupSourceData<-function(workingDataDirectory="./data") {

  ## Create a working directory for the data if one does not already exist.
  if(!file.exists(workingDataDirectory)) {
    dir.create(workingDataDirectory)
  }   
  
  ## Set the Source Data URL
  zipUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  ## Set the Local Filename for the Source Data
  downloadFilePath<-paste(workingDataDirectory, "sourceData.zip", sep="/")
  
  ## If and only if the Source Data does not already exist locally,
  ## download the Source Data and Store Locally.
  if(!file.exists(downloadFilePath)) {
    download.file(zipUrl, destfile=downloadFilePath, method="curl")
  }
  
  ## Unzip the Source Data.
  ## N.B. Provided we're not playing in the Source Data tree later, we can do this
  ## idempotently (i.e. every time anew). In fact, probably best to do this anyway.
  unzip(downloadFilePath, overwrite = TRUE, exdir=workingDataDirectory)
}

mergeDataSets<-function(mergeDataDirectory="./data") {
  print("Hello there stupid!")
}

## Main Run Steps
dataDirectory<-"./data"
setupSourceData(dataDirectory)
mergeDataSets(dataDirectory)



