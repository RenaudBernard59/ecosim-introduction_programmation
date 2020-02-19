############################################################
#MASTER e-COSIM
#Cours Initiation Programmation - Christophe Cariou
#Rendu Exerice Chapitre 4 - pour le 21/02/2020
#Renaud BERNARD - R version 3.6.1 (2019-07-05)
############################################################
options(encoding ="UTF-8")
maTable <- read.csv2("table_exercice.csv",stringsAsFactors = FALSE)
head(maTable) # Importation de la table et vérification si OK

### Q1 - Créer un tableau avec les lignes paires uniquement ?
tableauPaire <- data.frame(seq(2,20,2))
tableauPaire


### Q2 - Combien de films d'animation japonaise ?
nrow(maTable[maTable$genre%in%c("Animation", "Animation 3D") & maTable$pays=="Japon",])

### Q3 - Combien de films chinois ou indiens ?
nrow(maTable[maTable$pays%in%c("Chine", "Inde"),])

### Q4 - Combien de films sont des comédies ?
nrow(maTable[maTable$genre=="Comédie",])

### Q5 - Quel est le pourcentage de films dont le titre français est le titre original ?
nombreTotalFilm <-nrow(maTable)
nombreTotalFilm
nombreFilmTitreEgal <- nrow(maTable[is.na(maTable$titre_original), ])
nombreFilmTitreEgal
rapportTitreEgal <- nombreFilmTitreEgal / nombreTotalFilm
rapportTitreEgal
pourcentageTitreEgal <- rapportTitreEgal * 100
pourcentageTitreEgal

### Q6 - Quel est le titre et le titre original du film suivant :
## le film est une reprise et le titre original diffère du nom français du film ?
titresDifferents <-
estReprise <- maTable[]
maTable[!is.na(maTable$titre_original) & maTable$reprise==TRUE,]$titre


### Q7 - Quel est le nombre d'entrées du plus gros documentaire français ?
# Indications : créer une table, ordonner la table, focaliser sur la première ligne.


### Q8 - Combien de films font plus d'entrées que ce documentaire ?

### Q9 - Combien de films non documentaires font moins d'entrées que ce documentaire ?

### Q10 - Créer un tableau de 10 lignes prises au hasard entre le rang 100 et 200 !
