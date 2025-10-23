# FORECASTING #

# Subset data for a single country
Asahikawa <- subset(data_cleaned, Site == "Asahikawa")

# Subset only univariate
Asahikawa[ , c('Site', 'year', 'value', 'month', 'date')] <- list(NULL)

# Remove rows 67 through 71 (We only use until 2018 for prediction)
pred_Asahikawa <- Asahikawa[-c(67:71), ]

# Convert it to a time series object.
Asahikawa_ts_actual <- ts(Asahikawa, start = c(1953, 1), frequency = 1)
Asahikawa_ts_pred <- ts(pred_Asahikawa, start = c(1953, 1), frequency = 1)

# Print the timeseries data.
print(Asahikawa_ts_actual)
print(Asahikawa_ts_pred)

plot(Asahikawa_ts_actual, main = "Actual Data for full First Bloom at Asahikawa")

# Fitting model using auto.arima model
model <- auto.arima(Asahikawa_ts_pred)

# Next 5 forecasted values (We want to predict to 5 years ahead, until 2023)
forecast_data <- forecast(model, 5)
print(forecast_data)
plot(forecast_data, main = "Forecasting for Sakura Full Bloom at Asahikawa")
lines(Asahikawa_ts_actual, type = "l", col = "red")
