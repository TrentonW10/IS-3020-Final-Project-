# AI Improvement Record

## Original Development

I developed the original version of the Basketball Training Log on my own before using any AI assistance. I started by writing a basic menu loop and building out the core functions one at a time — logging a session, viewing sessions, and showing a summary. I used csv.writer to save data and csv.reader to load it back in. Input validation was minimal; if the user entered something non-numeric, the program would print an error and return to the menu without re-prompting. The sessions list was a global variable that all functions accessed directly. The original version had four menu options and no drill filtering. AI was not used during this stage.



## AI Tools Used

Microsoft Copilot

Claude

## Improvements Requested

I asked Copilot to review my original code and help improve it. My main requests were to make the input validation loop instead of just returning on bad input, to add a feature that filters stats by drill type, and to clean up how the CSV file was being read and written. I also asked for feedback on overall code structure and whether there was a better way to organize the session data.

## Changes Accepted

Switched from csv.writer to csv.DictWriter and csv.DictReader: The original version wrote rows as plain lists and read them back by index, which made it easy to accidentally mix up fields. Copilot suggested using DictWriter with named fieldnames and DictReader to load rows as dictionaries. I accepted this because it made the code much easier to read and less error-prone. I verified I understood it by reading through how DictReader maps each column header to a key in the returned dictionary.

Changed input validation to loop instead of return: The original code used a single try/except that printed an error and returned to the menu if the user typed something non-numeric. Copilot suggested wrapping the input in a while loop so the user gets re-prompted until they enter valid data. I accepted this because it makes the program feel more polished and prevents the user from losing their session data just because of a typo. I verified it by running the function and intentionally entering bad input multiple times.

Added negative number and made-greater-than-attempted checks: Copilot pointed out that a user could enter -5 for shots made or a made value higher than attempted, which would produce nonsense stats. I accepted both checks because they were simple conditionals I understood and they made the validation more complete.

Added filter_by_drill as a fifth menu option: I asked Copilot to help me add a feature that lets users look at stats for one specific drill type. I accepted this because it was one of the features I wanted in the app but was not sure how to build efficiently. I verified I understood it by reading through the for loop that filters sessions by comparing drill names in lowercase.

Changed sessions from a global variable to a function parameter: Copilot recommended passing the sessions list into each function instead of accessing it as a global. I accepted this because it made each function more self-contained and is a better programming practice. I verified I understood it by tracing how main_menu loads the sessions once and passes them into whichever function is called.

Added encoding="utf-8" to all file operations: Copilot added this to every open() call. I accepted it because it prevents character encoding errors on different operating systems and is a good habit for file handling.

## Changes Rejected or Revised

Copilot initially suggested adding a function that calculates a streak of consecutive days trained. I decided not to include it in the final version because it would have required parsing and comparing date strings in a more complex way than I felt comfortable with for this project. I wanted to keep the scope realistic and make sure I fully understood every line of code I submitted. I may add it in the future as an extension.

## What I Learned

Working through the AI-assisted improvements taught me that organizing code into functions with parameters is much cleaner than relying on global variables. I also learned the difference between csv.writer and csv.DictWriter and why using field names makes CSV handling safer and easier to follow. The input validation loop was a good reminder that a while loop is often more user-friendly than just printing an error and stopping. Most importantly, reviewing each suggestion carefully before accepting it helped me make sure I actually understood the changes rather than just copying code I could not explain.
