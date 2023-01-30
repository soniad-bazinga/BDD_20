SELECT nom from serie where date_fin < (SELECT MAX(date_debut FROM serie));
