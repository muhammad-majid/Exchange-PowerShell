# ***This script is used to verify the the total number of emails sent/ received by specific set of users
# *** Modify the variable $usersset to include the recipiens you would want and then run the script.
# *** we can add the users email address according to your requirement.***

$Allmessages = @() 
$P = 1 
do 
{ 
  $pagedmessages = Get-MessageTrace -StartDate (Get-Date -Hour 0 -Minute 00 -Second 00) -EndDate (get-date) -PageSize 1000 -Page $p | Select Received,SenderAddress,RecipientAddress,Size
  $Allmessages += $pagedmessages
  $p = $p + 1 
  
} 
until ($pagedmessages -eq $null) 

$usersset= @("user1@domain.com", "user2@domain.com", "user3@domain.com", "user4@domain.com")
foreach($user in $a)
{
	$senderssorted = $Allmessages | where{$_.senderaddress -match $user} |group senderaddress | select @{n="SentCount";e={$_.Count}}
	$recipientsorted = $Allmessages | where{$_.recipientaddress -match $user} |group recipientaddress | select @{n="ReceivedCount";e={$_.Count}}

	$temp = "" | select User,SentCount,ReceivedCount,Total
	$temp.User = $user
	$temp.Sentcount = $senderssorted.Sentcount
	$temp.ReceivedCount = $recipientsorted.ReceivedCount
	$temp.Total = $senderssorted.Sentcount + $recipientsorted.ReceivedCount
	$temp
}