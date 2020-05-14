############################################################
#MASTER e-COSIM
#Cours Initiation Programmation - Christophe Cariou
#Rendu Exerice Chapitre 5 - pour le 11/03/2020
#Renaud BERNARD - R version 3.6.1 (2019-07-05)
############################################################

options(encoding ="UTF-8")
maTable <- read.csv2("table_exercice.csv",stringsAsFactors = FALSE)
head(maTable) # Importation de la table et vérification si OK
library(stringr) # Appel library
library(dplyr) # Appel library
  
### Les librairies et les données
################################################
# Q1 - Nous allons travailler sur la table suivante :
## d'un côté, nous ne gardons ni les reprises, ni les documentaires
## ni les films ayant fait moins de 20 000 entrées ;
## d'un autre côté, nous n'avons plus besoin des colonnes reprise et rang.
## Ecrivez la ou les lignes de commande permettant d'obtenir cette nouvelle table.
## Quelles sont ses dimensions ?
########################
'%notin%'<-Negate('%in%') #Création d'un négateur de %IN%

nrow(maTable) #Regarder le nombre total de ligne de la table originale

tableQ1 <- maTable[maTable$reprise==FALSE & maTable$entrees>20000 & maTable$genre %notin% c('Documentaire'),]
head(tableQ1)
tableQ1$reprise <- NULL #Suppression des reprises
head(tableQ1)
tableQ1$rang <- NULL #Suppression des rangs
head(tableQ1)
nrow(tableQ1)

################################################
# Q2 - (Sur la table construite en Q1) Deux types d'erreur
## se sont glissés dans la variable titre_original :
## d'une part, cette variable a des espaces en début et en fin de titre (3 films) ;
## d'autre part, certaines minuscules ont été transformées en majuscules - ou inversement (2 films).
## Ces erreurs font que 5 films ont un titre original alors qu'ils ne devraient pas.
## Vous allez corriger dans l'ordre chacune de ces deux erreurs (sans créer de nouvelles colonnes).
## Combien de films ont le même titre ?
########################
##Nettoyage
tableQ2bis <- tableQ1[!is.na(tableQ1$titre_original),]
head(tableQ2bis)

tableQ2bis$titre_original <- str_trim(tableQ2bis$titre_original) #Enlever espaces début & fin string
tableQ2bis$titre_original <- tolower(tableQ2bis$titre_original) #Mettre tout les titres originaux en minuscule
tableQ2bis$titre <-tolower(tableQ2bis$titre) #Mettre tout les titres en minuscule pour faire nos tests


head(tableQ2bis$titre) #Vérification titre Lowercase
head(tableQ2bis$titre_original) #Vérification titre_original Lowercase

##Comptage
nrow(tableQ2bis[tableQ2bis$titre == tableQ2bis$titre_original,])
tableQ2bis[tableQ2bis$titre == tableQ2bis$titre_original,] # affichage de la liste

##Vrais modifications
tableQ2 <- tableQ1
nrow(tableQ2[is.na(tableQ2$titre_original),]) 
###Supprmier mauvais espaces
tableQ2$titre_original <- str_trim(tableQ2$titre_original)
###Supprmier Problèmes Maj
tableQ2[!is.na(tableQ2$titre_original) & tolower(tableQ2$titre)==tolower(tableQ2$titre_original),]$titre_original <- NA
###Vérification finale
nrow(tableQ2[is.na(tableQ2$titre_original),]) 

######[VIDEO CORRECTION C06c 22:30]

################################################
# Q3 - (Sur la table corrigée en Q2) Nous n'avons pas besoin du titre original
## mais uniquement de savoir si le titre original est le même que le titre français ou pas. 
## Pour ce faire, nous allons construire une nouvelle variable / colonne que nous nommerons titre_fr :
## elle prendra la valeur TRUE lorsque titre_original vaut NA et la valeur FALSE sinon.
## Une fois cela fait, nous créons une nouvelle table sans la colonne titre_original.
########################

#Ajout nouvelles colonnes
tableQ3 <- tableQ2
head(tableQ3)
## Ajout colonne défaut
tableQ3$titre_fr <- FALSE
head(tableQ3)
## Remplissage colonne titre_fr if TRUE
tableQ3[is.na(tableQ3$titre_original),]$titre_fr <- TRUE
head(tableQ3)
## Nouvelle table
tableQ3bis <- tableQ3[,-3]
head(tableQ3bis)  
  
################################################
# Q4 - (Sur la table construite en Q3) Est-il stratégique de traduire le titre d'un film ?
## Pour répondre à cette question, nous devons d'abord nous concentrer sur les films non français ;
## vous créer cette table. Ensuite, nous calculons le nombre de films,
## la moyenne et la médiane des entrées pour les titres traduits et non traduits. Réponse ?
########################

# Sélection de tout les films étrangers
tableQ4 <- tableQ3bis[tableQ3bis$pays!="France",]
head(tableQ4)
# Résumé général
summary(tableQ4)
summary(tableQ4$titre_fr)
# Nombre de titre - Moyenne - Médiane
nrow(tableQ4)
mean(tableQ4$titre_fr)
median(tableQ4$titre_fr)

################################################
# Q5 - (Sur la table construite en Q3) Est-ce intéressant de refaire une nouvelle version d'un film ?
## Pour répondre à cette question, nous devons d'abord identifier ces films :
## ils contiennent "(2019)" dans leur titre ; nous créons une nouvelle variable/colonne
## nommée reboot qui prend la valeur TRUE ou FALSE.
## Ensuite, nous calculons le nombre de films, la moyenne et la médiane
## des entrées pour les films rebootés vs non rebootés. Réponse ?
########################

# Copie de la table
tableQ5 <- tableQ3bis
# Création de la nouvelle colonne valanyt FALSE par défaut
tableQ5$reboot <- FALSE
head(tableQ5)
# On remplie TRUE si le titre comporte '(2019)' 
tableQ5[str_detect(tableQ5$titre, fixed("(2019)")),]$reboot <- TRUE
head(tableQ5)


################################################
# Q6 - (Sur la table corrigée en Q5) Nous ne voulons qu'un genre "Animation",
## il convient donc de corriger "Animation 3D". Pour chaque genre de films,
## nous voulons connaître le nombre de films ainsi que le titre et la nationalité
## du film ayant réalisé le plus d'entrées.
########################

tableQ6 <- tableQ5
# Suppression du ' 3D' pour ne garder que 'Animation'
tableQ6$genre <- str_remove(tableQ6$genre, " 3D")
# Vérification si OK
sort(unique(tableQ6$genre))

# Calcul Statistiques
summarise(group_by(tableQ6, genre), films_nb=n(), titre_max=first(titre, order_by=entrees), nationalite_max=first(pays, order_by=entrees))

################################################
# Q7 - Exporter la table corrigée en Q5 avec les colonnes dans l'ordre suivante :
## identifiant, titre, titre_fr, reboot, genre, pays, entrees.
## La table sera nommée 07_table_exercice.csv.
########################

tableQ7 <-tableQ5
# Création fichier
fichier_export <-  "chapitre_06_renaud_bernard.csv"
# Ecriture du fichier
write.table(tableQ7, file= fichier_export, sep=";", row.names=FALSE)
# Vérification
read.table(fichier_export, sep=";", header=TRUE, encoding="UTF-8", stringsAsFactors=FALSE)

## FIN

