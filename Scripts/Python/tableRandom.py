import random as r


def randomLanguage():
    rl = r.randint(0, 3)
    if rl == 0:
        return "EN"
    elif rl == 1:
        return "JP"
    else:
        return "FR"


def generateArticleCSV():
    f = open("CSV/articles.csv", 'w')
    f.write("poche|langue|special\n")
    for i in range(7515):
        if i % 1503 != 0:
            f.write(str(r.randint(0, 1)) + "|" +
                    randomLanguage() + "|" + "0" + "\n")
        else:
            f.write(str(r.randint(0, 1)) + "|" +
                    randomLanguage() + "|" + "1" + "\n")
    print("Terminé\n")


generateArticleCSV()
