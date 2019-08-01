
forEach ($dgMember in $(Get-Content C:\scripts\dgmembers.txt))
{
	Write-Host -ForegroundColor green "Setting permission for $($dgMember)..."
	foreach ($room in $(Get-Content C:\scripts\meetingRooms.txt))
	{
		#remove mailbox fodler permission
		Remove-MailboxFolderPermission -Identity "$($room):\calendar" -User $($dgMember) -Confirm:$False
		Add-MailboxFolderPermission -Identity "$($room):\calendar" -User $($dgMember) -AccessRights NonEditingAuthor -Confirm:$False
	}
}
