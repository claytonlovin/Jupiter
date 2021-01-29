library(shinydashboard)
library("googleAnalyticsR")

#ga_accounts <- ga_account_list()
#View(ga_accounts)

ga_id = 232608978 

ga_results1 <-google_analytics(ga_id,
                               date_range = c("2020-11-15", "2020-11-21"),
                               metrics = c("users"),
                               dimensions = "date")

ga_result2 <-google_analytics(ga_id,
                               date_range = c("2020-11-15", "2020-11-21"),
                               metrics = c("sessions"),
                               dimensions = "date")

ga_result3 <-google_analytics(ga_id,
                              date_range = c("2020-11-15", "2020-11-21"),
                              metrics = c("bounceRate"),
                              dimensions = "date")

users = sum(ga_result1[ , 2])
sessions = sum(ga_result2[ , 2])
bounceRate = sum(ga_result3[3, 2])




