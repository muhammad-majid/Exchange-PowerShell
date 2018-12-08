#Set-ExecutionPolicy RemoteSigned
Set-ExecutionPolicy Bypass
$credential = Get-Credential
Connect-MsolService -Credential $credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell-liveid?DelegatedOrg=elston.com.au -Credential $credential -Authentication Basic -AllowRedirection
Import-PSSession $Session
#Remove-PSSession
