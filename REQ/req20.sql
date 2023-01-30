SELECT pseudo, SUM(a.prix) FROM Client c, Article a WHERE a.id_article IN (SELECT ia.id_article FROM ItemAchete ia, Paiement p WHERE p.id_client = c.id_client) GROUP BY pseudo HAVING SUM(a.prix) > 20;