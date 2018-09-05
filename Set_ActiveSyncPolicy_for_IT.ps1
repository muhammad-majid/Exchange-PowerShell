    # Put members of the Dist Group into a dynamic array
    $allMembers = Get-DistributionGroupMember -Identity IT

    # Loop through each person in the allMembers array
    foreach ($member in $allMembers) {
    # Set ActiveSync for each member of the array
    $member | Set-CASMailbox -ActiveSyncEnabled $true
    # Set ActiveSync Policy for each member of the array
    $member | Set-Mailbox -ActiveSyncMailboxPolicy "5Devices"
    }