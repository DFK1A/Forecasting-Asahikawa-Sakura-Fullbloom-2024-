# Rename only the 1st column
colnames(data_cleaned)[1] <- "Site"

# Identify the year columns (assuming they start from the second column)
year_cols <- names(data_cleaned)[2:ncol(data_cleaned)]
print(year_cols)

# Ensure that all year columns are in Date format
data_cleaned[, year_cols] <- lapply(data_cleaned[, year_cols], as.Date)

# Check the data type of each column in the dataset
column_classes <- sapply(data_cleaned, class)
print(column_classes)

# Reshape the data from wide to long format using gather()
data_cleaned <- gather(data_cleaned, key = "year", value = "value", -Site)

# Ensure that the value column is in Date format
data_cleaned$value <- as.Date(data_cleaned$value)

# Convert year, month, and day from the date
data_cleaned$year <- year(data_cleaned$value)
data_cleaned$month <- month(data_cleaned$value)
data_cleaned$day <- day(data_cleaned$value)

# Calculate the day of the year (doy)
data_cleaned$doy <- yday(data_cleaned$value)

# Update the value column to reflect only the day of the year (doy)
data_cleaned$value <- as.character(data_cleaned$doy)

# Optionally, remove the now redundant year, month, day, and date columns
data_cleaned <- data_cleaned[, !(names(data_cleaned) %in% c("month", "day", "date"))]

# View the cleaned data
View(data_cleaned)
