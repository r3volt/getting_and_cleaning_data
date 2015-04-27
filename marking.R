library(dplyr)

fileurl <- "$studentUrl"
local<-tempfile()
download.file(fileurl, destfile=local, method="curl")
df<-read.table(local, header=TRUE)
names<-names(df)
head(df, n=20)

#subset<-select(df, Subject:TBodyGyroJerkMeanX)
head(subset, n=20)