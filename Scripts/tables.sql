DROP DATABASE IF EXISTS CartoonShop;
CREATE DATABASE CartoonShop;
\c cartoonshop 
CREATE TABLE Serie (
  id_serie serial primary key,
  nom varchar(50),
  date_debut date,
  date_fin date,
  nb_tomes int,
  genre varchar(100),
  categorie varchar(100),
  heros varchar(100),
  langue varchar(2)
);
CREATE TABLE Ouvrage (
  id_livre serial,
  id_serie int,
  titre varchar(200),
  nb_pages int,
  num_tome int,
  primary key (id_serie, id_livre),
  foreign key (id_serie) references Serie(id_serie)
);
CREATE TABLE Auteur (
  id_auteur serial primary key,
  nom varchar(100),
  prenom varchar(100),
  d_naissance date,
  pays varchar(100)
);
CREATE TABLE Editeur (
  nom_editeur varchar(100) primary key,
  pays varchar(50),
  compagnie varchar(150)
);
CREATE TABLE Publication (
  nom_editeur varchar(100),
  id_serie int,
  primary key (nom_editeur, id_serie),
  foreign key (nom_editeur) references Editeur(nom_editeur),
  foreign key (id_serie) references Serie(id_serie)
);
CREATE TABLE Auteurs (
  id_auteur int,
  id_serie int,
  id_livre int,
  primary key (id_auteur, id_serie, id_livre),
  foreign key (id_auteur) references Auteur(id_auteur),
  foreign key (id_livre, id_serie) references Ouvrage(id_livre, id_serie)
);
CREATE TABLE Article (
  id_article serial primary key,
  poche int,
  langue varchar(2),
  special bit,
  prix float
  /*0 pour faux, 1 pour vrai*/
);
CREATE TABLE Disponible (
  id_article int primary key,
  nb_items int,
  foreign key (id_article) references Article(id_article)
);
CREATE TABLE Indisponible(
  id_article int primary key,
  raison varchar(50),
  delai int,
  foreign key (id_article) references Article(id_article)
);
CREATE TABLE SurCommande(
  id_article int primary key,
  date_dispo date,
  foreign key (id_article) references Article(id_article)
);
CREATE TABLE Client (
  pseudo varchar(100) primary key,
  client_nom varchar(50),
  client_pre varchar(50),
  email varchar(60),
  client_adresse varchar(150),
  client_tel varchar(15),
  d_naissance date,
  mdp varchar(20),
  date_inscrip date,
  pays varchar(50)
);
CREATE TABLE Precommande(
  id_client varchar(100),
  id_article int,
  date_dispo date,
  primary key (id_article, id_client),
  foreign key (id_client) references Client(pseudo),
  foreign key (id_article) references Article(id_article)
);
CREATE TABLE Description(
  id_serie int,
  id_livre int,
  id_article int,
  primary key (id_article, id_livre, id_serie),
  foreign key (id_article) references Article(id_article),
  foreign key (id_livre, id_serie) references Ouvrage(id_livre, id_serie)
);
CREATE TABLE Prix(
  id_article int,
  date_chgt_prix date,
  ancien_prix float,
  primary key (id_article, date_chgt_prix),
  foreign key (id_article) references Article(id_article)
);
CREATE TABLE Panier (id_panier serial primary key);
CREATE TABLE Valide(
  id_client varchar(100),
  id_panier int,
  date_validation date,
  primary key (id_client, id_panier),
  foreign key (id_client) references Client(pseudo)
);
CREATE TABLE Remplir(
  id_panier int,
  id_article int,
  quantite int,
  primary key (id_panier, id_article),
  foreign key (id_article) references Article(id_article),
  foreign key (id_panier) references Panier(id_panier)
);
CREATE TABLE Commande (
  id_commande serial primary key,
  adress_fact varchar(150),
  adress_livr varchar(150)
);
CREATE TABLE Paiement (
  id_client varchar(100),
  id_commande int,
  valide bit,
  primary key (id_client, id_commande),
  foreign key (id_client) references Client(pseudo),
  foreign key (id_commande) references Commande(id_commande)
);
CREATE TABLE ItemAchete (
  id_commande int,
  id_article int,
  num_exemplaire int,
  primary key (id_commande, id_article, num_exemplaire),
  foreign key (id_article) references Article (id_article),
  foreign key (id_commande) references Commande(id_commande)
);
CREATE TABLE EnPreparation (
  id_commande int,
  id_article int,
  num_exemplaire int,
  date_prevu_exp date,
  primary key (id_commande, id_article, num_exemplaire),
  foreign key (num_exemplaire, id_commande, id_article) references ItemAchete (num_exemplaire, id_commande, id_article)
);
CREATE TABLE Envoye (
  id_commande int,
  id_article int,
  num_exemplaire int,
  date_exp date,
  date_livr_prevu date,
  primary key (id_commande, id_article, num_exemplaire),
  foreign key (num_exemplaire, id_commande, id_article) references ItemAchete (num_exemplaire, id_commande, id_article)
);
CREATE TABLE Livraison (
  id_commande int,
  id_article int,
  num_exemplaire int,
  date_livr date,
  validation bit,
  primary key (id_commande, id_article, num_exemplaire),
  foreign key (num_exemplaire, id_commande, id_article) references ItemAchete (num_exemplaire, id_commande, id_article)
);
CREATE TABLE Retour (
  id_retour serial primary key,
  raison varchar(200),
  article_retourne bit
);
CREATE TABLE Retourne (
  id_retour int,
  id_commande int,
  id_article int,
  num_exemplaire int,
  date_retour date,
  primary key (
    id_retour,
    id_commande,
    id_article,
    num_exemplaire
  ),
  foreign key (num_exemplaire, id_commande, id_article) references ItemAchete (num_exemplaire, id_commande, id_article)
);
CREATE TABLE DemandeRetour (
  id_client varchar(100),
  id_retour int,
  articles_rembourses bit,
  primary key (id_client, id_retour),
  foreign key (id_client) references Client(pseudo),
  foreign key (id_retour) references Retour(id_retour)
);
CREATE TABLE Annuler (
  id_client varchar(100),
  id_commande int,
  id_article int,
  num_exemplaire int,
  remboursement bit,
  date_annul date,
  primary key (
    id_client,
    id_commande,
    id_article,
    num_exemplaire
  ),
  foreign key (id_client) references Client(pseudo),
  foreign key (num_exemplaire, id_commande, id_article) references ItemAchete (num_exemplaire, id_commande, id_article)
);
CREATE TABLE Notation (
  id_article int,
  id_client varchar(100),
  note int,
  /* between 0 and 10 */
  primary key (id_client, id_article),
  foreign key (id_client) references Client(pseudo),
  foreign key (id_article) references Article(id_article)
);
/* Crée une vue pour séparer les mangas */
CREATE VIEW Mangas AS
SELECT
  *
FROM
  Serie
WHERE
  Heros IS NULL;
  /* Crée une vue pour séparer les comics */
  CREATE VIEW Comics AS
SELECT
  *
FROM
  Serie
WHERE
  Heros IS NOT NULL;