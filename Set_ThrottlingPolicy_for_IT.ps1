    # Put members of the Dist Group into a dynamic array
    $allMembers = Get-DistributionGroupMember -Identity IT

    # Loop through each person in the allMembers array
    foreach ($member in $allMembers) {
    # Set ActiveSync for each member of the array
    $member | Set-CASMailbox -ActiveSyncEnabled $true
    # Set Throttling Policy for each member of the array
    $member | Set-Mailbox -ThrottlingPolicy "DefaultThrottlingPolicy_dbf4b4f5-0932-4e79-9a7d-fe5f45c8abb6"
    }

