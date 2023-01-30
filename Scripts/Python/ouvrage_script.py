# Ouvrage: titre, nb_pages, num_tome
from random import randint


if __name__ == "__main__":
    file = open("CSV/comics_series.csv", "r")
    title = file.readline()
    lines = file.readlines()
    output = open("CSV/comics_ouvrage.csv", "w")
    output.write("id_serie,titre,nb_pages,num_tome\n")
    compt = 110
    for k in range(0, len(lines)):
        colonnes = lines[k].split(",")
        i = int(colonnes[3])
        for j in range(1, i+1):
            nb_pages = randint(30, 300)
            output.write(str(compt)+"," +
                         colonnes[0]+","+str(nb_pages)+","+str(j)+"\n")
        compt += 1
    file.close()
    output.close()
