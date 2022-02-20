-- This Applescript creates a Calendar event that summarizes duration of events between six days and one day before the current date.
-- I intended to run it on Sundays.
-- To schedule running the code, read README.md.
-- The code looks at events under three calendar names and events that contains certain text.

-- Set range from six days and one day before the day running the code
set theStartDate to (current date) - (6 * days)
set hours of theStartDate to 0
set minutes of theStartDate to 0
set seconds of theStartDate to 0

set theEndDate to (current date)
set hours of theEndDate to 0
set minutes of theEndDate to 0
set seconds of theEndDate to 0

set strFinal to ""

tell application "Calendar"
	-- Get duration of all events under "Research" calendar.
	set totalDuration to 0
	repeat with anEvent in (get events of calendar "Research")
		if start date of anEvent > theStartDate and start date of anEvent < theEndDate then
			set totalDuration to totalDuration + ((end date of anEvent) - (start date of anEvent))
		end if
	end repeat
	-- Add the duration to a string variable
	set strFinal to "R:" & totalDuration / hours & "h"
	
	-- Get duration of all events under "Teaching" calendar.
	set totalDuration to 0
	repeat with anEvent in (get events of calendar "Teaching")
		if start date of anEvent > theStartDate and start date of anEvent < theEndDate then
			set totalDuration to totalDuration + ((end date of anEvent) - (start date of anEvent))
		end if
	end repeat
	-- Add the duration to the string variable
	set strFinal to strFinal & " T:" & totalDuration / hours & "h"
	
	-- Get duration of all events under "Other" calendar.
	set totalDuration to 0
	repeat with anEvent in (get events of calendar "Other")
		if start date of anEvent > theStartDate and start date of anEvent < theEndDate then
			set totalDuration to totalDuration + ((end date of anEvent) - (start date of anEvent))
		end if
	end repeat
	-- Add the duration to the string variable
	set strFinal to strFinal & " O:" & totalDuration / hours & "h"
	
	-- Get duration of all events that contains "Admin:" under "Other" calendar.
	set totalDuration to 0
	repeat with anEvent in (get events of calendar "Other")
		if start date of anEvent > theStartDate and start date of anEvent < theEndDate and summary of anEvent contains "Admin:" then
			set totalDuration to totalDuration + ((end date of anEvent) - (start date of anEvent))
		end if
	end repeat
	-- Add the duration to the string variable
	set strFinal to strFinal & " (Admin:" & totalDuration / hours & "h)"
	
	-- Create an event with the summary text 30 minutes after the current time
	set theStartDate to (current date) + (30 * minutes)
	tell calendar "Note"
		make new event with properties {summary:strFinal, start date:theStartDate, end date:(theStartDate + (30 * minutes))}
	end tell
	
end tell
