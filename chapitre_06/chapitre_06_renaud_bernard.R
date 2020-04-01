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

tableQ1 <- maTable[maTable$reprise==FALSE & maTable$entrees>20000 & maTable$genre %notin% c('Documentaire'),]
head(tableQ1)
tableQ1$reprise <- NULL #Suppression des reprises
head(tableQ1)
tableQ1$rang <- NULL #Suppression des rangs
head(tableQ1)


################################################
# Q2 - (Sur la table construite en Q1) Deux types d'erreur
## se sont glissés dans la variable titre_original :
## d'une part, cette variable a des espaces en début et en fin de titre (3 films) ;
## d'autre part, certaines minuscules ont été transformées en majuscules - ou inversement (2 films).
## Ces erreurs font que 5 films ont un titre original alors qu'ils ne devraient pas.
## Vous allez corriger dans l'ordre chacune de ces deux erreurs (sans créer de nouvelles colonnes).
## Combien de films ont le même titre ?
########################



################################################
# Q3 - (Sur la table corrigée en Q2) Nous n'avons pas besoin du titre original
## mais uniquement de savoir si le titre original est le même que le titre français ou pas. 
## Pour ce faire, nous allons construire une nouvelle variable / colonne que nous nommerons titre_fr :
## elle prendra la valeur TRUE lorsque titre_original vaut NA et la valeur FALSE sinon.
## Une fois cela fait, nous créons une nouvelle table sans la colonne titre_original.
########################



################################################
# Q4 - (Sur la table construite en Q3) Est-il stratégique de traduire le titre d'un film ?
## Pour répondre à cette question, nous devons d'abord nous concentrer sur les films non français ;
## vous créer cette table. Ensuite, nous calculons le nombre de films,
## la moyenne et la médiane des entrées pour les titres traduits et non traduits. Réponse ?
########################



################################################
# Q5 - (Sur la table construite en Q3) Est-ce intéressant de refaire une nouvelle version d'un film ?
## Pour répondre à cette question, nous devons d'abord identifier ces films :
## ils contiennent "(2019)" dans leur titre ; nous créons une nouvelle variable/colonne
## nommée reboot qui prend la valeur TRUE ou FALSE.
## Ensuite, nous calculons le nombre de films, la moyenne et la médiane
## des entrées pour les films rebootés vs non rebootés. Réponse ?
########################



################################################
# Q6 - (Sur la table corrigée en Q5) Nous ne voulons qu'un genre "Animation",
## il convient donc de corriger "Animation 3D". Pour chaque genre de films,
## nous voulons connaître le nombre de films ainsi que le titre et la nationalité
## du film ayant réalisé le plus d'entrées.
########################



################################################
# Q7 - Exporter la table corrigée en Q5 avec les colonnes dans l'ordre suivante :
## identifiant, titre, titre_fr, reboot, genre, pays, entrees.
## La table sera nommée 07_table_exercice.csv.
########################


