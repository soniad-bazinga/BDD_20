/*requete qui porte sur au moins trois tables*/

/*les auteurs de chaque ouvrage pour chaque série*/
select a.nom, a.prenom, o.id_ouvrage, s.titre from auteurs a, ouvrage o, serie s
    


/*afficher pour chaque client ayant au moins une commande, 
le nombre de commande qu'il a effectué */
select id_client, count(id_commande) 
from commande 
GROUP BY id_client
HAVING (count(id_commande) >= 1);

/*afficher pour chaque client le nombre
de commandes dont la livraison a été validée*/
select id_client, count(id_commande) 
from livraison l, client c, paiement p WHERE
p.id_client = c.id_client 
and p.valide= 1
and p.id_commande= l.id_commande 
and l.valide= 1;




/*une auto-jointure*/
/*liste des clients par pays*/
select id_client, pays 
from client c1 
LEFT OUTER JOIN client c2 
ON c1. 

/*les séries qui se sont terminées avant la derniere série à avoir commencé 
(serie.date_fin < derniereserie.date_debut)*/
select s.nom
from serie s
where s.date_fin < (select MAX(date_debut) 
from serie 
);

/*les commandes ayant la meme adresse de livraison*/
select id_commande 
from livraison l1
LEFT OUTER JOIN livraison l2 
ON l1.adress_livr = l2.adress_livr;

/*les séries ayant le meme titre 
mais dont les ouvrages sont ecrits par au moins deux auteurs 
différents*/
select 

/*une sous-requete corrélée*/
/**/

/*une sous-requete dans le FROM*/


/*une sous-requete dans le WHERE*/

/*requetes avec des agregats*/
/*la commande contenant le maximum d'articles achetés*/
/*pour chaque client, donner l'article qu'il a le moins aimé (note la plus basse)*/
/*donner la moyenne des notes pour chaque article (et si possible, 
la moyenne des notes pour ouvrage)*/
/*compter le nombre de clients qui n'ont que des commandes retournées*/
select count(id_client) from 

/*requete impliquant le calcul de deux agrégats*/
/*la moyenne des notes maximum données à chaque article*/
select id_article, AVG(MAX(note)) from notation
group by id_article;
/*le maximum des moyennes des notes de chaque article (voir requete au-dessus)*/
select id_article, 


/*deux requetes équivalentes exprimant une condition de totalité, l'une avec des sous 
requetes corrélées et l'autre avec de l'agrégation*/

/*une jointure externe*/
/*afficher toutes les articles d'un panier avec le pseudo de client correspondant et la date de validation */
select pseudo, id_commande, date_validation 
from client c
RIGHT JOIN valider v on c.id_client = v.id_client


/*les commandes livrés en retard*/
select id_commandes from livraison, envoye 
where date_livraison > date_livraison_prevue; 



/*les clients qui ont une commande de plus de 20 euros*/
select pseudo, SUM(article.prix)
from client, ItemAchete, article 


/*les séries en cours de publication*/
select nom 
from serie 
where date_fin IS NULL;


/*nombre de commandes livrés et validées au total*/
select count(id_commande) from livraison 
where valide= 1;

/*nombre de séries qui ont été écrites par au moins deux auteurs*/
select distinct serie.nom from serie, ouvrage 
group by(serie.id_serie) 



select nom from serie s, auteurs a, JOIN serie s2 on s.nom = s2.nom 
JOIN auteurs a2 on 
a.id_auteurs != a2.id_auteur and a.id_serie = a2.id_serie 
and a.id_ouvrage != a2.id_ouvrage;

select id_serie from  ouvrage o, auteurs au
group by (o.id_serie) having count() 


select id_client, id_article from DemandeRetour, retourné  
where 


