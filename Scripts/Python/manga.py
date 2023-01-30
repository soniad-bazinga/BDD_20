from os import error
import random as ran
import re
import sys
from datetime import datetime as dt, timedelta


def parseTableRows(fic):
    line = open(fic, 'r').read()
    reg = re.findall(r"<td>\s*.*<\/td>", str(line))
    fin = []
    inn = -1
    for i in range(0, len(reg)):
        if i % 10 == 0:
            inn += 1
            fin.append([])
        fin[inn].append(removeTd(reg[i]))
    fin = keepNeeded(fin)
    return fin


def removeTd(string):
    string = string.replace("<td>", '')
    string = string.replace("</td>", '')
    return string


def keepNeeded(l):
    for i in range(0, len(l)):
        l[i] = l[i][1:7]
        for j in range(0, len(l[i])):
            l[i][j] = l[i][j].replace('boy', 'Shonen')
            l[i][j] = l[i][j].replace('young men', 'Seinen')
            l[i][j] = l[i][j].replace('girl', 'Shojo')
            l[i][j] = l[i][j].replace('lady', 'Josei')
            l[i][j] = l[i][j].replace('\'s', '')
            if l[i][j].isnumeric():
                l[i][j] = addRandom(l[i][j])

    return l


def addRandom(number):
    i = int(number)
    i += ran.randint(0, 9)
    return str(i)


def randomDate(year):
    return dt(year, ran.randint(1, 12), ran.randint(1, 28)).strftime("%m-%d-%Y")


def randomEndDate(year):
    start_date = dt(year, 1, 1)
    end_date = dt.now()

    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    random_number_of_days = ran.randrange(days_between_dates)
    random_date = start_date + timedelta(days=random_number_of_days)

    return random_date.strftime("%m-%d-%Y")


def adaptCSV(list):
    for i in range(0, len(list)):
        list[i].pop(1)
        year = list[i][1]
        list[i].insert(2, randomEndDate(int(list[i][1])))
        list[i][1] = randomDate(int(year))
        list[i].pop(3)
        list[i].insert(3, str(ran.randint(1, 100)))
        list[i].append('null')
        list[i].append(randomLangue())
    return list


def randomLangue():
    l = ran.randint(0, 4)
    if l == 0:
        return "EN"
    elif(l > 2):
        return "JP"
    else:
        return "FR"


def makeCSV(betterList):
    f = open("CSV/MangaSerie.csv", 'w')
    f.write("nom|date_debut|date_fin|nb_tomes|genre|categorie|hero|langue\n")
    for i in range(0, len(betterList)):
        for j in range(len(betterList[i])):
            if j < len(betterList[i])-1:
                f.write(betterList[i][j] + "|")
            else:
                f.write(betterList[i][j])
        f.write("\n")


def nbPages():
    return str(ran.randint(20, 250))


def ouvrageCSV(listCSV):
    f = open("CSV/MangaOuvrages.csv", 'w')
    f.write("id_serie|titre|nb_pages|num_tome\n")
    for i in range(len(listCSV)):
        for j in range(int(listCSV[i][3])):
            f.write(str(i+1) + "|" + listCSV[i]
                    [0] + "|" + nbPages() + "|" + str(j+1) + "\n")


makeCSV(adaptCSV(parseTableRows(sys.argv[1])))

ouvrageCSV(adaptCSV(parseTableRows(sys.argv[1])))
