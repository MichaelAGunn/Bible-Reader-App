#This is a basic prototype that simply
#opens the csv file and creates a dictionary
import csv

#Convert csv file into a dictionary
kjv_file = open("kjv.csv")
kjv_table = csv.reader(kjv_file)
kjv_table = list(kjv_table)
kjv_table = kjv_table[1:]

#Display text and partition by book and chapter.
for row in kjv_table[0:10]: #substitute any range of rows
    if row[2] == "1" and row[3] == "1":
            print("\n\nBook " + row[1] + "\n") #book heading
    if row[3] == "1":
            print("\nChapter " + row[2] + "\n") #chapter heading
    print(row[4])
