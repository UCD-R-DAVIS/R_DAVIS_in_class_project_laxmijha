#Introductions R: mathematics
# Incomplete Command 
4+(8*3)^2
#this is a comment
#scientific notation
2/100000
4e3
#mathematical function
exp(1)
exp(3)
exp(4)
log(4)
sqrt(4)
?log
log(4,2)
log(2,4)
log(x-2,base=4)
x<-1
rm(x)
#nested function

sqrt(exp(40))
lof(exp(100))
#six comparison function
mynumber<-6
mynumber==5
mynumber !=5



mynumber>4
munumber<3
mynumber<=-1
#objects name conventions
mynumber<-7
othernumber<- -3
mynumber*othernumber
#object name convention
numSamples<-50
num_samples<-40
#tab completion
rm(list=ls())
#errors and warnings
log_of_word<-log("a_word")
log_of_word
log_of_negative<-log(-2)
log_of_negative



#challenges






elephant1_kg<-3492
elephant2_lb<-7757


elephant1_lb<-elephant1_kg*2.2

elephant2_lb>elephant1_lb
myelephants<-c(elephant1_lb,elephant2_lb)
getwd()


setwd()
d<-read.csv("./data/tail_length.csv")

# creating the files 

dir.create("./lectures")
dir.create("./lectures")

#How R Thinks About Data 
##vectors------
weight_g<-c(50,60,65,82)
weight_one_value<-c(50)
##combine the vectors
animals<-c("mouse","rat","dog")
animals
length(weight_g)
str(weight_g)

weight_g<-c(weight_g,90)
weight_g
##challenge vectors
num_char <- c(1, 2, 3, "a")## chooses lowest common denominator
#vectors have to be the SAME class of values
num_char
num_logical <- c(1, 2, 3, TRUE)
##coerses values to be all the same ,e.g when True is included 
num_logical
char_logical <- c("a", "b", "c", TRUE)
char_logical
tricky <- c(1, 2, 3, "4")
tricky
## Subsetting
animals<-c("mouse","rat","dog","cat")
animals
animals[2]
animals[c(2,3)]
## indexing:take items from a vector and create a new combination of values
weight_g<-c(21,34,39,54,55)
weight_g>50
weight_g[weight_g>50]
##symbols

animals %in% c("rat", "cat", "dog","duck","goat")

animals == c("rat","cat","dog","duck","goat")
