#This is the Practical Assessment -UBS Asset Management supporting coding and Analytical skills
#PART 1:
#Import the data
df <- read.csv("/Users/kalaivanikarthik/Downloads/data.csv")
head(df)
#Do some basic data inspections and cleanings (if necessary), e.g. are there NAs, etc.
apply(is.na(df),2,sum)
colSums(is.na(df))
#There are no nas from the above code.
#Make some visualizations (summary tables, distributions, box plots, etc.) – do not spend time on layout.
#Install the "here","janitor","dplyr" and "skimr" package to use skim_without_charts and glimpse for the summary of the data frame, including the number of columns and rows.
#skimr package has so many options and I chose one of the function to study the summary
skimr::skim_without_charts(df)
glimpse(df)
#BOX PLOT 
install.packages("ggplot2")
library("ggplot2")
p <- ggplot(df, aes(x=market_fee, y=actual_fee)) +geom_boxplot()#One could alter the x and y variables 
p
#Estimate the following metrics:
#What is the average “market_fee” and average “actual_fee” of Strategy A1, B1 and C1?
df %>% group_by(investment_strategy) %>% summarise(market_fee=mean(market_fee))
df %>% group_by(investment_strategy) %>% summarise(actual_fee=mean(actual_fee))
#What is the largest “pricing_deviation” (positive and negative) of Strategy B1
df %>% group_by(investment_strategy) %>% summarise(pricing_deviation=max(pricing_deviation))
#Arranging the column "pricing deviation"
pricing_dev <- df %>% arrange(-pricing_deviation)
View(pricing_dev)

