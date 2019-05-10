#Open the csv file and create the list of lists
from csv import reader

opened_file = open('kjv.csv')
read_file = reader(opened_file)
Bible = list(read_file)
Bible = Bible[1:]

#Data are cleaned (turned into integers)
def clean_db(list_of_lists):
	for row in list_of_lists:
		row[0] = int(row[0])
		row[1] = int(row[1])
		row[2] = int(row[2])
		row[3] = int(row[3])

clean_db(Bible)

#Create the text to display
def read_book(list_of_lists, b):
	text_to_display = []
	for row in list_of_lists:
		if int(row[1]) == b:
			text_to_display.append(row[4])
	return text_to_display

#The actual printing of the text
book = input("Pick a number between 1 and 66: ")
book = int(book)
if book >= 1 and book <= 66:
	displayed_text = read_book(Bible, book)
	for row in Bible:
		if row[1] == book:
			print(row[4])
else:
	print("Invalid Input")