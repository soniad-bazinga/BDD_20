SELECT pseudo FROM client c1 WHERE d_naissance >= ALL(SELECT d_naissance FROM client c where c1.pseudo != c.pseudo);
