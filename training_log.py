Basketball Training Log
Student: Trenton Wilson
GitHub Username: TrentonW10

This application is a Basketball Training Log that lets players keep track of 
their individual workout sessions. When you open the program,
you can log a new session, view all past sessions, see an overall stats summary, filter stats by drill type, or exit. 
saved in an external data file.
"""
"""Basketball Training log system example for IS 3020.

This program demonstrates how the core concepts from the course can work together in one real, 
functional application. It uses a menu to drive the program, functions to keep the code organized, 
lists and dictionaries to store and work with session data, conditionals to handle menu choices and 
validate input, loops to keep the menu running and to go through saved sessions, a CSV file to save and 
load data between runs, and try/except to catch invalid input without crashing the program.


"""

The original application logic still uses functions, lists, dictionaries,
conditionals, loops, a CSV file, and try/except. ChatGPT was used to replace
the command-line menu with a simple graphical user interface.
import csv

sessions = []

def log_session():
    print("\n--- Log New Session ---")
    date = input("Enter date: ")
    drill = input("Enter drill type: ")
    
    made = input("Shots made: ")
    attempted = input("Shots attempted: ")
    
    try:
        made = int(made)
        attempted = int(attempted)
    except:
        print("Invalid input, please enter numbers.")
        return
    
    notes = input("Any notes: ")
    
    session = {
        "date": date,
        "drill": drill,
        "made": made,
        "attempted": attempted,
        "notes": notes
    }
    
    sessions.append(session)
    
    with open("training_log.csv", "a", newline="") as f:
        writer = csv.writer(f)
        writer.writerow([date, drill, made, attempted, notes])
    
    print("Session logged!")


def view_sessions():
    print("\n--- Past Sessions ---")
    if len(sessions) == 0:
        print("No sessions yet.")
        return
    
    for s in sessions:
        print("Date:", s["date"])
        print("Drill:", s["drill"])
        print("Made:", s["made"])
        print("Attempted:", s["attempted"])
        print("Notes:", s["notes"])
        print("---")


def show_summary():
    print("\n--- Summary ---")
    if len(sessions) == 0:
        print("No sessions to summarize.")
        return
    
    total_made = 0
    total_attempted = 0
    
    for s in sessions:
        total_made = total_made + s["made"]
        total_attempted = total_attempted + s["attempted"]
    
    print("Total sessions:", len(sessions))
    print("Total shots made:", total_made)
    print("Total shots attempted:", total_attempted)
    
    if total_attempted > 0:
        pct = total_made / total_attempted * 100
        print("Shooting percentage:", round(pct, 1), "%")


def load_from_file():
    try:
        with open("training_log.csv", "r") as f:
            reader = csv.reader(f)
            for row in reader:
                if len(row) == 5:
                    s = {
                        "date": row[0],
                        "drill": row[1],
                        "made": int(row[2]),
                        "attempted": int(row[3]),
                        "notes": row[4]
                    }
                    sessions.append(s)
    except:
        pass


load_from_file()

while True:
    print("\n=== Basketball Training Log ===")
    print("1. Log a session")
    print("2. View sessions")
    print("3. See summary")
    print("4. Quit")
    
    choice = input("Pick an option: ")
    
    if choice == "1":
        log_session()
    elif choice == "2":
        view_sessions()
    elif choice == "3":
        show_summary()
    elif choice == "4":
        print("Bye!")
        break
    else:
        print("Please pick 1-4.")
