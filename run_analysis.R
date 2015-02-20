library(data.table)
library(dplyr)
run_analysis <- function() {
    features_df <- read.table("UCI HAR Dataset/features.txt")
    names(features_df) <- c('sno','descr')
    
    #-- Extracting only mean and standard deviation measurements for processing
    features_df <- features_df[which(features_df$descr %like%
                                    'mean[()]' | features_df$descr %like% 'std()' ),]
    features_df$descr <- gsub('[()]','',features_df$descr)
    req_fld <- features_df$sno
    mycols <- rep("NULL", 561)
    mycols[c(req_fld)]<- 'numeric'
    
    #--Activity label
    activity_label <- read.table("UCI HAR Dataset/activity_labels.txt")
    names(activity_label) <- c("activity_no", "activity_name")
    
    #--Extracting training data  and bind it with subject's acitivity
    x_train_data <- read.table("UCI HAR Dataset/train/X_train.txt",
                               header=F,colClasses=mycols)
    names(x_train_data) <- features_df$descr
    x_train_sub <- read.table("UCI HAR Dataset/train/subject_train.txt"
                              ,        header=F)
    names(x_train_sub) <- 'Subject'
    y_train_data <- read.table("UCI HAR Dataset/train/y_train.txt",
                               header=F)
    names(y_train_data) <- "activity_no"
    x_train_data <- cbind(x_train_sub,y_train_data,x_train_data)
    
    #--Extracting test data  and bind it with subject's acitivity
    x_test_data <- read.table("UCI HAR Dataset/test/X_test.txt",
                              header=F,colClasses=mycols)
    names(x_test_data) <- features_df$descr
    x_test_sub <- read.table("UCI HAR Dataset/test/subject_test.txt",
                             header=F)
    names(x_test_sub) <- 'Subject'
    y_test_data <- read.table("UCI HAR Dataset/test/y_test.txt",
                              header=F)
    names(y_test_data) <- "activity_no"
    x_test_data <- cbind(x_test_sub,y_test_data,x_test_data)
    
    #combining training and test data
    x_tidy_data <- rbind (x_train_data,x_test_data)
    x_tidy_data <- merge(x_tidy_data,activity_label, 
                         by.x = 'activity_no', by.y='activity_no',all=T)
    
    #average of all measurement for each activity and each subject
    x_tidy_data <- x_tidy_data %>%   group_by(Subject,activity_name)  %>%  
        summarise_each(funs(mean))
    
    x_tidy_data$activity_no <- NULL
    
    #format header description
    header_descr <- colnames(x_tidy_data)
    header_descr <- gsub('[()-]','',header_descr)
    header_descr <- gsub('^t','Time',header_descr)
    header_descr <- gsub('BodyBody','Body',header_descr)
    header_descr <- gsub('^f','Frequency',header_descr)
    colnames(x_tidy_data) <- header_descr
    #write to output file
    x_tidy_data <- data.frame(apply(x_tidy_data, 2, format),
                              stringsAsFactors=FALSE)
    write.table(x_tidy_data,"UCI HAR Dataset/subject_activity.txt", 
                quote= F, row.name=F)
}
