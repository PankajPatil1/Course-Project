library(data.table)
library(dplyr)
#Read all the required data
train <- read.table("./train/X_train.txt")
test <- read.table("./test/X_test.txt")
train_labels <- read.table("./train/y_train.txt")
subjects_train <- read.table("./train/subject_train.txt")
subjects_test <- read.table("./test/subject_test.txt")
test_labels <- read.table("./test/y_test.txt")


#Merge the datasets
all_labels <- bind_rows(train_labels,test_labels)
all_data <- bind_rows(train,test)
all_subjects <- bind_rows(subjects_train,subjects_test)
colnames(all_subjects) <- "Subject Numbers"
all_labels$id <- 1:nrow(all_labels)

#Read and process features
features <- read.table("features.txt")
features_colno <- grep("mean|std",features[,2])  #
features_name <- features[grepl("mean|std",features[,2]),]
all_data <- select(all_data,features_colno)
all_data <- bind_cols(all_labels,all_data)


#Read and process activity names
#Activity labels is merged into all_labels
activity_labels <- read.table("activity_labels.txt")
all_labels <- merge(all_labels,activity_labels)
all_labels <- arrange(all_labels,id)
all_labels <- select(all_labels,-V1)
all_data <- merge(all_data,all_labels,by="id")
all_data <- bind_cols(all_data,all_subjects)
colnames(all_data)[3] <-"v2a"
all_data <- select(all_data,83,V2.y,2:81)

#Process features name and add them to the main dataset
# Also sets redundant columns to NULL
#Renames the column names to remove the () terms
#avg_data then averages out the data for same activity and person
features_name$V1 <- NULL
all_data[[3]] <- NULL
features_name <- gsub("[-()]","",features_name[[1]])
colnames(all_data) <-c("Subject","Activity",features_name)
avg_data <- ddply(all_data, .(Subject,Activity), function(x) colMeans(x[,3:81]))

write.table(avg_data,"tidy_data.txt",quote = F,row.names = F)
