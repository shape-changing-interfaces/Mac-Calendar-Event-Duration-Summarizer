set theStartDate to (current date) - (6 * days)
set hours of theStartDate to 0
set minutes of theStartDate to 0
set seconds of theStartDate to 0

set theEndDate to (current date)
set hours of theEndDate to 0
set minutes of theEndDate to 0
set seconds of theEndDate to 0

set strFinal to ""

set totalDuration to 0
-- theStartDate

tell application "Calendar"
	repeat with anEvent in (get events of calendar "Research")
		if start date of anEvent > theStartDate and start date of anEvent < theEndDate then
			set totalDuration to totalDuration + ((end date of anEvent) - (start date of anEvent))
		end if
	end repeat
	set strFinal to "R:" & totalDuration / hours & "h"
	
	set totalDuration to 0
	repeat with anEvent in (get events of calendar "Teaching")
		if start date of anEvent > theStartDate and start date of anEvent < theEndDate then
			set totalDuration to totalDuration + ((end date of anEvent) - (start date of anEvent))
		end if
	end repeat
	set strFinal to strFinal & " T:" & totalDuration / hours & "h"
	
	set totalDuration to 0
	repeat with anEvent in (get events of calendar "Other")
		if start date of anEvent > theStartDate and start date of anEvent < theEndDate then
			set totalDuration to totalDuration + ((end date of anEvent) - (start date of anEvent))
		end if
	end repeat
	set strFinal to strFinal & " O:" & totalDuration / hours & "h"
	
	set totalDuration to 0
	repeat with anEvent in (get events of calendar "Other")
		if start date of anEvent > theStartDate and start date of anEvent < theEndDate and summary of anEvent contains "Admin:" then
			set totalDuration to totalDuration + ((end date of anEvent) - (start date of anEvent))
		end if
	end repeat
	set strFinal to strFinal & " (Admin:" & totalDuration / hours & "h)"
	
	set theStartDate to (current date) + (30 * minutes)
	tell calendar "Note"
		make new event with properties {summary:strFinal, start date:theStartDate, end date:(theStartDate + (30 * minutes))}
	end tell
	
end tell


--strFinal
