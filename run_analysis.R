
# Read and merge data based on 'datasetName' (either 'test' or 'train')
# This function selects 'mean' and 'std' columns from the measurement data and adds subject ID and activity ID columns
assembleData <- function(datasetName) {
    datasetPath <- paste0(dataRootPath, datasetName)

    # Read features data (for column names)
    filePath <- file.path(dataRootPath, "features.txt")
    dataCols <- read.table(filePath, header=FALSE, as.is=TRUE, col.names=c("MeasureID", "MeasureName"))

    # Read X data (base data to build on)
    filePath <- file.path(datasetPath, paste0("X_", datasetName, ".txt"))
    data <- read.table(filePath, header=FALSE, col.names=dataCols$MeasureName)
       
    # Select names of subset columns required (mean and std only)
    subsetDataCols <- grep(".*mean\\(\\)|.*std\\(\\)", dataCols$MeasureName)
    
    # Subset data 
    data <- data[,subsetDataCols]
 
     # Read Y data (for activityID)
    filePath <- file.path(datasetPath, paste0("y_", datasetName, ".txt"))
    yData <- read.table(filePath, header=FALSE, col.names=c("ActivityID"))
    
    # Read subject data (for subjectID)
    filePath <- file.path(datasetPath, paste0("subject_", datasetName, ".txt"))
    subjectData <- read.table(filePath, header=FALSE, col.names=c("SubjectID"))
   
    # Append ActivityID and SubjectID columns
    data$ActivityID <- yData$ActivityID
    data$SubjectID <- subjectData$SubjectID
    
    # Return combined data
    data
}

# Create tidy data set and save it under provided file name
# This function will merge data from both 'train' and 'test' datasets, clean up column names for readbility and replace ActivityID by its full name
# Finally, it reshapes the data to display rows with an activity name, subject ID and mean of measurements
assembleTidyRunData <- function(fileName) {
    library(reshape2)

    # Merge train and test data sets 
    mergedData <- rbind( assembleData("test" ), assembleData("train") )

    # Clean up column names
    cNames <- colnames(mergedData)
    cNames <- gsub("\\.+mean\\.+", cNames, replacement="Mean")
    cNames <- gsub("\\.+std\\.+",  cNames, replacement="Std")
    colnames(mergedData) <- cNames

    # Add activity names as another column
    filePath <- file.path(dataRootPath, "activity_labels.txt")
    activityLabels <- read.table(filePath, header=FALSE, as.is=TRUE, col.names=c("ActivityID", "ActivityName"))

    activityLabels$ActivityName <- as.factor(activityLabels$ActivityName)
    mergedLabeledData <- merge(mergedData, activityLabels)

    # Melt dataset
    meltIDs = c("ActivityID", "ActivityName", "SubjectID")
    meltMeasures = setdiff(colnames(mergedLabeledData), meltIDs)

    meltedData <- melt(mergedLabeledData, id = meltIDs, measure.vars = meltMeasures)
    
    # Recast 
    tidyData <- dcast(meltedData, ActivityName + SubjectID ~ variable, mean)    

    write.table(tidyData, fileName)
}

# ---------------------------

dataRootPath <- "./data/UCI HAR Dataset/"

print(":: Creating a tidy data set from run data")
print(":: See https://github.com/lalquier/ProgrammingAssignment3 for details (README and CodeBook)")

if (!require("reshape2")) {
  install.packages("reshape2")
}

if(!file.exists("./data")){
    print("'data' folder doesn't exist. Creating it.")

    dir.create("./data")

} else {
    print("'data' folder found. ")
}

if(!file.exists(dataRootPath)){
    print("Runs data doesn't exist. Downloading and unzipping it.")

    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile="./data/runData.zip",method="curl")
    
    unzip("./data/runData.zip",exdir="./data/")

} else {
    print("Runs data found. ")
}

print("Processing run data...")

assembleTidyRunData("tidyData.txt")

print("tidyData.txt created")
