library(tidyverse)
surveys<- read.csv("data/portal_data_joined.csv")
surveys
##Group data by genus and plot_type, then calculate mean hindfoot_length

surveys_grouped<- surveys%>% filter(!is.na(hindfoot_length))%>%
  group_by(genus, plot_type) %>% 
  summarise(mean_hindfoot_length=  mean(hindfoot_length,na.rm=TRUE),.groups = "drop")




##Pivot to wide format with plot_type as columns
surveys_wide <- surveys_grouped %>%
  pivot_wider(names_from = plot_type, values_from = mean_hindfoot_length)

# Step 4: Sort by the Control column
surveys_wide <- surveys_wide %>%
  arrange(Control)
# View the final result
print(surveys_wide)



  ##Create a weight_cat variable
# Step 1: Calculate 1st and 3rd quartiles of weight
weight_quartiles <- quantile(surveys$weight, probs = c(0.25, 0.75), na.rm = TRUE)
q1 <- weight_quartiles[1]
q3 <- weight_quartiles[2]
weight_quartiles

# Step 2a: Create weight_cat using ifelse()
surveys <- surveys %>%
  mutate(weight_cat_ifelse = ifelse(
    is.na(weight), NA,
    ifelse(weight <= q1, "small",
           ifelse(weight > q1 & weight < q3, "medium", "large"))
  ))
surveys

# Step 2b: Create weight_cat using case_when()
surveys <- surveys %>%
  mutate(weight_cat_case_when = case_when(
    is.na(weight) ~ NA_character_,
    weight <= q1 ~ "small",
    weight > q1 & weight < q3 ~ "medium",
    weight >= q3 ~ "large"
  ))
surveys


  