SELECT nom, date_fin FROM serie WHERE date_fin = DATE(NOW());


SELECT nom, date_fin FROM serie WHERE date_fin is not null;
