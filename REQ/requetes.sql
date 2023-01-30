/*requete qui porte sur au moins trois tables*/

/*les auteurs de chaque ouvrage pour chaque série*/
select a.nom, a.prenom, o.id_ouvrage, s.titre from auteurs a, ouvrage o, serie s;
/*une auto-jointure*/
select pseudo from client where d_naissance >= (SELECT MAX(d_naissance) from client);
/*liste des clients par pays*/
SELECT pseudo from client GROUP BY pays;
/*les séries qui se sont terminées avant la derniere série à avoir commencé*/
SELECT nom from serie where date_fin < (SELECT MAX(date_debut FROM serie));
/*(serie.date_fin < derniereserie.date_debut)*/
/*les commandes ayant la meme adresse de livraison*/
SELECT id_commande from livraison l LEFT OUTER JOIN livraison l2 ON l.adress_livre = l2.adress_livr;
/*les séries ayant le meme titre mais dont les ouvrages sont ecrits par au moins deux auteurs 
différents*/
SELECT s.nom from serie s, auteurs a JOIN serie s2 ON s.nom = s2.nom JOIN auteurs a2 ON a.id_auteur != a2.id_auteur AND a.id_serie = a2.id_serie AND a.id_ouvrage != a2.id_ouvrage;
/*une sous-requete corrélée*/
SELECT pseudo FROM client c1 WHERE d_naissance >= ALL(SELECT d_naissance FROM client c where c1.pseudo != c.pseudo);

/*commandes livrées en retard*/
SELECT id_commande FROM livraison, envoye WHERE date_livraison > date_livraison_prevue;

/*deux requêtes exprimant une condition de totalité, l'une avec aggreg et l'autre sans
(auteurs ayant eécrit exactement 2 oeuvres*/
select distinct id_auteur from Auteurs a1 JOIN Auteurs a2 ON a1.id_oeuvre <> a2.id_oeuvre AND a1.id_auteur = a2.id_auteur AND NOT EXISTS (Select id_auteur FROM auteurs a3 WHERE a3.id_auteur = a2.id_auteur AND a3.id_oeuvre <> ad.id_oeuvre);
/*une sous-requete dans le FROM*/
Select pseudo FROM (SELECT * FROM client WHERE pays = 'Korea, North');

/*une sous-requete dans le WHERE*/
SELECT * FROM commande WHERE id_commande IN (SELECT id_commande from retourne);
/*requetes avec des agregats*/
SELECT COUNT(*) FROM client;
/*la commande contenant le maximum d'articles achetés en une commande*/
SELECT c.id_commande, COUNT(ia.id_commande) from commande c, itemAchete ia GROUP BY c.id_commande HAVING COUNT(ia.id_commande) >= (SELECT MAX(COUNT(id_commande)) FROM itemAchete ia1, itemAchete ia2 WHERE ia1.id_article != ia2.id_article);
/*pour chaque client, donner l'article qu'il a le moins aimé (note la plus basse)*/
SELECT id_client, id_article FROM Notation n WHERE note <= (SELECT MIN(n2.note) FROM notation n2 WHERE n2.id_article = n.id_article AND n.id_client = n2.id_client);
/*donner la moyenne des notes pour chaque article*/
SELECT id_article, AVG(note) FROM notation GROUP BY id_article;
/*compter le nombre de clients qui n'ont que des commandes retournées*/
SELECT COUNT(*) FROM client c where not exists (SELECT c1.pseudo FROM client c1, paiement p WHERE p.id_client = c.pseudo AND c1.pseudo = c.pseudo AND p.id_commande NOT IN (SELECT id_commande from retourne));
/*requete impliquant le calcul de deux agrégats
(Pseudo de clients tel que leur nombre moyen de commandes est superieur à 2)*/
SELECT pseudo, AVG(COUNT(id_commande)) FROM Client c, Paiement p WHERE p.id_client = c.pseudo GROUP BY pseudo HAVING AVG(COUNT(id_commande)) > 2;
/*afficher pour chaque client le nombre de commandes dont la livraison a été validé*/
SELECT pseudo, COUNT(v.id_client) FROM client c, valide v WHERE v.id_client = c.id_client;
/*les clients qui ont une commande qui dépasse 20 euros*/
SELECT pseudo, SUM(a.prix) FROM Client c, Article a WHERE a.id_article IN (SELECT ia.id_article FROM ItemAchete ia, Paiement p WHERE p.id_client = c.id_client) GROUP BY pseudo HAVING SUM(a.prix) > 20;
/*les séries en cours de publication*/
SELECT nom FROM serie WHERE date_fin IS NULL;
/*les series qui se finissent aujourd'hui*/
/*Version sans et avec NULL*/

/*Version sans NULL*/
SELECT nom, date_fin FROM serie WHERE date_fin = DATE(NOW());

/*Version avec NULL*/

SELECT nom, date_fin FROM serie WHERE date_fin is not null;