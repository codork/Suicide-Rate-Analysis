library(dplyr)

#set working dir to where csv file is located for importing csv file
#setwd("D:/TYBTech/SCSL/SCSL Project")
getwd()
suicide.data <- read.csv("suicide_data.csv")

#take a look at the data to verify if the import is correct
names(suicide.data)
head(suicide.data)
#omit NA values (all values between two rows are NA in this dataset)
suicide.data <- na.omit(suicide.data)

#Add column "age" whose value is average of the ranges of ages given
avg_age = (suicide.data$age_lb + suicide.data$age_ub)/2
for (i in 1:length(avg_age)) {
  if (avg_age[i] == 97.5) {
    avg_age[i] <- 80
  }
}
suicide.data <- cbind(suicide.data,age=avg_age)
#drop age_lb, age_ub columns
suicide.data$age_lb = NULL
suicide.data$age_ub = NULL
#drop columns with redundant information - suicides per 100k population and gdp per capita 
suicide.data$suicides.100k.pop = NULL
suicide.data$gdp_per_capita....= NULL
#drop generation column
suicide.data$generation = NULL

#create tbl_df object
df <- tbl_df(suicide.data)
df <- arrange(df, country, year, age, sex)



