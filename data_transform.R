library(reshape2)

#set working dir to import csv file
setwd("D:/TYBTech/SCSL/SCSL Project")
getwd()
suicide.data <- read.csv("suicide_data.csv")

#take a look at the data to verify if the import is correct
names(suicide.data)
head(suicide.data)
#omit NA values (all values between two rows are NA in this dataset)
suicide.data <- na.omit(suicide.data)

#Add column "age" whose value is average of the ranges of ages given
avg_age = (suicide.data$age_lb + suicide.data$age_ub)/2
for (avg in avg_age) {
  if (avg == 97.5) {
    avg <- 80
  }
}
suicide.data <- cbind(suicide.data,age=avg_age)
#drop age_lb, age_ub
suicide.data$age_lb = NULL
suicide.data$age_ub = NULL
