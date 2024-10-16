survey<- read.csv("data/portal_data_joined.csv")
survey
#surveys_base with only the species_id, the weight, and the plot_type columns
survey1<- survey[-c(1:5)]
survey1

survey2<- survey1[-c(2:3)]
survey2

surveys_base<- survey2[-c(3:5)]
surveys_base

#Have this data frame only be the first 5,000 rows
surveys_base_5000<- surveys_base[(1:5000),]
surveys_base_5000

#Convert both species_id and plot_type to factors

factor(surveys_base_5000$species_id)
experiment<- levels(surveys_base_5000$species_id)
experiment

factor(surveys_base_5000$plot_type)

#Remove all rows where there is an NA in the weight column

surveys_base_5000_weight_NA<- na.omit(surveys_base_5000, col="weight")
surveys_base_5000_weight_NA



##CHALLENGE:
challenge_base<- surveys_base_5000[surveys_base_5000$weight> 150, ]
challenge_base

