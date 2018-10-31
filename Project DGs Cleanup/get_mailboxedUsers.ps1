Get-ADUser -LDAPFilter "(msExchMailboxGuid=*)" | Export-Csv -NoTypeInformation 'C:\Scripts\mailboxed_users.csv'
