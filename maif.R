setwd("~/Github/DataScience.net-MAIF-Challenge/")

rm(list=ls())
gc()

library(data.table)
library(dplyr)

zip <- unzip("challenge_26.zip")
data <- fread(zip[1])

names(data)

# Cleaning the data -------------------------------------------------------

#Replacing all the values of NR ("Non Renseigné") by NA
data[data == "NR"] <- NA

data$prime_tot_ttc[data$codepostal == "ARMEE"]
#511.43 496.18 352.91     NA     NA     NA     NA     NA
#When the army is in the dataset the values are not useful. We shoulr put them apart.

summary(data$annee_naissance)
#290 NA

summary(data$annee_permis)
#290 NA

summary(data$puis_fiscale)
#Max at 58 ?? High value maybe to put apart

summary(data$anc_veh)
#Max at 99?? Very old for a vehicule ! To correct, unknown = 99

length(data$energie_veh[is.na(data$energie_veh)])
#413 NA

summary(data$kmage_annuel)

summary(data$crm)
#Ultra important car coefficient bonus -> Il faudra reniveler toutes les primes en les divisant par ce crm pour pouvoir calculer la prime classique.
data <- mutate(data,
               prime_base_ttc = prime_tot_ttc/(crm/100))