# Final Project code.
c863 = read.csv("Desktop/Project/Data/y2hchd1863.csv")
head(c863)
#Generate a histogram to visually check for a normal distribution.
hist(c863$Area, breaks=30)
#Perform a Shapiro-Wilk test to check the normality of the distribution.
shapiro.test(c863$Area)
#Load ggplot.
library(ggplot2)
#Load data for the Kruskal-Wallis test.
chd1data = read.csv("Desktop/Project/Data/ratio863.csv")
chd1data
#Put the data in the correct order of the alanine mutants.
orderedmutants<- factor(chd1data$Rtf1, levels=c("EV","WT","3-5A", "5-7A", "8-9A", "11A", "15-16A", "18-19A","21-22A", "25-27A", "28-30A"))
#Ggplot function for all three replicates of Y2H Chd1(863-1468) and all Rtf1 mutants.
ggplot(chd1data, aes(x=orderedmutants, y=Area)) + geom_point(position=position_jitter(width=0.4), color="darkcyan") + theme_bw() + ggtitle("Yeast Two-Hybrid Growth of Rtf1 Alanine Scanning Mutants") +theme(plot.title = element_text(hjust = 0.5)) + xlab("Alanine Scanning Mutants in Rtf1") + ylab("Relative Growth Area")
#Take the square root of the area data for a data transformation. 
sqrtchd1863 <- data.frame(Square_Root = c(c863$Area))
sqrtdata <- sqrt(sqrtchd1863)
head(sqrtdata)
# Visually check the distribution of the square root transformed data.
hist(sqrtdata$Square_Root, breaks=30, main="Square Root Transformation of Area Growth Data", xlab="Area of Growth")
#Perform Kruskal-Wallis test. 
kruskal.test(Area~ Rtf1, data=chd1data)


