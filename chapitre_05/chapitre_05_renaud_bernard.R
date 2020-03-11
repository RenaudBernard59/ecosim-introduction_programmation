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

nbGenreTotal <-nrow(maTable) #Nombre total de lignes

'%notin%'<-Negate('%in%') #Création d'un négateur de %IN%

genresSupprimees <- maTable[maTable$genre %in% c("Animation", "Animation 3D", "Documentaire"),]
nbGenreSupprimmes <-nrow(genresSupprimees) # Nombre de liges corresponantes aux valeurs à supprimer

#Création de la Nouvelle table
newTable <- maTable[maTable$genre %notin% c("Animation", "Animation 3D", "Documentaire"),]
head(newTable) # On regarde au début de la table
tail(newTable) # On regarde à la fin de la rable
#On s'assure que newTable ne comprends plus les  valeurs non volulues
newTable[newTable$genre %in% c("Animation", "Animation 3D", "Documentaire"),]

#Si l'on veut vraiment s'asurer que l'on a bien supprimer le nombre correcte de valeurs
nbGenrFinal <- nrow(newTable) #Nombre total de lignes après modification

nbGenreTotal
nbGenreSupprimmes
nbGenrFinalCalculer <- nbGenreTotal - nbGenreSupprimmes

#Si ces 2 valeurs sont égales c'est que l'on a bien supprimer les bonnes valeurs et aucune autre
nbGenrFinal
nbGenrFinalCalculer

# Les questions suivantes devront être réalisées sur la table construite en Q1.
###############☻
# Q2 - Combien de nationalités différentes ?
nationsGroup <-group_by(newTable, pays)
summarise(nationsGroup, NbNationalites=n())

# Q3 - Combien de films et combien d'entrées en médiane pour chaque nationalité ?
tableQ3 <-summarise(nationsGroup, NbFilm=n_distinct(titre), NbMedianEntrees=median(entrees))
tableQ3

# Q4 - Affichez la table Q3 dans l'ordre décroissant du nombre de films. 
tableQ3[order(tableQ3$NbFilm, decreasing=TRUE),]

# Q5 - Vous ne gardez que les pays qui ont proposé plus de 4% du total des films.
NbTotalFilm <- nrow(nationsGroup)
tableQ5 <- summarise(nationsGroup, NbFilm=n_distinct(titre), pourcentage=round(NbFilm()/NbTotalFilm*100,0))
tableQ5bis <- tableQ5[order(tableQ5$pourcentage, decreasing=TRUE),]
# Résultat si l'on recherche les pays où le pourcentage représente STRICTEMENT plus de 4%
tableQ5bis[tableQ5bis$pourcentage > 4,]
# # Résultat si l'on recherche les pays où le pourcentage représente plus ou égal de 4%
tableQ5bis[tableQ5bis$pourcentage >= 4,]

# Q6 - Pour chaque genre, quel est le nombre d'entrées maximum et la nationalité du film ?
genresGroup <-group_by(newTable, genre)
tableQ6 <-summarise(genresGroup, nbEntrees=sum(entrees), nationalite=last(pays))
tableQ6

# Q7 - A partir de la table précédente Q6, quels pays dominent et combien de genres dominent-ils ? 
tableQ7 <- summarise(group_by(tableQ6, nationalite), NbEntrees=max(nbEntrees), NbGenre=n_distinct(genre))
tableQ7[order(tableQ7$NbEntrees, decreasing = TRUE),]
