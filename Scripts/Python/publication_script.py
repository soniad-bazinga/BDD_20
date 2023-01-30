from random import randint

if __name__ == "__main__":
    output = open("CSV/publication.csv", "w")
    output.write("nom_editeur,id_serie\n")
    file = open("CSV/MangaSerie.csv", "r")
    title = file.readline()
    lines = file.readlines()
    liste = ["Animate", "Bento Books", "Fantagraphics", "Media Blasters", "Madman Entertainment",
             "Kazé", "Casterman", "Panini Comics", "Akita Shoten", "Mag Garden", "Wani Books"]
    compt = 1
    for k in range(0, len(lines)):
        i = randint(0, 10)
        output.write(liste[i]+","+str(compt) + "\n")
        compt += 1
    file.close()

    file = open("CSV/comics_series.csv", "r")
    title = file.readline()
    lines = file.readlines()

    for k in range(0, len(lines)):
        colonnes = lines[k].split(",")
        titre = colonnes[0]
        if titre.find("Avengers") != -1 or titre.find("Spider-man") != -1:
            output.write("Marvel Comics,"+str(compt)+"\n")
        elif titre.find("Umbrella") != -1:
            output.write("Dark Horse Comics,"+str(compt)+"\n")
        elif titre.find("Vandetta") != -1:
            output.write("Delcourt,"+str(compt)+"\n")
        else:
            output.write("DC Comics,"+str(compt)+"\n")
        compt += 1
    file.close()
    output.close()
