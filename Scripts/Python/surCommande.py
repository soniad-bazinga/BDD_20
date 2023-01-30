import random as r


def sur_commande():
    x = open("CSV/surcommande.csv", 'w')
    x.write("id_article|date_dispo\n")
    for i in range(5011, 7515):
        if i % 6 == 0:
            x.write(str(i) + "|" + str(r.randint(1, 24)) + "\n")
    x.close()


sur_commande()
