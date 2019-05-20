import sqlite3
from csv import reader

#open the correct file
conn = sqlite3.connect('BibleReader.db')

#setting up the cursor
c = conn.cursor()
def create_db():

	#creating a Bible table
	def create_Bible_table():
		create_Bible = '''
		CREATE TABLE IF NOT EXISTS Bible (
		B_id	INTEGER	AUTO INCREMENT,
		tran	CHAR(3)	NOT NULL,
		book	INTEGER	NOT NULL,
		chapter	INTEGER	NOT NULL,
		verse	INTEGER	NOT NULL,
		text	TEXT	NOT NULL,
		PRIMARY KEY (B_id)
		)'''
		c.execute(create_Bible) #remember to make tran relate to code in the metadata table
		conn.commit
	def create_Metadata_table():
		create_Metadata = '''
		CREATE TABLE IF NOT EXISTS Metadata(
		m_id	INTEGER	AUTO INCREMENT,
		code	TEXT NOT NULL,
		PRIMARY KEY (m_id)
		)'''
		c.execute(create_Metadata)
		conn.commit
	
	#execute inner functions
	create_Bible_table()
	#create_Metadata_table()

create_db()
print("DB created.")

'''
def delete_all_rows():
	print("may or may not delete")
	
delete_all_rows()
'''

#inserting rows into the Bible table using a csv file
def open_csv(which_tran):
	opened_file = open(which_tran + '.csv')
	read_file = reader(opened_file)
	Bible_table = list(read_file)
	print(Bible_table[0])
	Bible_table = Bible_table[1:]
	return Bible_table

current_tran = 'kjv'
current_dict = open_csv(current_tran)
print("The " + current_tran + ".csv file is open.")


#insert data one line at a time
c.execute("INSERT INTO (tran, book, chapter, verse, text) Bible VALUES ('kjv', 1, 1, 1, 'first')")
'''
c.execute("INSERT INTO (tran, book, chapter, verse, text) Bible VALUES ('kjv', 1, 1, 2, 'second')")
c.execute("INSERT INTO (tran, book, chapter, verse, text) Bible VALUES ('kjv', 1, 1, 3, 'third')")
c.execute("INSERT INTO (tran, book, chapter, verse, text) Bible VALUES ('kjv', 1, 1, 4, 'fourth')")
c.execute("INSERT INTO (tran, book, chapter, verse, text) Bible VALUES ('kjv', 1, 1, 5, 'fifth')")
c.execute("INSERT INTO (tran, book, chapter, verse, text) Bible VALUES ('kjv', 1, 1, 6, 'sixth')")
c.execute("INSERT INTO (tran, book, chapter, verse, text) Bible VALUES ('kjv', 1, 1, 7, 'seventh')")
c.execute("INSERT INTO (tran, book, chapter, verse, text) Bible VALUES ('kjv', 1, 1, 8, 'eighth')")
c.execute("INSERT INTO (tran, book, chapter, verse, text) Bible VALUES ('kjv', 1, 1, 9, 'ninth')")
c.execute("INSERT INTO (tran, book, chapter, verse, text) Bible VALUES ('kjv', 1, 1, 10, 'tenth')")
'''


'''
#sample data just for something quick to work with
def insert_trash():
	book = 1
	chapter = 1
	verse = 1
	text = ['not', 'first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth', 'thirteenth', 'fourteenth', 'fifteenth', 'sixteenth', 'seventeenth', 'eighteenth', 'ninteenth', 'twentieth']
	try:
		while x < 20:
			c.execute("INSERT INTO (tran, book, chapter, verse, text) Bible VALUES ('" + tran + "', " + book + ", " + chapter + ", " + verse + ", '" + text[verse] + "')") #This causes an error.
			verse += 1
	except sqlite3.OperationalError:
		print("OPERATIONAL ERROR: Row could not inserted.")
	except:
		print("ERROR: Function doesn't work.")

	conn.commit

insert_trash()
'''


'''
#now the data goes into the table in the database file
def insert_Bible_rows(which_dict):
	for row in which_dict:
		tran = current_tran
		book = str(row[1])
		chapter = str(row[2])
		verse = str(row[3])
		text = str(row[4])
		print(text)
		try:
			c.execute("INSERT INTO (tran, book, chapter, verse, text) Bible VALUES ('" + tran + "', " + book + ", " + chapter + ", " + verse + ", '" + text + "')") #This causes an error.
		except sqlite3.OperationalError:
			print("OPERATIONAL ERROR: Row could not inserted.")
		except:
			print("ERROR: Function doesn't work.")
	conn.commit
insert_Bible_rows(current_dict)
'''


'''
#Select text with sql commands
c.execute("SELECT (text) FROM Bible WHERE (book='1', chapter='1', verse='1')")
print(c.fetchall())
print("Here.")
'''

#close everything
print("END")
c.close()
conn.close()
