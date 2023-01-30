/*les séries ayant le meme titre mais dont les ouvrages sont ecrits par au moins deux auteurs 
différents*/
SELECT s.nom from serie s, auteurs a JOIN serie s2 ON s.nom = s2.nom JOIN auteurs a2 ON a.id_auteur != a2.id_auteur AND a.id_serie = a2.id_serie AND a.id_ouvrage != a2.id_ouvrage;
