# Code Book

The script generates a tidy dataset containing the average of all measurements present in the raw data and which express a mean or standard deviation.

Because of this, this code book does not cover the measurements of the raw data as these were not altered apart the aggregation.

The following two variables deserve further explanation:

* subject

    This is the ID of the subject who performed the test or training expressed as an integer
    
* activity

    This is the activity done by the subject. The activity ID in the raw data was explicited by looking up a character label.
    
## Tidy Column Names

The column names from raw data (features) have been tidied up to conform to tidy data rules. The names in the raw data contained special characters and mixed case for letters. After tidying, they only contain lower case letters, periods and numbers. This was done with the following steps:

* make names unique

    The raw data features contained duplicates. These have been made unique with the make.names function.
    
* replace multiple dots with one

    Make names takes care to convert special characters to periods. The resulting multiple and consecutive periods have been reduced to only one.

* remove dot at end of line

    Periods at the end of the name have been removed.

* put a dot in front of capital letter

    To convert camel toe notation to dotted notation all capital letters have been replaced by themselves plus a leading period.

* replace "f." prefix with "freq." and "t." prefix with "time."

    For better readability, short prefixes where explicited.

* remove double occurrences of "Body"

    In some names Body occured twice consecutively, this has been shortened to only one.

* lowercase all

    Finally, all names have been put to lower case.