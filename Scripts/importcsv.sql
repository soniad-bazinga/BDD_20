\copy client FROM 'CSV/client.csv' WITH DELIMITER '|' CSV HEADER;

\copy serie (nom, date_debut, date_fin, nb_tomes, genre, categorie, heros, langue) FROM 'CSV/MangaSerie.csv' WITH DELIMITER '|' NULL as 'null' CSV HEADER;

\copy ouvrage (id_serie, titre, nb_pages, num_tome) FROM 'CSV/MangaOuvrage.csv' WITH DELIMITER '|' NULL as 'null' CSV HEADER;

\copy article (poche, langue, special, prix) FROM 'CSV/Articles.csv' WITH DELIMITER '|' CSV HEADER;

\copy auteur (nom, prenom, d_naissance, pays) FROM 'CSV/Auteur.csv' WITH DELIMITER '|' CSV HEADER;

\copy disponible FROM 'CSV/disponible.csv' WITH DELIMITER '|' CSV HEADER;

\copy indisponible FROM 'CSV/indisponible.csv' WITH DELIMITER '|' CSV HEADER;

\copy serie (nom, date_debut, date_fin, nb_tomes, genre, categorie, heros) from 'CSV/comics_series.csv' WITH DELIMITER ',' NULL as 'null' CSV HEADER;

\copy ouvrage (id_serie, titre, nb_pages, num_tome) from 'CSV/comics_ouvrage.csv' WITH DELIMITER ',' CSV HEADER;

\copy editeur (nom_editeur, pays, compagnie) from 'CSV/publisher.csv' WITH DELIMITER ',' CSV HEADER;

\copy publication from 'CSV/publication.csv' WITH DELIMITER ',' CSV HEADER;

\copy prix from 'CSV/prix.csv' WITH DELIMITER ',' CSV HEADER;

\copy auteurs from 'CSV/auteurs.csv' WITH DELIMITER ',' CSV HEADER;

\copy precommande from 'CSV/precommande.csv' WITH DELIMITER '|' CSV HEADER;

\copy commande (adress_fact, adress_livr) FROM 'CSV/commandes.csv' WITH DELIMITER '|' CSV HEADER;

