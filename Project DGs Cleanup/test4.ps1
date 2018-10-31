$Groups = Get-ADGroup -Filter 'groupcategory -eq "distribution"'
ForEach ($Group In $Groups)
{
    "Group: " + $Group.Name
    $user = Get-ADGroupMember -Identity $Group -Recursive | Get-ADUser | Where-Object {$_.emailaddress -notlike "*"}
    "User: " + $user
}