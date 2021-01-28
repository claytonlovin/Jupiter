library(shinydashboard)
library("googleAnalyticsR")

#ga_accounts <- ga_account_list()
#View(ga_accounts)

ga_id = 232608978 

ga_results1 <-google_analytics(ga_id,
                               date_range = c("2020-11-15", "2020-11-21"),
                               metrics = c("users","sessions"),
                               dimensions = "date")
users = sum(ga_result1[ , 2])