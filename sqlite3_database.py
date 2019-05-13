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
	create_Metadata_table()

create_db()
print("DB created.")

def delete_all_rows():
	print("may or may not delete")
	
delete_all_rows()

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
print(current_dict[1000])


#now the data goes into the table in the database file
def insert_Bible_rows(which_dict):
	for row in which_dict:
		book = str(row[1])
		chapter = str(row[2])
		verse = str(row[3])
		text = str(row[4])
		print(book)

		c.execute("INSERT INTO Bible VALUES(tran, book, chapter, verse, text), ('" + current_tran + "', " + book + ", " + chapter + ", " + verse + ", '" + text + "')") #This causes an error.
	conn.commit
insert_Bible_rows(current_dict)



'''
#Select text with sql commands
c.execute("SELECT (text) FROM Bible WHERE (book='1', chapter='1', verse='1')")
print(c.fetchall())
print("Here.")
'''

#close everything
c.close()
conn.close()
