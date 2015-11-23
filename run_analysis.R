run_analysis <- function(directory = "~/coursera/dataclean/Week3/UCI\ HAR\ Dataset/") {
        ## Get the columns that are mean and std: here I consider meanFreq should also be included
        meanstd <- filter(features, grepl("mean|std", features$V2))
        
        ## read test data
        testData <- read.table(file.path(directory, "test/X_test.txt"))
        ## only get the mean and std of the data
        testData <- select(testData, meanstd[,1])
        ## read test activity label
        testActivity <- read.table(file.path(directory, "test/y_test.txt"))
        ## read test subject label
        testSubject <- read.table(file.path(directory, "test/subject_test.txt"))
        
        ## Merge into a complete test data
        test <- cbind(testSubject, testActivity, testData)
                                  
        ## read train data
        trainData <- read.table(file.path(directory, "train/X_train.txt"))
        ## only get the mean and std of the data
        trainData <- select(trainData, meanstd[,1])
        ## read test activity label
        trainActivity <- read.table(file.path(directory, "train/y_train.txt"))
        ## read test subject label
        trainSubject <- read.table(file.path(directory, "train/subject_train.txt"))

        ## Merge into a complete train data
        train <- cbind(trainSubject, trainActivity, trainData)
        
        ## Merge test and train data
        finalData <- rbind(train, test)
        
        colnames(finalData) <- c("subject", "activity", as.vector(meanstd[,2]))
        
        write.table(finalData, file = file.path(directory, "tidydata1.txt"), row.names=FALSE)
        
        index <- unique(finalData[,c('subject','activity')])
        index <- arrange(index, order(subject, activity))
        
        avg <- data.frame()
        for (i in 1:nrow(index)) {
            avg <- rbind(avg, c(index[i,1], index[i,2], colMeans(finalData[finalData$subject == index[i,1] & finalData$activity == index[i,2],-(1:2)])))        
        }
        colnames(avg) <- c("subject", "activity", as.vector(lapply(meanstd[,2], paste0, ".avg")))
        write.table(avg, file = file.path(directory, "tidydata2.txt"), row.names=FALSE)
        
}
