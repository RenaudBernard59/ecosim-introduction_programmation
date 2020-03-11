############################################################
#MASTER e-COSIM
#Cours Initiation Programmation - Christophe Cariou
#Rendu Exerice Chapitre 5 - pour le 11/03/2020
#Renaud BERNARD - R version 3.6.1 (2019-07-05)
############################################################
options(encoding ="UTF-8")
maTable <- read.csv2("table_exercice.csv",stringsAsFactors = FALSE)
head(maTable) # Importation de la table et vérification si OK
library(dplyr) # Appel library
# Q1 - Construire une table qui ne contient ni les films d'animation ni les documentaires. 
newTable <- maTable
head(newTable)

# Les questions suivantes devront être réalisées sur la table construite en Q1.



# Q2 - Combien de nationalités différentes ?



# Q3 - Combien de films et combien d'entrées en médiane pour chaque nationalité ?



# Q4 - Affichez la table Q3 dans l'ordre décroissant du nombre de films.



# Q5 - Vous ne gardez que les pays qui ont proposé plus de 4% du total des films.



# Q6 - Pour chaque genre, quel est le nombre d'entrées maximum et la nationalité du film ?



# Q7 - A partir de la table précédente Q6, quels pays dominent et combien de genres dominent-ils ? 


