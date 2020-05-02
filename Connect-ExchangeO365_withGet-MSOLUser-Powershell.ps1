Import-Module MSOnline
$MyCredential = Get-Credential
$O365Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell -Credential $MyCredential -Authentication Basic -AllowRedirection
Import-PSSession $O365Session -AllowClobber
Connect-MsolService -Credential $MyCredential
