setwd(getwd())

# read cebu.csv
cebu <- read.csv("cebu.csv")
cebu

sorted_cebu <- cebu[order(cebu$Distance),]
sorted_cebu

library(dplyr)

data_hh <- select (sorted_cebu, c("Barangay","Population","Distance"))
data_hh <- mutate (data_hh, TravelTimeHr = 2*Distance/60)
data_hh <- mutate (data_hh, TravelTimeSec = TravelTimeHr*3600)
data_hh <- mutate (data_hh, LaborTime = 28800-TravelTimeSec)
data_hh <- mutate (data_hh, AccHit = floor(10*LaborTime/50))

total_acchits <- sum(data_hh$AccHit)
total_acchits

# save data_hh.csv
write.csv(data_hh, "data_hh.csv")
data_top <- head(data_hh, 10)
