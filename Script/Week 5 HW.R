library(tidyverse)
surveys<- read.csv("data/portal_data_joined.csv")
surveys
surveys_wide<- surveys%>% select( genus, plot_type, hindfoot_length) %>% 
  filter(!is.na(hindfoot_length)) %>% for( same_src(genus, mean(hindfoot_length)(##filter(!is.na(hindfoot_length)) %>% 
                           ## mean(hindfoot_length)))) ##%>% mean(hindfoot_length)

head(surveys_wide)##%>%
  
  arrange(surveys_wide)

  