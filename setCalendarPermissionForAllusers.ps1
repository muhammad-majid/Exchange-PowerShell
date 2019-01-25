$users = Get-Mailbox -Resultsize Unlimited
$users2 = Get-Mailbox -Resultsize Unlimited
foreach ($user in $users) {
Write-Host -ForegroundColor green "Setting permission for $($user.alias)..."
foreach ($user2 in $users2) {
add-MailboxFolderPermission -Identity "$($user.alias):\calendar" -User $($user2.alias) -AccessRights PublishingEditor
}}
