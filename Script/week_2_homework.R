set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

# Initial hw2 vector (replace with your actual hw2 vector)
##hw2 <- c(NA, 15, 25, 37, 40, NA, 14, 18, 20, NA, 30, 35, 38, 45)

# Remove all NAs
hw2_clean <- na.omit(hw2)
hw2_clean

# Select all numbers between 14 and 38 inclusive
prob1 <- hw2_clean[hw2_clean >= 14 & hw2_clean <= 38]
prob1

# Multiply each number in prob1 by 3
times3 <- prob1 * 3
times3

# Add 10 to each number in the times3 vector
plus10 <- times3 + 10
plus10

# Select every other number in the plus10 vector (first, third, fifth, etc.)
every_other <- plus10[seq(1, length(plus10), by = 2)]

# Output the result
every_other
