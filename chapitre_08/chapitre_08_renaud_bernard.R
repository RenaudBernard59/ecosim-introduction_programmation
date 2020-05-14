############################################################
#MASTER e-COSIM
#Cours Initiation Programation - Christophe Cariou
#Rendu Exerice Chapitre 8 - pour le 25/03/2020
#Renaud BERNARD - R version 3.6.1 (2019-07-05)
############################################################

### Programme de diagnostic et de préparation des données pour analyse
# Votre prénom et votre nom, une date
# Renaud BERNARD, start 14/05/2020, end

# Règle : vous ne me fournissez que votre programme, et je ne dois modifier que le chemin d'accès au dossier. Le programme doit tourner sans message d'erreur et me fournir les différents résultats demandés.


### Partie 0 - Chargement des librairies et des données
##################################################################################################################################










### Partie 1 - Dictionnaire des données de la table fournie et de la table demandée
##################################################################################################################################


### Dictionnaire des données de la table fournie
# Dimensions : 6581 x 14

# titre (caractère) : titre de l'oeuvre, "" lorsque non renseigné
# auteur (caractère) : prénom, nom et alias de l'auteur de l'oeuvre
# annee_creation * (entier) : année de création de l'oeuvre lorsqu'elle est connue, NA sinon 
# lieu_exposition (caractère) : lieu d'exposition de l'oeuvre dans le Musée d'arts de Nantes
# naissance_deces (caractère) : année, ville, région et pays de naissance et de décès
# domaine (caractère - liste) : domaine de l'oeuvre 
# 6 domaines : Dessin, Estampe, Peinture, Photographie, Publication, livre, reliure et Sculpture
# technique (caractère) : technique de l'oeuvre
# hauteur_cm * (numérique) : hauteur de l'oeuvre en cm lorsqu'elle est connue, NA sinon
# longueur_cm * (numérique) : longueur de l'oeuvre en cm lorsqu'elle est connue, NA sinon
# annee_acquisition (entier) : année d'acquisition de l'oeuvre lorsqu'elle est connue, NA sinon
# type_acquisition (caractère) : type d'acquisition de l'oeuvre
# precisions_acquisitions (caractère) : précisions de l'acquisition de l'oeuvre, année peut-être présente à la fin
# numero_inventaire (caractère) : numéro d'inventaire de l'oeuvre
# lien_navigart (caractère) : lien unique de l'oeuvre sur la plateforme Navigart (adresse navigart - identifiant musée - identifiant oeuvre)
# adresse navigart = identifiant musée = "https://www.stg.navigart.fr/museedartsdenantes/#/artwork/110000000"

# * lorsque je l'ai fortement travaillé la table par rapport à la table originelle


### Dictionnaire des données de la table demandée 
# Dimensions : 6578 x 9

# oeuvre_id (caractère, taille fixe de 6 caractères) : identifiant unique de l'oeuvre sur la plateforme Navigart
# titre (caractère) : titre de l'oeuvre
# auteur ^ (caractère) : prénom et nom (éventuellement alias) de l'auteur de l'oeuvre
# annee_creation ^ (entier, taille fixe de 4 chiffres) : année de création de l'oeuvre lorsqu'elle est connue, NA sinon 
# domaine ^ (caractère, liste de 4 domaines) : domaine exclusif de l'oeuvre : 
# 4 domaines : Dessin, Estampe, Peinture ou Sculpture
# hauteur_cm (numérique) : hauteur de l'oeuvre en cm lorsqu'elle est connue (et lorsqu'elle a une longueur connue), NA sinon
# longeur_cm (numérique) : longueur de l'oeuvre en cm lorsqu'elle est connue  (et lorsqu'elle a une hauteur connue), NA sinon
# acquisition_type (caractère, liste de 4 types) : type exclusif d'acquisition de l'oeuvre par le musée : achat, depot, don ou inconnu
# Dépôt comprend Dépôt et Prêt
# Achat comprend Achat et Echange 
# Don comprendre Attribution, Dation, Don, Donation, Cession et Legs 
# Non renseigné comprendre non renseigné et Inscription
# acquisition_annee (entier à 4 chiffres) : année d'acquisition de l'oeuvre par le musée lorsqu'elle est connue, vide sinon

# ^ les colonnes qui n'ont pas besoin d'être modifiées

### Source des données : Musée d'arts de Nantes, juillet 2019

### La petite fonction nchar() permet d'obtenir la longueur (le nombre de caractères) d'une valeur ou d'un vecteur caractère 
##################################################################################################################################
# Un oubli de ma part dans le chapitre 7 sur la manipulation de données

une_valeur <- "Léonard de Vinci"
nchar(une_valeur)
# 16 caractères, espaces inclus

un_vecteur <- c("Léonard de Vinci", "Salvador Dali", "Marcel Duchamp")
nchar(un_vecteur)



### Partie 2 - Préparation des données 
##################################################################################################################################

# 2.1 - Vérifier que la table a bien les dimensions, les colonnes et les formats indiqués.





# 2.2 - Création de la variable oeuvre_id + stockage du lien navigart-musée 
# + vérification de la taille de oeuvre_id + vérification que la variable soit bien unique





# 2.3 - Indiquer "Titre non renseigné" lorsque nécessaire





# 2.4 - Hauteur et longueur lorsque l'autre est connue





# 2.5 - La liste des types d'acquisition à travailler





# 2.6 - L'année d'acquisition à compléter : 
# La variable precisions_acquisitions contient des années utiles
# Créer une variable annee2 = récupérer les 4 derniers caractères de la variable precisions_acquisitions
# Transformer cette variable en entier pour ne garder que les années et pas les éléments de texte
# Hypothèse à vérifier : dans tous les cas où l'année d'acquisition et l'annee2 sont disponibles, elles sont identiques
# Modifier l'année d'acquisition lorsque pas de valeur par la valeur de annee2





# 2.7 - Créer une table contenant uniquement les colonnes de la table demandée (et dans le bon ordre et au bon format).





# 2.8 - Créer une table contenant uniquement les lignes de la table demandée (via la colonne domaine).
# Nommer cette table : oeuvres





# 2.9 - La dimension de la table demandée est-elle bonne ?





# 2.10 - Exportez cette table de données. Vous n'avez pas besoin de me la fournir, le programme le fera lui même.






### Les petits fonctions mean, median, min, max... avec des valeurs absentes 
##################################################################################################################################

vecteur_sans_NA <- c(1:10)
max(vecteur_sans_NA)

vecteur_avec_NA <- c(1:10, NA)
max(vecteur_avec_NA) # ne marche pas
max(vecteur_avec_NA, na.rm=TRUE) # ne tient pas compte des NA pour faire le calcul


### Partie 3 - Analyse des données : statistique (vous) et graphique (moi)
##################################################################################################################################

### Figure 1. L'année de réalisation des oeuvres du Musée d'arts de Nantes.

# Cette figure ne peut pas être réalisée pour toutes les oeuvres de la table.
# 1 - Combien d'oeuvres ont servi à cette figure ?
# 2 - Combien d'oeuvres ne sont pas représentées sur cette figure ?






### Figure 2. L'année de réalisation et d'acquisition des collections.

# Pour dessiner la version par défaut de la figure :

dev.new(width=6, height=6)
plot(oeuvres$annee_creation, oeuvres$annee_acquisition, pch=19, col="black", cex=0.75)





# Cette figure ne peut pas être réalisée pour toutes les oeuvres de la table.
# 1 - Combien d'oeuvres ont servi à cette figure ?
# 2 - Combien d'oeuvres ne sont pas représentées sur cette figure ?






### Figure 3. La dimension des oeuvres du Musée d'arts de Nantes.

# La version vidéo est disponible :

browseURL("http://ecosim.chcariou.fr/Cours_tableurs/Chapitre_13/image_0.gif")

# La base de cette figure est la suivante :

dev.new(width=10, height=5)
plot(0,0,type="n", 	xlim=c(-max(oeuvres$longueur_cm, na.rm=TRUE)/2,max(oeuvres$longueur_cm, na.rm=TRUE)/2),
     ylim=c(-max(oeuvres$hauteur_cm, na.rm=TRUE)/2,max(oeuvres$hauteur_cm, na.rm=TRUE)/2))
rect(-oeuvres$longueur_cm/2,-oeuvres$hauteur_cm/2,oeuvres$longueur_cm/2,oeuvres$hauteur_cm/2, lwd=1)


# Cette figure ne peut pas être réalisée pour toutes les oeuvres de la table.
# 1 - Combien d'oeuvres ont servi à cette figure ?
# 2 - Combien d'oeuvres ne sont pas représentées sur cette figure ?





# Exemple 1 : L'oeuvre ayant la la hauteur maximale.
# 1 - Créer une variable nommée H qui contient la ligne de la table avec l'oeuvre ayant la hauteur maximale.
# 2 - Automatiser la phrase : "La peinture 'Entrée de l'Empereur d'Autriche à Venise' (1848) de Lancelot-Théodore TURPIN DE CRISSE fait 9,74 mètres de hauteur pour 1,3 mètres de longueur."
# 3 - Ouvrir automatiquement la page web dédiée à l'oeuvre de la plateforme Navigart.







# Exemple 2 : L'oeuvre ayant la la longueur maximale.
# 1 - Créer une variable nommée L qui contient la ligne de la table avec l'oeuvre ayant la longueur maximale.
# 2 - Recopier votre point 2 précédent, changer la variable H en L pour avoir la description de l'oeuvre (sinon modifier votre point 2 précédent).
# 3 - Ouvrir automatiquement la page web dédiée à l'oeuvre de la plateforme Navigart.





# Exemple 3 : L'oeuvre ayant la la superfirice maximale.
# 0 - Créer la variable superficie (hauteur x longueur).
# 1 - Créer une variable nommée S qui contient les lignes de la table avec les oeuvres ayant la superficie maximale et ne garder que la première.
# 2 - Recopier votre point 2 précédent, changer la variable H en S pour avoir la description de l'oeuvre.
# 3 - Ouvrir automatiquement la page web dédiée à l'oeuvre de la plateforme Navigart.






### Figure 4 - La dimension des oeuvres par domaine du Musée d'arts de Nantes.

# La base de ces figures est la suivante :

dev.new(width=6, height=6)
plot(oeuvres$longueur_cm, oeuvres$hauteur_cm, pch=19, cex=0.75, col="black", xlim=c(0,500), ylim=c(0,500))
lines(1:500,1:500, col="red")

# 1 - Créer une table intermédiaire où superficie ne contient aucune valeur manquante.





# 2 - Créer la variable format prenant les valeurs suivantes :





# Paysage si longueur > hauteur
# Portrait si hauteur > longueur
# Carré si hauteur = longueur

# La base de ces figures est la suivante :

oeuvres2$couleur <- "grey"
oeuvres2[oeuvres2$format=="Portrait",]$couleur <- "orange"
oeuvres2[oeuvres2$format=="Paysage",]$couleur <- "purple"

dev.new(width=6, height=6)
plot(oeuvres2$longueur_cm, oeuvres2$hauteur_cm, pch=19, cex=0.75, col=oeuvres2$couleur, xlim=c(0,500), ylim=c(0,500))

# 3 - Trouver une manière pour créer une table contenant :
# Première colonne : le nom de domaine
# Deuxième colonne : le format 
# Troisième colonne : le nombre d'oeuvres par domaine et par format
# Quatrième colonne : le pourcentage d'un format par rapport aux oeuvres du domaine










#END

