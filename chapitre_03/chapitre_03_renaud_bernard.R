#1-Import du fichier '05_table_exercice.csv' type text/csv(-d ';' )
tableau <- read.csv2("05_table_exercice.csv")
#2-Dimensions de la table nbLignes && nbCononnes
nombreLigne <- nrow(tableau)
nombreLigne
nombreColonnes <- ncol(tableau)
nombreColonnes
#3-Liste nomVariables de la table
nomVariableListe <- colnames(tableau)
nomVariableListe
#4-Nom 1st col en "classement"
premiereLigneTableau <- tableau[1,]
premiereLigneTableau
#5-Format données de la table
formatDonneesTableau <- class(tableau)
formatDonneesTableau

formatRang <-class(tableau$rang)
formatRang

formatTitre <-class(tableau$titre)
formatTitre

formatPays <-class(tableau$pays)
formatPays

sormatSpectateurs <-class(tableau$spectateurs)
sormatSpectateurs

sotmatSemaines <-class(tableau$semaines)
sotmatSemaines

formatEn_cours <-class(tableau$en_cours)
formatEn_cours

#6-Changer format col 'titres' & 'pays'> char
tableau$titre <- as.character(tableau$titre)
formatTitre <-class(tableau$titre)
formatTitre

tableau$pays <- as.character(tableau$pays)
formatPays <-class(tableau$pays)
formatPays

#7-Nom film classé 22ème
nomFilm22eme <- tableau$titre[22]
nomFilm22eme

#8-Nombre spectateur pour film 'jocker'
numLingneJoker <- grep('Joker', tableau$titre)
numLingneJoker

nbSpecateursJoker <- tableau$spectateurs[numLingneJoker]
nbSpecateursJoker

#9-Est-ce qu'existe un pays_production vallant 'Allemagne'
paysProdctionAllemagne <- grep('Allemagne', tableau$pays)
paysProdctionAllemagn


#10-Sélectionner film "toujours_en_salle" > save table 'films_en cours' & calculer Sum 'films_en cours'
films_en_cours <- tableau[tableau$en_cours==TRUE,]
films_en_cours
nbFilmsENCours <- summary(films_en_cours$en_cours)
nbFilmsENCours

#11-Que manque-t-il pour bien s'approprier la table ?
print("La date à laquelle le 'snapshot' a été pris")

