import random as r


def disponible():
    f = open("CSV/disponible.csv", 'w')
    f.write("id_article|nb_items\n")
    for i in range(7515 - (7515//3)):
        f.write(str(i+1) + "|" + str(r.randint(1, 5)) + "\n")


def raisons():
    return ["Rupture de Stock", "Pas encore sortie"]


def indisponible():
    f = open("CSV/indisponible.csv", 'w')
    f.write("id_article|raison|delai\n")
    for i in range(7515 - (7515//3), 7515):
        f.write(str(i+1) + "|" + str(raisons()
                [r.randint(0, 1)]) + "|" + str(r.randint(1, 75)) + "\n")


disponible()

indisponible()
