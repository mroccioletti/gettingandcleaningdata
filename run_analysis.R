library(stringr)
library(dplyr)

# Read files (only if not read yet)
# These files are read only once per RStudio session, as no operation is performed on original data.

if (!exists("y_train"))       y_train       <- read.table("UCI HAR Dataset/train/y_train.txt")
if (!exists("y_test"))        y_test        <- read.table("UCI HAR Dataset/test/y_test.txt")

if (!exists("subject_train")) subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
if (!exists("subject_test"))  subject_test  <- read.table("UCI HAR Dataset/test/subject_test.txt")

if (!exists("x_train"))       x_train       <- read.table("UCI HAR Dataset/train/X_train.txt")
if (!exists("x_test"))        x_test        <- read.table("UCI HAR Dataset/test/X_test.txt")

if (!exists("features"))      features      <- read.table("UCI HAR Dataset/features.txt")
if (!exists("activities"))    activities    <- read.table("UCI HAR Dataset/activity_labels.txt")

# join training data
train <- cbind(subject_train, y_train, x_train)

# join test data
test  <- cbind(subject_test,  y_test,  x_test)

# merge test and training data into one data.table
merged <- rbind(test, train)

# tidy up column names
cnames <- make.names(c(c("subject", "activity"), as.character(features$V2)), unique = TRUE)  # make names unique
cnames <- gsub("[\\.]+", "\\.", cnames)                                                      # replace multiple dots with one
cnames <- gsub("\\.$", "", cnames)                                                           # remove dot at end of line
cnames <- gsub("([A-Z])", "\\.\\1", cnames)                                                  # put a dot in front of capital letter
cnames <- gsub("[\\.]+", "\\.", cnames)                                                      # clean up multiple dots again
cnames <- gsub("^f\\.", "freq\\.", cnames)                                                   # replace "f." prefix with "freq."
cnames <- gsub("^t\\.", "time\\.", cnames)                                                   # replace "t." prefix with "time."
cnames <- gsub("Body\\.Body", "body", cnames)                                                # remove double occurrences of "Body"
cnames <- tolower(cnames)                                                                    # lowercase all

# assign column names to data.table
names(merged) <- cnames

# select only columns subject, training and those containing either mean or std
tidy <- select(merged, subject, activity, matches("\\.(mean|std)(\\.|$)"))

# replace training ids with label
tidy$activity <- activities$V2[tidy$activity]

# compute means of all columns by subject and training
tidy_summary <- summarise_all(group_by(tidy, subject, activity), mean)

# output tidy_summary data.table as TXT file without row names
write.table(tidy_summary, "tidy_summary.txt", row.names = FALSE)
