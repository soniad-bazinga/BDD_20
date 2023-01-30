from random import randint
import datetime as d


def preco():
    f = open("CSV/precommande.csv", 'w')
    sc = open("CSV/surcommande.csv", 'r')
    cl = open("CSV/client.csv", 'r')
    pseudo = []
    for lines in cl:
        pseudo.append(lines.split("|")[0])
    f.write("id_client|id_article|date_dispo\n")
    pseudo.pop(0)
    for line in sc:
        if line[:4].isnumeric():
            if int(line[:4]) % 12 == 0:
                f.write(pseudo[randint(0, len(pseudo)-1)] + "|" +
                        line[:4] + "|" + (d.datetime.now() + d.timedelta(days=30*int(line[5:]))).strftime("%m-%d-%Y") + "\n")
    f.close()
    sc.close()


preco()
