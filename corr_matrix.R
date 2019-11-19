print(getwd())
df<-read.csv("suicide_data.csv")
#print(head(df))

df2<-data.frame(head(df$suicides_no,300),head(df$population,300),head(df$year,300),head(df$gdp_per_capita....,300))
#print(sapply(df2,class))  
cormat <- round(cor(df2),2)  #Finding correlation matrix
print(head(cormat))

#install.packages("ggplot2") 
#install.packages("reshape2")
library(reshape2)
melted_cormat <- melt(cormat)    #Changing format to plot a chart
print(head(melted_cormat))

library(ggplot2)
plot_tile<-ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value,label=value)) + 
  geom_tile()     #plot basicheatmap
print(plot_tile)
plot_text<-plot_tile+geom_text()    #Give values to each cell
print(plot_text)

#Conclusion:
#We get which parameters are highly correlated with the help of this visualization,
#Now we can verify these values by using in-built function and derive insights.