# read files (only if not read yet)

if (!exists("y_train"))       y_train       <- read.table("UCI HAR Dataset/train/y_train.txt")
if (!exists("y_test"))        y_test        <- read.table("UCI HAR Dataset/test/y_test.txt")

if (!exists("subject_train")) subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
if (!exists("subject_test"))  subject_test  <- read.table("UCI HAR Dataset/test/subject_test.txt")

if (!exists("x_train"))       x_train       <- read.table("UCI HAR Dataset/train/X_train.txt")
if (!exists("x_test"))        x_test        <- read.table("UCI HAR Dataset/test/X_test.txt")



train <- cbind(subject_train, y_train, x_train)
test  <- cbind(subject_test,  y_test,  x_test)

