-- get todoist token from TODOIST_TOKEN environment variable
set todoistToken to system attribute "TODOIST_TOKEN"

if todoistToken is {} then
	display dialog "Please set TODOIST_TOKEN environment variable (e.g. 'export TODOIST_TOKEN='TOKENHERE')" with icon 1
	return
end if

tell application "Microsoft Outlook"
	
	-- get the currently selected message or messages
	set selectedMessages to current messages
	
	-- if there are no messages selected, warn the user and then quit
	if selectedMessages is {} then
		display dialog "Please select a message first and then run this script." with icon 1
		return
	end if
	
	repeat with theMessage in selectedMessages
		-- get the information from the message, and store it in variables
		set theName to subject of theMessage
		set theSender to sender of theMessage
		set thePriority to priority of theMessage
		if thePriority is priority high then
			set thePriority to "4"
		else
			set thePriority to "0"
		end if
		
		set myUUID to do shell script "uuidgen"
		-- create a new task with the information from the message
		set content = theName & " for " & name of theSender
		set todoistData to "{\"content\": \"testing\", \"due_string\": \"tomorrow\", \"due_lang\": \"en\", \"priority\": 4}"
		set curlCommand to "https://api.todoist.com/rest/v2/tasks -X POST -d " & "'"&todoistData&"'"  & " -H \"Content-Type: application/json\"" & " -H \"X-Request-Id: " & myUUID &"\"" & " -H \"Authorization: Bearer " & todoistToken & "\""
--		display dialog "curlCommand " & curlCommand
		do shell script "curl " & curlCommand
	end repeat
	
end tell