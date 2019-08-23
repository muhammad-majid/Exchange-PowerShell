foreach ($room in $(Get-Content C:\scripts\meetingRooms.txt))
{
	Remove-MailboxFolderPermission -Identity "$($room):\calendar" -User laura.mccallum -Confirm:$False
	Add-MailboxFolderPermission -Identity "$($room):\calendar" -User laura.mccallum -AccessRights Owner -Confirm:$False
}
