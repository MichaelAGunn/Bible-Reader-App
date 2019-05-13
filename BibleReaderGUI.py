from tkinter import *
import sqlite3

class Bible:
	'''
	#open the correct file
	conn = sqlite3.connect('BibleReader.db')
	#setting up the cursor
	c = conn.cursor()
	'''
	
	def __init__(self, root):
		self.root = root
		self.root.title("Bible Reader")
		self.root.geometry("1920x1080")
		self.root.config(bg='cadet blue')
		#----1st frame----
		#Frame
		#Label
		#Entry
		#Button
		
		#----2nd frame----
		#Frame
		#Label
		
		#----3rd frame----
		#Frame
		#Labels (how many?)
		

root = Tk()
application = Bible(root)
root.mainloop()
