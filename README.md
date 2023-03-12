# Mac-Calendar-Event-Duration-Summarizer
This Applescript creates a Calendar event that summarizes duration of events between six days and one day before the event date.
The script only looks at events in the past 6 days and not the day it is set on. E.g., if you set the Automator event on Sunday, the script will look at events from Monday to Saturday. This can be changed at the beginning of the script.
Currently the code looks at three calendar names. This can be customized in the script.
Note that the script cannot recognise repeated events.
This code works only for MacOS.

# How to use
1. Open Automator.
2. Choose "Calendar Alarm" as a type of your document.
![Screenshot 2022-02-20 at 15 05 18](https://user-images.githubusercontent.com/29375799/154849120-9bad8d13-ef58-4531-a5d3-048d7dbad696.png)
3. Search for "Run AppleScript".
4. Drag it to the right window.
5. Copy the code in "event summarizer.scpt" in this project and paste it in the blank Automator window.
![Screenshot 2022-02-20 at 15 06 08](https://user-images.githubusercontent.com/29375799/154849161-6140667f-4a54-495d-af38-9b13b30e53de.png)
6. Save the script and you will be asked to set the name for a calendar event.
7. System dialogs will pop up to ask permission. Click OK. I had two dialogs.
8. There will be an Automator event appeared on your Calendar with summary of how you spent your time.
![Screenshot 2022-02-20 at 15 13 01](https://user-images.githubusercontent.com/29375799/154850023-721ee752-3a20-48a7-b908-23d13740ae24.png)
9. Customize the Automator event on Calendar. I made it repeat on each Sunday.
