## Author       : Aravind Sesetty
## Date         : 12-19-2014
## Course       : Getting and Cleaning Data / Course Project

run_analysis <- function(){
        
        ## 0. Download the *.zip file and Unzip it
        ## ---------------------------------------
        
        ## Check for the GACD_CP/data folder, create if doesnt exists
        if(!file.exists("./GACD_CP/data")){
                dir.create("./GACD_CP/data")
        }
        
        ## URL for *.zip file
        zipFileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        
        ## Set up a temporary *.zip file namespace in the temp directory
        tempZipFile <- tempfile(pattern = "WC_Accelerometer_Data", tmpdir = tempdir(), fileext = ".zip")
        
        ## Download the *.zip file to temp directory and into the temporary *.zip file namespace
        download.file(zipFileUrl, tempZipFile, mode = "wb")
        
        ## Unzip the *.zip file into ./GACD_CP/data directory
        unzip(tempZipFile, list = FALSE, overwrite = TRUE, exdir = "./GACD_CP/data")
        
        ## List the files
        list.files(path = "./GACD_CP/data", recursive = TRUE)
        
        ## 1. Merges the training and the test sets to create one data set.
        ## ---------------------------------------------------------------
        
        ## Read X_train data into a dataframe
        X_train_Data <- read.table(file = "./GACD_CP/data/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
        
        ## Read X_test data into a dataframe
        X_test_Data <- read.table(file = "./GACD_CP/data/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
        
        ## Append "X_train_Data" with "X_test_Data" by Row
        X_train_test_Data <- rbind(X_train_Data, X_test_Data)
                
        ## Read column 2 of features data into a dataframe
        features_Data <- read.table(file = "./GACD_CP/data/UCI HAR Dataset/features.txt", header = FALSE, stringsAsFactors = FALSE)[,2]
        
        ## Set "features_Data" as column names to "X_train_test_Data"
        colnames(X_train_test_Data) <- features_Data
        
        ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
        ## ------------------------------------------------------------------------------------------
        
        ## Grep features_Data for mean & std columns indexes
        mean_std_Index <- grep(".mean\\(\\)|.std\\(\\)", features_Data, ignore.case = TRUE, value = FALSE)
        
        ## Subset "X_train_test_Data" by "mean_std_Index"
        X_train_test_mean_std_Data <- X_train_test_Data[ , mean_std_Index]
        
        ## X. Merges the Subject training and the Subject test sets to create one data set.
        ## ---------------------------------------------------------------------------------
        
        ## Read subject_train data into a dataframe
        subject_train_Data <- read.table(file = "./GACD_CP/data/UCI HAR Dataset/train/subject_train.txt", header = FALSE, colClasses = "numeric")
        
        ## Read subject_test data into a dataframe
        subject_test_Data <- read.table(file = "./GACD_CP/data/UCI HAR Dataset/test/subject_test.txt", header = FALSE, colClasses = "numeric")
        
        ## Append "subject_train_Data" & "subject_test_Data" and column bind to "X_train_test_mean_std_Data"
        X_train_test_mean_std_Data$Volunteer <- cbind(rbind(subject_train_Data, subject_test_Data)[,1])
        
        ## 3. Uses descriptive activity names to name the activities in the data set
        ## -------------------------------------------------------------------------
        
        ## Read y_train data into a dataframe
        y_train_Data <- read.table(file = "./GACD_CP/data/UCI HAR Dataset/train/y_train.txt", header = FALSE, colClasses = "numeric")
        
        ## Read y_test data into a dataframe
        y_test_Data <- read.table(file = "./GACD_CP/data/UCI HAR Dataset/test/y_test.txt", header = FALSE, colClasses = "numeric")
        
        ## Append "y_train_Data" & "y_test_Data" by row
        y_train_test_Data <- rbind(y_train_Data, y_test_Data)
        
        ## Read column 2 of features data into a dataframe
        activity_labels_Data <- read.table(file = "./GACD_CP/data/UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)
        
        ## Apply Activity Labels to "y_train_test_Data"
        for(i in seq_along(y_train_test_Data[,1])){
                y_train_test_Data[i,1] <- activity_labels_Data[y_train_test_Data[,1][i],2]
        }
        
        ## Set column name as "Activity" to "y_train_test_Data"
        colnames(y_train_test_Data) <- "Activity"        
        
        ## Column bind the "X_train_test_mean_std_Data" & "y_train_test_Data"
        finalData <- cbind(X_train_test_mean_std_Data, y_train_test_Data)
        
        ## 4. Appropriately labels the data set with descriptive variable names. 
        ## ---------------------------------------------------------------------
        
        ## Fetch the Raw Headings
        rawHeadings <- names(finalData)
        
        ## Modify the Raw Headings to Meaningful Headings
        headings <- sub("Gyro", "Gyroscope", sub("Acc", "Accelerometer", sub("^f", "Frequency", sub("^t", "Time", rawHeadings, perl=TRUE), perl=TRUE), perl=TRUE), perl=TRUE)
        
        ## Set the Meaningful Headings to finalData
        colnames(finalData) <- headings
        
        ## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        ## -------------------------------------------------------------------------------------------------------------------------------------------------
        
        ## Apply Mean function and Aggregate data by Activity & Volunteer
        tidyData <- aggregate(x = finalData[1:(ncol(finalData)-2)], by = list(Activity = factor(finalData$Activity), Volunteer = factor(finalData$Volunteer)), FUN = "mean")        
        
        ## Write tidy data to a txt file
        write.table(tidyData, file = "./GACD_CP/data/tidyData.txt", row.name = FALSE)

}