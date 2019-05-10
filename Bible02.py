from tkinter import *
from tkinter import ttk
import sqlite3

class Bible: #Object representing a database
	#Will hold a DB connection
	db_conn = 0
	#A cursor is used to traverse the records of a result
	the_cursor = 0
	#Will store the current student selected
	current_sample = 0
	
	def setup_db(self):
		#Open or create db
		self.db_conn = sqlite3.connect('kjv.db')
		#Create Cursor
		self.the_cursor = self.db_conn.cursor()
		#Create the table if it doesn't exist
		try:
			self.db_conn.execute("CREATE TABLE if not exists KJV(ID INTEGER PRIMARY KEY NOT NULL, b INTEGER NOT NULL, c INTEGER NOT NULL, v INTEGER NOT NULL, t TEXT NOT NULL);")
			self.db_conn.commit()
		except sqlite3.OperationalError:
			print("ERROR : Table not created")
	
	def query_submit(self, query, event=None):
		#Take string value from search box
		if type(query) == int:
			if int(query) <= 1 and int(query) >= 66:
				try:
					result = self.cursor.execute("SELECT t FROM KJV WHERE b=" + self.search_value.get())
					#Print text from the Bible
					for row in result:
						print(row)
		
				except sqlite3.OperationalError:
					print("ERROR : Table does not exist.")
				except:
					print("ERROR : Could not retrieve data from database during Row Load")
			else:
				print("Input must be between 1 and 66")
		else:
			print("Input must be an integer")
	
	def __init__(self, root):
		root.title("Bible Reader")
		root.geometry=("1000x1000")
		#------menu-----
		
		#----1st row----
		search_label = Label(root, text="Search:")
		search_label.grid(row=0, column=0, padx=5, pady=5, sticky=W)
		self.search_value = StringVar(root, value="")
		self.search = ttk.Entry(root, textvariable=self.search_value)
		self.search.grid(row=0, column=1, padx=5, pady=5, sticky=W+E)
		self.submit_button = ttk.Button(root, text="Submit", command=lambda: self.query_submit(self.search_value))
		self.submit_button.grid(row=0, column=2, padx=5, pady=5, sticky=E)
		#----2nd row----
		scrollbar = Scrollbar(root)
		self.text_box = Text(root)
		self.text_box.grid(row=1, rowspan=10, column=0, columnspan=3, padx=5, pady=5, sticky=W+E)


#Activate the GUI (root)
root = Tk()
bible = Bible(root)
root.mainloop()
