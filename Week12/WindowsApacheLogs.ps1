clear

# List all the apache logs of xampp
# Get-Content -Path "C:\xampp\apache\logs\access.log"

# List only the last 5 apache logs of xampp
# Get-Content -Path "C:\xampp\apache\logs\access.log" -Tail 5

# Display only logs that contain 404 (Not Found) or 400 (Bad Request)
# Get-Content -Path "C:\xampp\apache\logs\access.log" | Select-String -Pattern ' 404 ', ' 400 '

# Display only logs that do NOT contain 200 (OK
 $B = Get-Content -Path "C:\xampp\apache\logs\access.log" | Select-String ' 200 ' -NotMatch
# $B

# From every .log file in the directory, only get logs that contains the word 'error'
# $A = Get-ChildItem -Path C:\xampp\apache\logs\*.log | Select-String -Pattern 'error'
# $A[-5..-1]

# Display IP addresses from query from before
$regex = [regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"
$ips = $regex.Matches($B) | select @{Name="IP"; Expression={ $_.value }}
# $ips

# Count $ips from above
$counts = $ips | group IP -NoElement
# $counts

#Add a column, if the count is greater than 3, it will be abnormal, otherwise normal
$countsDetailed = $counts | Select Count, Name, `
@{Name="Decision"; Expression={ if($_.Count -gt 3) {"Abnormal"}
                                else {"Normal"}
                                 }}

# $countsDetailed

#Block IPS for which the Decision column is "Abnormal"
foreach ($ip in $countsDetailed){
    
    if([string]$ip.Decision -match "Abnormal") {
    Write-Host "Blocking $ip.Name"
    New-NetFirewallRule -DisplayName "Bad IPs $ip.Name" `
    -Direction Inbound -Action Block -RemoteAddress $ip.Name
    }

}

# Remove created firewall rules for bad IPs
Remove-NetFirewallRule -DisplayName "Bad IPs*"