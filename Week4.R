#why dplyr? it makes it easier to 
#manipulate tables

#tidyr helps you convert between different 
#data formats, which can help with plotting
#and analysis

#they are more transparent than base R 
#functions (stuff that automatically 
#comes with R)

#set-up: install the tidyverse package 
#that has dplyr and tidyr
install.packages("tidyverse")

#Learning dplyr and Tidyr: 
#select, filter, and pipes
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)

#surveysdot uses base r, which creates a data frame
#surveys uses the tidyverse function, which creates
#a tibble, which is a special kind of data frame
#surveysdot <- read.csv("data/portal_data_joined.csv")
class(surveys)
#class(surveysdot)
#select columns
month_day_year <- select(surveys, month, day, year)
genus_species_taxa <- select(surveys, genus, 
                             species, taxa)

#no ids
surveys_no_ids <- select(surveys, -c(plot_id,record_id, species_id))

#filtering by equals (number)
surveys_1981 <- filter(surveys, year == 1981)

#filtering by equals (string)
surveys_neotoma <- filter(surveys, genus == "Neotoma")

surveys_rodent_bird <- filter(surveys, 
                              taxa == "Rodent" | taxa == "Bird" | taxa == "Fish")
#can we think of another way?
surveys_rodent_bird_2 <- filter(surveys, 
                                taxa %in% c("Rodent", "Bird"))

identical(surveys_rodent_bird, surveys_rodent_bird_2)

#filtering by range with base R 
filter(surveys, year %in% c(1981:1983))
#why shouldn't you do: 
#filter(surveys, year == c(1981, 1982, 1983))
#??

#filtering by multiple conditions
bigfoot_with_weight <- filter(surveys, hindfoot_length > 40 & !is.na(weight))

#ord's kangaroo rats who were in the control plot
control_ordii <- filter(surveys, species == "ordii" ??? plot_type == "Control")



#multi-step process
small_animals <- filter(surveys, weight < 5)

#this is slightly dangerous because you have 
#to remember to select from small_animals, 
#not surveys in the next step
small_animal_ids <- select(small_animals, record_id, plot_id, species_id)

#same process, using nested functions
small_animal_ids <- select(filter(surveys, weight < 5), record_id, plot_id, species_id)

#same process, using a pipe
#Cmd  Shift  M
#note our select function no longer explicitly calls the tibble as its first element
small_animal_ids <- filter(surveys, weight < 5) %>% select(record_id, plot_id, species_id)

#same as
small_animal_ids <- surveys %>% 
  filter(.,weight < 5) %>% select(.,record_id, 
                                  plot_id, species_id)

#how to do line breaks with pipes
surveys %>% filter(month==1)

#good:
surveys %>% 
  filter(month==1)

#not good:
surveys%>% filter(month==1)
#what happened here?
mini<- surveys[190:209]
table(mini$species_id)
nrow(mini)
test<- mini%>% filter(species_id %in% c("DM","NL"))















##TARA
# Homework 3 Review -----
#Load your survey data frame with the read.csv() function. Create a new data frame called surveys_base with only the species_id, the weight, and the plot_type columns. Have this data frame only be the first 5,000 rows. 


#Convert both species_id and plot_type to factors. Remove all rows where there is an NA in the weight column. 


#Explore these variables and try to explain why a factor is different from a character. Why might we want to use factors? Can you think of any examples?

#CHALLENGE: Create a second data frame called challenge_base that only consists of individuals from your surveys_base data frame with weights greater than 150g.















# Data Manipulation Part 1b ----
# Goals: learn about mutate, group_by, and summarize
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)


# Adding a new column
# mutate: adds a new column
surveys <- surveys %>%
  mutate(weight_kg = weight/1000)

# Add other columns


# Filter out the NA's


# Group_by and summarize ----
# A lot of data manipulation requires us to split the data into groups, apply some analysis to each group, and then combine the results
# group_by and summarize functions are often used together to do this
# group_by works for columns with categorical variables 
# we can calculate mean by certain groups
surveys %>%
  group_by(sex) %>%
  mutate(mean_weight = mean(weight, na.rm = TRUE)) 


# multiple groups
surveys %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))



# remove na's


# sort/arrange order a certain way


# Challenge
#What was the weight of the heaviest animal measured in each year? 
##Return a table with three columns: year, weight of the heaviest animal in grams, 
##and weight in kilograms, arranged (arrange()) in descending order, from heaviest to lightest. 
#(This table should have 26 rows, one for each year
surveys %>% group_by(max(weight)) 
##%>% summarize(group_by = mean(weight, na.rm = TRUE))
surveys <- c(, "year,weight",)
surveys%>%
  select.list(year,record_id,weight) %>%
  group_by(year) %?%
  filter(!is.na(weight)) %>%
  mutate(weight_kg=weight/1000) %>%
  group_by(year) %>%
  summarize(max_weight_g=max(weight), max_weight_kg=max(weight)) %>%
  arrange()
  summarize()









#Try out a new function, count(). Group the data by sex and pipe the grouped data into the count() function. How could you get the same result using group_by() and summarize()? Hint: see ?n.

















