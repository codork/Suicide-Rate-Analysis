

print(getwd())
df<-read.csv("suicide_data.csv")
#print(head(df))


df <- na.omit(df)

#Add column "age" whose value is average of the ranges of ages given
avg_age = (df$age_lb + df$age_ub)/2
for (avg in avg_age) {
  if (avg == 97.5) {
    avg <- 80
  }
}
df <- cbind(df,age=avg_age)
#drop age_lb, age_ub
df$age_lb = NULL
df$age_ub = NULL

df2<-data.frame(head(df$suicides_no,649),head(df$population,649),head(df$gdp_per_capita....,649,head(df$age,649)))
#print(sapply(df2,class))  
cormat <- round(cor(df2),2)  #Finding correlation matrix
print(head(cormat))

#install.packages("ggplot2") 
#install.packages("reshape2")
library(reshape2)
melted_cormat <- melt(cormat)    #Changing format to plot a chart
print(head(melted_cormat))

library(ggplot2)
#plot_tile<-ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value,label=value)) + 
 # geom_tile()     #plot basicheatmap
#print(plot_tile)
#plot_text<-plot_tile+geom_text()    #Give values to each cell
#print(plot_text)

G=ggplot(melted_cormat)
print(G+geom_tile(aes(Var2,Var1,fill=value))+geom_text(aes(Var2,Var1,label=value)))


#Conclusion:
#We get which parameters are highly correlated with the help of this visualization,
#Now we can verify these values by using in-built function and derive insights.