import random as r


def pubCSV():
    x = open("CSV/publications.csv", 'w')
    x.write("id_editeur|id_serie")
    for i in range(17):
        x.write(str(r.randint(1, 16)) + "|" + str(r.randint(1, 241)) + "\n")


pubCSV()
