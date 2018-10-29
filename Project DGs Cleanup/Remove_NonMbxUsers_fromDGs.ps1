$path     = Split-Path -parent $MyInvocation.MyCommand.Definition
$newpath  = $path + "\non_mailboxed_users.csv"
$log      = $path + "\DistributionGroups_Cleanup.log"

Function insertTimeStamp { return (Get-Date).ToString('yyyy-MM-dd HH:mm:ss') + ' : ' }

#Get-ADUser -LDAPFilter "(!msExchMailboxGuid=*)" | Export-Csv -NoTypeInformation $path + '\non_mailboxed_users.csv'


Import-CSV $newpath | ForEach-Object{

    $mySamAccountName = $_.SamAccountName
    "Iteration Start for $($mySamAccountName) ------------------------------------" | Out-File $log -append
    $VarDistributionGroups = Get-DistributionGroup | where { (Get-DistributionGroupMember $_.Name | foreach {$_.PrimarySmtpAddress}) -contains $mySamAccountName}
    $($VarDistributionGroups) | Out-File $log -append
    "Iteration End for $($mySamAccountName) --------------------------------------" | Out-File $log -append
}