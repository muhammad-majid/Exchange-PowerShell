$saveto = "C:\Scripts\listmembers2.txt"

Get-DistributionGroup | sort name | ForEach-Object {

	"`r`n$($_.Name)`r`n=============" | Add-Content $saveto
	Get-DistributionGroupMember $_.Name | ForEach-Object {
		If($_.RecipientType -eq "UserMailbox")
			{
				$_.Name + " (" + $_.PrimarySMTPAddress + ")" | Add-Content $saveto
			}
	}
}