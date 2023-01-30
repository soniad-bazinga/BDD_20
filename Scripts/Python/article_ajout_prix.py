from random import uniform

if __name__ == "__main__":
    file = open("CSV/articles.csv", "r")
    output = open("articles.csv", "w")
    title = file.readline()
    output.write(title)
    lines = file.readlines()
    for k in range(0, len(lines)):
        prix = uniform(5.5, 30.5)
        output.write(lines[k][:6] + "|"+str(prix)[:5]+"\n")
    file.close()
