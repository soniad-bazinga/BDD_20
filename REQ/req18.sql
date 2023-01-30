SELECT pseudo, AVG(COUNT(id_commande)) FROM Client c, Paiement p WHERE p.id_client = c.pseudo GROUP BY pseudo HAVING AVG(COUNT(id_commande)) > 2;
