# Load necessary libraries
library(dplyr)
library(readr)

# Step 1: Load the CSV file from the GitHub URL
url <- "https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv"
laps <- read_csv(url)
laps

# Step 2: Filter for only running activities
laps <- laps %>% filter(sport == "Running")

# Step 3: Remove walking and abnormally fast laps
laps_filtered <- laps %>%
  filter(
    minutes_per_mile > 5 & minutes_per_mile <= 10,    # Remove paces over 10 and below 5 min/mile
    timestamp   > 1                                             # Remove records with elapsed time <= 1 minute
  )

# Step 4: Create a new categorical variable for pace
laps_filtered <- laps_filtered %>%
  mutate(
    pace = case_when(
      minutes_per_mile < 6 ~ "fast",
      minutes_per_mile >= 6 & minutes_per_mile <= 8 ~ "medium",
      minutes_per_mile > 8 ~ "slow"
    )
  )

# Step 5: Create a categorical variable for form based on year
laps_filtered <- laps_filtered %>%
  mutate(form = ifelse(year == 2024, "new", "old")
  )

# Step 6: Calculate average steps per minute by form and pace
steps_summary <- laps_filtered %>%
  group_by(form, pace) %>%
  summarise(avg_steps_per_minute = mean(total_distance_m, na.rm = TRUE)) %>%
  ungroup() %>%
  pivot_wider(names_from = pace, values_from = avg_steps_per_minute) 
##%>%  select(form, slow, medium, fast)

# Print steps summary table
print(steps_summary)

# Step 7: Summarize steps per minute for two date ranges in 2024
# Filter records for January - June and July - October 2024
jan_june_summary <- laps_filtered %>%
  filter(year == 2024, month %in% 1:6) %>%
  summarise(
    min_steps_per_minute = min(total_distance_m, ),
    mean_steps_per_minute = mean(total_distance_m, ),
    median_steps_per_minute = median(total_distance_m, ),
    max_steps_per_minute = max(total_distance_m, )
  )

july_oct_summary <- laps_filtered %>%
  filter(year == 2024, month %in% 7:10) %>%
  summarise(
    min_steps_per_minute = min(total_distance_m, na.rm = TRUE),
    mean_steps_per_minute = mean(total_distance_m, na.rm = TRUE),
    median_steps_per_minute = median(total_distance_m, na.rm = TRUE),
    max_steps_per_minute = max(total_distance_m, na.rm = TRUE)
  )

# Print summary for January - June 2024
print(jan_june_summary)

# Print summary for July - October 2024
print(july_oct_summary)
