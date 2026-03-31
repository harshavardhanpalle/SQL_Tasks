import mysql.connector

app = mysql.connector.connect(
    host= "localhost",
    port = 3306,
    user = "root",
    password = "786111888",
    database = "notes_db"
)
print("DATABASE Connected Successfully")
print()

print("----- WELCOME TO NOTES MANAGEMENT SYSTEM -----")
print()
print("This is an simple Python CLI application")
print("We can manage notes using this application")
print()
print()
print("Menu Driven Program")
print("Check the menu below to perform Operations")
print("Please select an option from the menu below:")
# Part 5: Menu Driven Program
# Create a loop-based menu:
# Add Note -- here we add title and content  and insert into database
# View Notes
# Search Note
# Update Note
# Delete Note
# Exit
cursor = app.cursor()

def add_note():
    title = input("enter note title:").strip()
    content = input("enter note content :").strip()
    sqlquery = "INSERT INTO notes (title,content,created_at) VALUES (%s,%s,NOW())"
    cursor.execute(sqlquery,(title,content))
    app.commit()
    print(f'note"{title}"created successfully')

def view_note():
    # used to see the notes in the database
    view = "SELECT note_id,title,created_at FROM notes"
    cursor.execute(view)
    data = cursor.fetchall()
    for row in data :
        print(row)

def search_note():
    search = input("enter the title to search :").strip()
    sql = "SELECT note_id,title,content,created_at FROM notes WHERE title LIKE %s"
    cursor.execute(sql,('%'+ search +'%',))
    data = cursor.fetchall()
    if data:
        for row in data:
            print(row)
    else:
        print("No matching notes found.")

def update_note():
    old_title = input("Enter the current title to update: ").strip()
    new_title = input("Enter the new title: ").strip()
    sql = "UPDATE notes SET title = %s WHERE title = %s"
    cursor.execute(sql, (new_title, old_title))
    app.commit()
    print("Note updated successfully ")



def delete_note():
    delete = input("enter the tile to delete:").strip()
    sql = "DELETE FROM notes WHERE title = %s"
    cursor.execute(sql,(delete,))
    app.commit()
    print("Note deleted successfully")

while 1:
    inp = int(input("\n 1 ---> Add Note \n 2 ---> View Note \n 3 ---> Search Note \n 4 ---> Update Note \n 5 ---> Delete Note \n 0 ---> Exit\nEnter Your Choice :"))

    if inp ==  0 : 
        print("Exiting the program")
        break
    
    elif inp == 1:
        add_note()
    elif inp == 2:
        view_note()
    elif inp == 3:
        search_note()
    elif inp == 4:
        update_note()
    elif inp == 5:
        delete_note()

"""
DATABASE Connected Successfully

----- WELCOME TO NOTES MANAGEMENT SYSTEM -----
This is an simple Python CLI application
We can manage notes using this application

Menu Driven Program

Check the menu below to perform Operations
Please select an option from the menu below:

 1 ---> Add Note 
 2 ---> View Note 
 3 ---> Search Note 
 4 ---> Update Note 
 5 ---> Delete Note 
 0 ---> Exit
Enter Your Choice :0
Exiting the program
(venv) (base) harshapalle@HARSHAs-MacBook-Air notes_project % cd ~/notes_project
source venv/bin/activate
python 5mdp.py
DATABASE Connected Successfully

----- WELCOME TO NOTES MANAGEMENT SYSTEM -----

This is an simple Python CLI application
We can manage notes using this application


Menu Driven Program
Check the menu below to perform Operations
Please select an option from the menu below:

 1 ---> Add Note 
 2 ---> View Note 
 3 ---> Search Note 
 4 ---> Update Note 
 5 ---> Delete Note 
 0 ---> Exit
Enter Your Choice :1
enter note title:movies
enter note content :salaar   
note"movies"created successfully

 1 ---> Add Note 
 2 ---> View Note 
 3 ---> Search Note 
 4 ---> Update Note 
 5 ---> Delete Note 
 0 ---> Exit
 
Enter Your Choice :2
(1, 'Plan Notes', datetime.datetime(2026, 3, 31, 5, 30))
(2, 'Morning Routine', datetime.datetime(2026, 3, 30, 7, 30))
(3, 'Office Meeting', datetime.datetime(2026, 3, 30, 10, 0))
(4, 'Lunch Plan', datetime.datetime(2026, 3, 30, 13, 0))
(5, 'Project Work', datetime.datetime(2026, 3, 30, 15, 30))
(6, 'Study Plan', datetime.datetime(2026, 3, 31, 15, 40, 59))
(7, 'Daily Tasks', datetime.datetime(2026, 3, 31, 15, 40, 59))
(8, 'Weekend Plan', datetime.datetime(2026, 3, 31, 15, 40, 59))
(12, 'VIMP notes', datetime.datetime(2026, 3, 31, 18, 33, 35))
(14, 'movies', datetime.datetime(2026, 3, 31, 18, 45, 40))

 1 ---> Add Note 
 2 ---> View Note 
 3 ---> Search Note 
 4 ---> Update Note 
 5 ---> Delete Note 
 0 ---> Exit
Enter Your Choice :3
enter the title to search :movies
(14, 'movies', 'salaar', datetime.datetime(2026, 3, 31, 18, 45, 40))

 1 ---> Add Note 
 2 ---> View Note 
 3 ---> Search Note 
 4 ---> Update Note 
 5 ---> Delete Note 
 0 ---> Exit
Enter Your Choice :4   
Enter the current title to update: movies
Enter the new title: MOVIES
Note updated successfully 

 1 ---> Add Note 
 2 ---> View Note 
 3 ---> Search Note 
 4 ---> Update Note 
 5 ---> Delete Note 
 0 ---> Exit
Enter Your Choice :5
enter the tile to delete:VIMP notes
Note deleted successfully

 1 ---> Add Note 
 2 ---> View Note 
 3 ---> Search Note 
 4 ---> Update Note 
 5 ---> Delete Note 
 0 ---> Exit
Enter Your Choice :2
(1, 'Plan Notes', datetime.datetime(2026, 3, 31, 5, 30))
(2, 'Morning Routine', datetime.datetime(2026, 3, 30, 7, 30))
(3, 'Office Meeting', datetime.datetime(2026, 3, 30, 10, 0))
(4, 'Lunch Plan', datetime.datetime(2026, 3, 30, 13, 0))
(5, 'Project Work', datetime.datetime(2026, 3, 30, 15, 30))
(6, 'Study Plan', datetime.datetime(2026, 3, 31, 15, 40, 59))
(7, 'Daily Tasks', datetime.datetime(2026, 3, 31, 15, 40, 59))
(8, 'Weekend Plan', datetime.datetime(2026, 3, 31, 15, 40, 59))
(14, 'MOVIES', datetime.datetime(2026, 3, 31, 18, 45, 40))

 1 ---> Add Note 
 2 ---> View Note 
 3 ---> Search Note 
 4 ---> Update Note 
 5 ---> Delete Note 
 0 ---> Exit
Enter Your Choice :0
Exiting the program


"""