# IS 3020 Final Project

## Student and Project Information

- Student name: Trenton Wilson
- GitHub username: TrentonW10
- Project title: Basketball Training Log
- Application purpose: This application allows basketball players to log and track individual training sessions through a command-line interface. It provides a consistent way to add, view, and review shooting stats, and filter performance by drill type using persistent CSV storage.

## How to Run the Application
1. Open the project folder in PyCharm.
2. Confirm that training_log.py is in the project root.
3. Confirm that Python 3 is selected as the project interpreter.
4. Open training_log.py.
5. Click the green Run button or right-click the file and select Run 'training_log'.
6. Use the menu in the terminal to log and review training sessions.
7. 7. The program uses only Python's built-in csv module and does not require any additional packages.

## Major Features
Log a training session by entering the date, drill type, shots made, shots attempted, and optional notes.

View all previously logged sessions displayed in a readable list format.

View an overall stats summary showing total sessions, total makes, total attempts, and overall shooting percentage.

Filter stats by drill type to see performance for a specific workout such as free throws or three-point shooting.

Automatically save each session to training_log.csv and reload all records when the program starts.

## Python Concepts Used

The application uses functions to load, save, log, view, summarize, and filter training session records. A list stores the complete collection of sessions loaded from the CSV file, and dictionaries represent individual sessions with keys for date, drill, made, attempted, and notes. Conditionals validate user input and control menu navigation, while a while loop keeps the main menu running and for loops process stored session data. The program reads and writes a CSV file using csv.DictReader and csv.DictWriter, and uses try/except to handle missing files on the first run and invalid numeric input from the user.

## Data Files

The application stores its data in training_log.csv. The file is created automatically when the first session is logged. The CSV file contains the following fields:

date: the date of the training session entered by the user

drill: the type of drill or workout performed, such as free throws or 3-point shooting

made: the number of shots made, stored as a whole number

attempted: the number of shots attempted, stored as a whole number

notes: any optional notes the user added about the session

If the CSV file does not exist when the application starts, the program begins with an empty session list and creates the file when the first session is saved.

## Testing Summary

The application was tested by logging valid sessions, entering letters instead of numbers for shots made and attempted, entering a made value greater than the attempted value, entering negative numbers, and running the program with no existing CSV file present. Each menu option was tested in sequence to confirm correct behavior. The drill filter was tested with a drill name that had matching sessions and with one that had no matches. All invalid inputs were handled with an appropriate message and a re-prompt rather than a program crash.

## AI Use

Microsoft Copilot was used after the original command-line version was working. It helped improve input validation, switch from csv.writer to csv.DictWriter and csv.DictReader, add the drill filter feature as a fifth menu option, and convert the sessions variable from a global into a function parameter. See AI_USAGE.md for the full improvement record.
GitHub Milestones

## GitHub Accomplishments

This project demonstrates the following required commits:

Initial project setup

Original working version before AI improvement

Final version after AI improvement
