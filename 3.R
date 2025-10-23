# R code to create a time series plot (DOY)
plot(data_cleaned$year, data_cleaned$doy,
     
     type="l", main="Sakura full bloom Month Over Time",
     xlab="Time", ylab="Day of Year", col="purple")

#Plot with month on x-axis and year on the fill aesthetic
ggplot(data_cleaned, aes(x = year, y = doy)) +
  
  geom_point(aes(size = 3), alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE) +
  # Adjust point size and transparency
  # Add a linear regression line
  
  labs(title = "Shift in Asahikawa and Obihiro Sakura Full Blooms",
       x = "Year", y = "First Bloom Date") +
  
  theme_bw() # Apply a black and white theme

ggplot(data_cleaned, aes(x = year, y = doy)) +
  geom_point() +
  geom_smooth(method = lm) +
  labs(title = "Shift in Sakura Full Blooms Date",
       
       x = "Year",
       y ="First Bloom Date (DOY)")
