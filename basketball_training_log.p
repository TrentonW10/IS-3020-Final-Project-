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
"""
import csv

FILE_NAME = "training_log.csv"
FIELDNAMES = ["date", "drill", "made", "attempted", "notes"]


def load_sessions():
    sessions = []
    try:
        with open(FILE_NAME, "r", newline="", encoding="utf-8") as f:
            reader = csv.DictReader(f)
            for row in reader:
                try:
                    row["made"] = int(row["made"])
                    row["attempted"] = int(row["attempted"])
                except:
                    continue
                sessions.append(row)
    except:
        pass
    return sessions


def save_session(session):
    try:
        with open(FILE_NAME, "r", encoding="utf-8"):
            file_exists = True
    except:
        file_exists = False

    with open(FILE_NAME, "a", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=FIELDNAMES)
        if not file_exists:
            writer.writeheader()
        writer.writerow(session)


def log_session(sessions):
    print("\n--- Log New Training Session ---")
    date = input("Date: ").strip()
    drill = input("Drill type: ").strip()

    while True:
        made_input = input("Shots made: ").strip()
        attempted_input = input("Shots attempted: ").strip()
        try:
            made = int(made_input)
            attempted = int(attempted_input)
        except:
            print("Enter whole numbers.")
            continue
        if made < 0 or attempted < 0:
            print("Numbers cannot be negative.")
            continue
        if made > attempted:
            print("Made cannot be greater than attempted.")
            continue
        break

    notes = input("Notes: ").strip()

    session = {
        "date": date,
        "drill": drill,
        "made": made,
        "attempted": attempted,
        "notes": notes
    }

    sessions.append(session)
    save_session(session)
    print("Session saved.")


def view_sessions(sessions):
    print("\n--- All Sessions ---")
    if not sessions:
        print("No sessions logged.")
        return

    for i, s in enumerate(sessions, start=1):
        print(f"\nSession {i}:")
        print(" Date:", s["date"])
        print(" Drill:", s["drill"])
        print(" Made:", s["made"])
        print(" Attempted:", s["attempted"])
        print(" Notes:", s["notes"])


def show_summary(sessions):
    print("\n--- Summary ---")
    if not sessions:
        print("No sessions logged.")
        return

    total_sessions = len(sessions)
    total_made = 0
    total_attempted = 0

    for s in sessions:
        total_made += s["made"]
        total_attempted += s["attempted"]

    if total_attempted > 0:
        percentage = (total_made / total_attempted) * 100
    else:
        percentage = 0

    print("Total sessions:", total_sessions)
    print("Total made:", total_made)
    print("Total attempted:", total_attempted)
    print("Overall %:", f"{percentage:.1f}%")


def filter_by_drill(sessions):
    print("\n--- Drill Stats ---")
    if not sessions:
        print("No sessions logged.")
        return

    drill_name = input("Drill type: ").strip().lower()
    filtered = []

    for s in sessions:
        if s["drill"].lower() == drill_name:
            filtered.append(s)

    if not filtered:
        print("No sessions found for that drill.")
        return

    total_made = 0
    total_attempted = 0

    for s in filtered:
        total_made += s["made"]
        total_attempted += s["attempted"]

    if total_attempted > 0:
        percentage = (total_made / total_attempted) * 100
    else:
        percentage = 0

    print("\nDrill:", drill_name)
    print("Sessions:", len(filtered))
    print("Total made:", total_made)
    print("Total attempted:", total_attempted)
    print("Drill %:", f"{percentage:.1f}%")


def main_menu():
    sessions = load_sessions()

    while True:
        print("\n=== Basketball Training Log ===")
        print("1. Log session")
        print("2. View sessions")
        print("3. View summary")
        print("4. Drill stats")
        print("5. Exit")

        choice = input("Choose (1-5): ").strip()

        if choice == "1":
            log_session(sessions)
        elif choice == "2":
            view_sessions(sessions)
        elif choice == "3":
            show_summary(sessions)
        elif choice == "4":
            filter_by_drill(sessions)
        elif choice == "5":
            print("Goodbye.")
            break
        else:
            print("Invalid choice.")


main_menu()
