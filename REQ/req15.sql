SELECT id_client, id_article FROM Notation n WHERE note <= (SELECT MIN(n2.note) FROM notation n2 WHERE n2.id_article = n.id_article AND n.id_client = n2.id_client);
