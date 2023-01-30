# Projet de Base de Données 

Projet réalisé par Sonia Dahmani et Franck Kindia

## Création d'un site de vente de Comics et de Mangas

### Peuplement de la table

Chaque table a été peuplé différemment. Tout d'abord nous nous sommes servi du site "generatedata" afin d'obtenir une table d'utilisateur qui correspondrait à nos critères. 

Ensuite, pour les Mangas et les Comics il y a eu un mélange de scrapping du site Manga109 et d'écriture à la main. 

Les tables *Ouvrage* et *Articles* ont été réalisés totalement avec des scripts Python. 

## Mise en place de la Base de Données

L'initialisation de la base de données se fait en deux temps : 

* D'abord l'importation du fichier 'tables.sql' afin de créer les tables vides `(\i Scripts/tables.sql)`

* Puis l'éxecution du fichier 'importcsv.sql' qui lance à la suite toutes les commandes `\copy` `(\i Scripts/importcsv.sql)`