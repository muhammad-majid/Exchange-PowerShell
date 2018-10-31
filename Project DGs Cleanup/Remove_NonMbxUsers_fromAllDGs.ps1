$path = Split-Path -parent $MyInvocation.MyCommand.Definition
$newpath  = $path + "\non_mailboxed_users.csv"
#$user = 'dgtest'

$DGs = Get-DistributionGroup

Import-CSV $newpath | ForEach-Object{
    foreach( $dg in $DGs){
        remove-distributiongroupmember -Identity $dg -Member $_.samAccountName -Confirm:$false #-ErrorAction SilentlyContinue
    }
}