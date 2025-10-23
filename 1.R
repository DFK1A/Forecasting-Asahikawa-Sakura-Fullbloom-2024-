# Check the current working directory
getwd()

# Set working directory
setwd("C:/Data Science Social Studies/week6 Full Bloom/Assignment")

# Load library
library(ggplot2)
library(dplyr)
library(readr)
library(tidyr)
library(lubridate)
library(forecast)

# R code to import the data
data <- read_csv("sakura_full_bloom_dates.csv")

# R code to handle missing values
data_cleaned <- na.omit(data)
summary(data_cleaned)

# Removing columns
data_cleaned[, c('Currently Being Observed', '30 Year Average 1981-2010', 'Notes')] <- list(NULL)
summary(data_cleaned)

View(data_cleaned)
