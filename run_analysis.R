#load required packages
# will be used for unpivot an pivot columns (melt and dcast)
library(reshape2)

# 1) Load all files to process into dataframes  
# load information about features and variables into dataframes
df_featLabel <- read.table(file.path(Dir,"/features.txt"), header = FALSE, strip.white=TRUE)
df_actiLabel <- read.table(file.path(Dir,"/activity_labels.txt"), header = FALSE, strip.white=TRUE)
  
## load test data into dataframes
  
df_tst_subjData <- read.table(file.path(Dir,"/test/subject_test.txt"), header = FALSE, strip.white=TRUE)
df_tst_featData <- read.table(file.path(Dir,"/test/X_test.txt"), header=FALSE, strip.white=TRUE)
df_tst_actiData <- read.table(file.path(Dir,"/test/y_test.txt"), header = FALSE, strip.white=TRUE)
  
## load train data into dataframes
df_tra_subjData <- read.table(file.path(Dir,"/train/subject_train.txt"), header = FALSE, strip.white=TRUE)
df_tra_featData <- read.table(file.path(Dir,"/train/X_train.txt"), header=FALSE, strip.white=TRUE)
df_tra_actiData <- read.table(file.path(Dir,"/train/y_train.txt"), header = FALSE, strip.white=TRUE)

# Add column names on data frames
names(df_tst_actiData) <- "activity"
names(df_tst_subjData) <- "subjectID"
names(df_tst_featData) <- df_featLabel$V2
names(df_tra_actiData) <- "activity"
names(df_tra_subjData) <- "subjectID"
names(df_tra_featData) <- df_featLabel$V2

# 2) Extracts only the measurements on the mean and standard deviation for each measurement.  
# create vector with column names "mean" and "std"
meanStdColumns <- grepl("\\bmean\\b",names(df_tst_featData)) | grepl("\\bstd\\b",names(df_tst_featData))
# drop unused columns
df_tra_featData <- df_tra_featData[,meanStdColumns]
df_tst_featData <- df_tst_featData[,meanStdColumns]
  
# 3) merge dataframes
df_train <- cbind(df_tra_subjData, df_tra_actiData, df_tra_featData)
df_test <- cbind(df_tst_subjData, df_tst_actiData, df_tst_featData)
df_complete <- rbind(df_train, df_test)

# 4) Uses descriptive activity names to name the activities    
# 5) Appropriately labels the data set with descriptive variable names
# Convert the activity column to factor
df_complete$activity <- factor(df_complete$activity, labels = df_actiLabel$V2)

# 6) Creates a second, independent tidy data set with the
#average of each variable for each activity and each subject.
df_tmp_unpivot <- melt(df_complete, id=c("subjectID","activity"))
df_tidyData <- dcast(df_tmp_unpivot, subjectID+activity ~ variable, mean)

#write the tidy dataframe into a file
write.csv(df_tidyData, "tidyData.csv", row.names=FALSE)