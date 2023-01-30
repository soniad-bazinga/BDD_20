# id_auteur,id_serie,id_livre
from random import randint

if __name__ == "__main__":
    output = open("CSV/auteurS.csv", "w")
    ouvrages = open("CSV/MangaOuvrage.csv")

    output.write("id_auteur,id_serie,id_ouvrage\n")
    file = open("CSV/MangaSerie.csv", "r")
    title = file.readline()
    lines = file.readlines()
    compt = 1
    for k in range(0, len(lines)):
        colonnes = lines[k].split("|")
        l = int(colonnes[3])
        for j in range(1, l+1):
            i = randint(1, 7)
            output.write(str(i)+","+str(j)+","+str(compt)+"\n")
        compt += 1
    file.close()

    file = open("CSV/comics_series.csv", "r")
    title = file.readline()
    lines = file.readlines()
    for k in range(0, len(lines)):
        i = randint(8, 12)
        colonnes = lines[k].split(",")
        for j in range(int(colonnes[3])):
            output.write(str(i)+","+str(j)+","+str(compt)+"\n")
        compt += 1
    file.close()
    output.close()
