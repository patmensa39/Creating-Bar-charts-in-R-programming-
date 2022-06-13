### Creating bar charts ###
### Bar chart uses categorical variables
if(!require("pacman")) install.packages("pacman") 
if(!require("tidyverse")) install.packages("tidyverse") 
pacman::p_load(pacman, tidyverse) #loading pacman and tidyverse 

### Another way 
library(pacman)
library(tidyverse)

# using the diamond data set from ggplot 2
?diamonds
diamonds

### If the dataset is on your computer, then you have to set your working directory
setwd("/Users/philant/Desktop/R programming/data") #my working directory
getwd() # knowing your working directory 

diamond_data<-read.csv("diamonds.csv", header = TRUE)
diamond.data<-read_csv("diamonds.csv")
view(diamond_data)

## Frequencies of the barplot 
### The plot function is used to obtain information on the generic x and y plotting 
?plot
### The bar plot is also used to create a plot with vertical and horizontal bars 
?barplot
### Bar chart uses categorical variables, discrete variables or continuous variables grouped in class intervals

## The is a simple method of making a bar plot 
plot(diamonds$cut, col = heat.colors(5), main = "Bar chart of diamond cuts") 
plot(diamonds$color, col = rainbow(7), main = "Bar chart of diamond colors")

### Another way of doing this is by using what we call piping 
diamonds %>% select(cut) %>% plot(main = "Bar chart of Diamond cuts", col = heat.colors(5) ) 

diamonds %>% select(color) %>% plot()
title("Bar chart of Diamond colors")


plot(diamonds$clarity, col = terrain.colors(6), main = "Bar chart of Diamond clarity")
diamonds %>% select(clarity) %>% plot(main = "Bar chart of Diamond clarity")


diamonds %>% select(clarity) %>% barplot() # this will give error because the height must be a vector or a matrix
### When this happens, the best thing to do is to create a frequency vector with table. This will put the data in
### appropriate format
diamonds %>% select(clarity) %>% table() %>% barplot()
title("Bar chart of Diamond clarity")

# Sorting the diamond colors in decreasing values 
diamonds %>% select(color) %>% table() %>% sort(decreasing = TRUE) %>% barplot() # sort in decreasing order 

# Sorting the diamond cut in ascending values
diamonds %>% select(cut) %>% table() %>% sort(decreasing = FALSE) %>% barplot() # sort in ascending order

# Adding options to the plot 
diamonds %>% select(color) %>% table() %>% #sort the table 
  sort(decreasing = FALSE) %>% #arranging in ascending order  
  barplot(
    main = "Color of diamonds", # title
    sub = "(Source: ggplot2:: diamonds dataset)", # subtitle
    horiz = FALSE, # drawing horizontal bar charts
    ylab = "Frequency", #naming the y axis
    xlab = "Color of diamonds", #naming the x axis
    ylim = c(0,10000),  #limits for y axis
    col = rainbow(7), # colors for the plot
    # boarder = NA, # I decided to turn it of because I don't want to use it 
  )

# Another way 
diamonds %>% select(color) %>% table() %>% #sort the table 
  sort(decreasing = FALSE) %>% #arranging in ascending order  
  barplot(
    main = "Color of diamonds", # title
    sub = "(Source: ggplot2:: diamonds dataset)", # subtitle
    horiz = TRUE, # drawing horizontal bar charts
    ylab = "Color of diamonds", #naming the x axis 
    xlab = "Frequency", #naming the y axis
    xlim = c(0,10000),  #limits for y axis
    col = rainbow(7), # colors for the plot
    # boarder = NA, # I decided to turn it of because I don't want to use it 
  )


### Side-by-side plots of frequencies 
diamonds %>% select(color, clarity) %>% plot() # this is a 100% stack bar 
#this does not not tell you what the different colors mean

# the best thing is to create a table 
data<- diamonds %>% select(color, clarity) %>% table() %>% print()
#this will show a table in a console and show all the frequencies of each combination 

# Next is to create a graph from the stacked bars
data %>% barplot(legend = rownames(.)) # this draws the plot with legends
## add colors to see well 
data %>% barplot(legend = rownames(.), col = rainbow(6)) # this draws the plot with legends

## Creating side by side bars 
data %>% barplot(legend = rownames(.),beside =TRUE )
## add colors to see well 
data %>% barplot(legend = rownames(.),beside =TRUE, col = rainbow(6))

dev.off() # clear plots

#rm(list = ls()) # clear environment 










