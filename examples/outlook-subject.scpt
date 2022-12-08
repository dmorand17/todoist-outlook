tell application "Microsoft Outlook"
	set selectedMessages to selected objects
	set messageSubject to subject of item 1 of selectedMessages
	display notification messageSubject
end tell
