#Importing data
## Import .csv files into Rstudio and combine Math and Portuguese datasets. 
library(dplyr)
library(tidyverse)

Student_Mat<- read.csv("/Users/jamie/Documents/GitHub/programming-group-project/data/student-mat.csv", sep = ";", quote = "")
Student_Mat<- mutate(Student_Mat, subject='mat' )

Student_Por<- read.csv("/Users/jamie/Documents/GitHub/programming-group-project/data/student-por.csv", sep = ";", quote = "")
Student_Por<- mutate(Student_Por, subject='por' )

Student_Data<- rbind(Student_Mat, Student_Por)

#Export combined file for other group members
write.csv(Student_Data, "/Users/jamie/Documents/GitHub/programming-group-project/data/student-data.csv")

#Transform attribute 'schoolsup' into: 'yes'=1, 'no'=0
Student_Data$schoolsup<-ifelse(Student_Data$schoolsup=="\"yes\"", 1, 0)
Student_Data$schoolsup<-as.integer(Student_Data$schoolsup)

#Transform attribute 'famsup' into: 'yes'=1, 'no'=0
Student_Data$famsup<-ifelse(Student_Data$famsup=="\"yes\"", 1, 0)
Student_Data$famsup<-as.integer(Student_Data$famsup)

#Transform attribute 'paid' into: 'yes'=1, 'no'=0
Student_Data$paid<-ifelse(Student_Data$paid=="\"yes\"", 1, 0)
Student_Data$paid<-as.integer(Student_Data$paid)

#Transform attribute 'activities' into: 'yes'=1, 'no'=0
Student_Data$activities<-ifelse(Student_Data$activities=="\"yes\"", 1, 0)
Student_Data$activities<-as.integer(Student_Data$activities)

#Transform attribute 'nursery' into: 'yes'=1, 'no'=0
Student_Data$nursery<-ifelse(Student_Data$nursery=="\"yes\"", 1, 0)
Student_Data$nursery<-as.integer(Student_Data$nursery)

#Transform attribute 'higher' into: 'yes'=1, 'no'=0
Student_Data$higher<-ifelse(Student_Data$higher=="\"yes\"", 1, 0)
Student_Data$higher<-as.integer(Student_Data$higher)

#Transform attribute 'internet' into: 'yes'=1, 'no'=0
Student_Data$internet<-ifelse(Student_Data$internet=="\"yes\"", 1, 0)
Student_Data$internet<-as.integer(Student_Data$internet)

#Transform attribute 'romantic' into: 'yes'=1, 'no'=0
Student_Data$romantic<-ifelse(Student_Data$romantic=="\"yes\"", 1, 0)
Student_Data$romantic<-as.integer(Student_Data$romantic)

#Tranform attribute 'absences' into: range (0-93) 'low'<=4; 'high'>=5

#Tranform attribute 'G1' from chr to int
library(readr)
Student_Data$G1<-readr::parse_number(Student_Data$G1) 
Student_Data$G1<-as.integer(Student_Data$G1)

#Tranform attribute 'G2' from chr to int
Student_Data$G2<-parsed_y<-readr::parse_number(Student_Data$G2)
Student_Data$G2<-as.integer(Student_Data$G2)

glimpse(Student_Data)
summary(Student_Data)

