$FUser = Read-Host "Enter the mail adress of the user you want to copy mailbox permissions from"
$TUser = Read-Host "Enter the mail adress of the user you want to set mailbox permissions for"

$GPerm = Get-Mailbox | Get-MailboxPermission -User $FUser

$GPerm | ForEach-Object { $_ 
Add-MailboxPermission -Identity $_.Identity -AccessRights FullAccess -InheritanceType All -AutoMapping:$true -User $TUser
Add-RecipientPermission -Identity $_.Identity -AccessRights SendAs -Confirm:$false -Trustee $TUser
}
