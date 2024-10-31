#Create a tibble named surveys from the portal_data_joined.csv file.
library(tidyverse)
surveys<- read.csv("data/portal_data_joined.csv")
#Subset surveys using Tidyverse methods to keep rows with weight between 30 and 60,
#and print out the first 6 rows.

surveys1<- filter(surveys, weight>=30) 
surveys1<- filter(surveys, weight<=60)
surveys1
str(surveys1)
head(surveys1)
#Create a new tibble showing the maximum weight for each species + sex combination 
#name it biggest_critters. Sort the tibble to take a look at the biggest and smallest species + sex combinations. 
biggest_critters<- surveys %>%  select(sex, weight) %>% filter(!is.na(weight)) %>%
   arrange(weight)
biggest_critters
tail(biggest_critters)
##Try to figure out where the NA weights are concentrated
##in the data- is there a particular species, taxa, plot, or whatever, where
##there are lots of NA values? 
##There isn’t necessarily a right or wrong answer here, but manipulate
##surveys a few different ways to explore this. Maybe use tally and arrange here.
animal_name <- surveys %>% 
  group_by(species, taxa, plot_id) %>%
summarise(na_count=sum(is.na(weight))) %>% arrange(na_count)
animal_name
##Take surveys, remove the rows where weight is NA and 
##add a column that contains the average weight of each species+sex 
##combination to the full surveys dataframe. 
##Then get rid of all the columns except for species, sex, weight, and 
##your new average weight column. Save this tibble as surveys_avg_weight.
##Take surveys_avg_weight and add a new column called above_average 
##that contains logical values stating whether or not a row’s weight is above 
## average for its species+sex combination (recall the new column we made for this tibble).

surveys_avg_weight<- surveys %>%  select(species, sex, weight) %>% 
  filter(!is.na(weight)) %>% mutate(avg_wt=mean(weight), above_avg = weight > avg_wt) 
surveys_avg_weight

