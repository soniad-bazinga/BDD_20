SELECT pseudo, COUNT(v.id_client) FROM client c, valide v WHERE v.id_client = c.id_client;
