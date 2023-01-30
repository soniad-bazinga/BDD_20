SELECT c.id_commande, COUNT(ia.id_commande) from commande c, itemAchete ia GROUP BY c.id_commande HAVING COUNT(ia.id_commande) >= (SELECT MAX(COUNT(id_commande)) FROM itemAchete ia1, itemAchete ia2 WHERE ia1.id_article != ia2.id_article);
