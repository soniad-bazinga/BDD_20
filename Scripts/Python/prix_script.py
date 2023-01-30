from random import randint


def random_date():
    mois = randint(1, 12)
    if mois % 2 != 0 or mois == 7:
        jour = randint(1, 31)
    elif mois == 2:
        jour = randint(1, 28)
    else:
        jour = randint(1, 30)
    annee = randint(1989, 2021)
    return str(mois)+"-"+str(jour)+"-"+str(annee)


if __name__ == "__main__":
    output = open("CSV/prix.csv", "w")
    output.write("id_article,date_chgt_prix,ancien_prix\n")
    file = open("articles.csv", "r")
    title = file.readline()
    lines = file.readlines()
    for k in range(0, len(lines)//3):
        id = randint(1, len(lines))
        ancien_prix = lines[k].split("|")[3]
        output.write(str(id)+","+random_date()+","+ancien_prix)
