select pseudo from client where d_naissance >= (SELECT MAX(d_naissance) from client);
