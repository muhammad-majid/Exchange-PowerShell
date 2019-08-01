foreach ($room in $(Get-Content C:\scripts\meetingRooms.txt))
{
	Remove-MailboxFolderPermission -Identity "$($room):\calendar" -User farzana.mahfuz -Confirm:$False
	Add-MailboxFolderPermission -Identity "$($room):\calendar" -User farzana.mahfuz -AccessRights Owner -Confirm:$False
}
