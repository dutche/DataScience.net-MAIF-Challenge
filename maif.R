setwd("~/kaggle/challenge_26_data")

rm(list=ls())
gc()

library(data.table)

data <- fread("ech_apprentissage.csv")

names(data)


# Cleaning the data -------------------------------------------------------

unique(data$marque)

#Replacing all the values of NR ("Non Renseigné") by NA
data[data == "NR"] <- NA
data$codepostal[data$codepostal == "NR"] <- NA
data

max(data$codepostal, na.rm = "TRUE")
#ARMEE