$virtds = "ECP,OWA,OAB,WebServices,Activesync"
 $array = $virtds.split(",")
 foreach ($i in $array) {
 $j = "Get-"+$i+"VirtualDirectory"+" | fl name,server,internalurl,externalurl"
 iex $j
 }