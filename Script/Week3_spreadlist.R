## other data types
##lists
c(4,6,"dog")
list(4,6,"dog")
?list
class(a)
str(a)
#data frames
letters
data.frame(letters)
df<-data.frame(letters)
t(df)
length(df)
dim(df)
nrow(df)
ncol(df)
#factors
animals<- factor(c("pigs","duck","duck","goose", "goose"))
animalsclass(animals)
levels(animals)
nlevels(animals)





animals<- factor(x=animals,level=c("goose","pigs","duck") )
animals
year<-factor(c(1978,1980,1934,1979))
year

class(year)
as.numeric(animals)
levels(year)
year<-as.numeric(as.character(year))
year
as.character(animals)
?read.csv
getwd()
file_loc<- 'data/portal_dara'
surveys<- read.csv("data/portal_data_joined.csv")
##   record_id month day year plot_id species_id sex hindfoot_length weight   genus
## 1         1     7  16 1977       2         NL   M              32     NA Neotoma
## 2        72     8  19 1977       2         NL   M              31     NA Neotoma
## 3       224     9  13 1977       2         NL                  NA     NA Neotoma
##    species   taxa plot_type
## 1 albigula Rodent   Control
## 2 albigula Rodent   Control
## 3 albigula Rodent   Control
##  [ reached 'max' / getOption("max.print") -- omitted 34783 rows ]
## [1] "data.frame"
head_surveys <- surveys[1:6, ]
head_surveys <- surveys[1:10,-1] 
head_surveys

nrow(surveys)
ncol(surveys)
summary.data.frame(surveys)
?summary.data.frame
surveys[1,5]
surveys[c(1,5,24,3001),]
surveys[,1]
surveys[1:5,]
dim(surveys[,1:5])
dim(surveys[,1:5])
dim(surveys[1])
head(surveys,1)
surveu['record_id']
colnames(surveys)
dimsurveys[c('record_id','year','day')]
cols_to_grab= c('record_id,'day','year')
head(surveys,n=10)
tail(surveys)
head(surveys)
surveys[1:6]
head(surveys["genus"])
head(surveys[["genus"]]
str(surveys)
surveys$genus


survey[1,]
surveys$plot_id
class(surveys$hindfoot_lenghth)
t_surveys
install.packages('tidyverse')
library(tidyverse)
t_surveys<-read_csv('data/portal_data_joined.csv')
class(t_surveys)
t_surveys


















?factor






install.packages("tidyverse")
library(tidyverse)