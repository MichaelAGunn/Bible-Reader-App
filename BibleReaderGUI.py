import tkinter as tk
import tkinter.filedialog

#Setting attributes for the window
WIDTH = 1880
HEIGHT = 1060
TITLE = "Bible Reader"

#Produce the GUI window as a canvas
root = tk.Tk()
root.title(TITLE)
canvas = tk.Canvas(root, height=HEIGHT, width=WIDTH)
canvas.pack()

#----1st frame----
#Frame
frame1 = tk.Frame(root, bg='red')
frame1.place(relx=0.5, relwidth=1, relheight=0.05, anchor='n')
#Label
search_label = tk.Label(frame1, text="Search here:", bg='red')
search_label.place(relwidth=0.05, anchor='nw')
#Entry
search_entry = tk.Entry(frame1)
search_entry.place(relx=0.5, relwidth=0.89, anchor='n')
#Button
search_button = tk.Button(frame1, text='Submit')
search_button.place(relx=1, relwidth=0.05, anchor='ne')

#----2nd frame----
#Frame
frame2 = tk.Frame(root, bg='white')
frame2.place(relx=0.5, rely=0.05, relwidth=1, relheight=0.9, anchor='n')
#Text
display_default = ["This is where", " ",
				   "the query text", " ",
				   "will be displayed.", "\n",
				   "Thus saith the Lord,", " ",
				   "\"Do not maketh thine", " ",
				   "work into a spaghetti.\"","\n",
				   "Amen.", "\n\n\n***\n\n"]
display_label = tk.Label(frame2, text=display_default, bg='white')
display_label.place(relwidth=1, relheight=1)#Scrollbar?

#----3rd frame----
#Frame
frame3 = tk.Frame(root, bg='red')
frame3.place(relx=0.5, rely=0.95, relwidth=1, relheight=0.1, anchor='n')
#Label 1
version_current = "King James Version"
version_label = tk.Label(frame3, text=version_current, bg='red')
version_label.place(relx=0.1)
#Label 2
query_current = "Hezekiah 3:16"
query_label = tk.Label(frame3, text="Last Query: \""+query_current+"\"", bg='red')
query_label.place(relx=0.2)

#Build the App!
root.mainloop()
