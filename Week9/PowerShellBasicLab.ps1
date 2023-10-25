# Get IPv4 from ethernet interface
# (Get-NetIPAddress -AddressFamily IPv4 | where InterfaceAlias -ilike "Ethernet*").IPAddress

# Get IPv4 PrefixLength from ethernet interface
# (Get-NetIPAddress -AddressFamily IPv4 | where InterfaceAlias -ilike "Ethernet*").PrefixLength

# Show classes there are of Win32 library that starts with net, sorted alphabetically
# Get-WmiObject -list | where { $_.Name -ilike "Win32_Net*" } | Sort-Object

# Get DHCP Server IP, hide the table headers
# Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" `
# | select DHCPServer | Format-Table -HideTableHeaders

# Get DNS Server IPs for Ethernet interface and only display the first one
# (Get-DnsClientServerAddress -AddressFamily IPv4 | `
# where InterfaceAlias -ilike "Ethernet*").ServerAddresses[0]

# Choose a directory where you have some files
# cd "C:\Users\champuser\Desktop"
# List based on the file name
# $files=(Get-ChildItem)
# for($j=0; $j -le $files.Length; $j++)
# {
#     if($files[$j].Extension -ilike "*ps1")
#     {
#         $files[$j].BaseName + $files[$j].Extension
#     }
# }

#Create folder if it does not exist
# $folderPath = "C:\Users\champuser\Desktop\CSI-230-01\Week9\outfolder"
# if (Test-Path $folderPath)
# {
#     Write-Host "Folder Already Exists"
# }
# else
# {
#     New-Item -ItemType Directory -Path $folderPath
# }

# $files=(Get-ChildItem)

# $folderPath = "C:\Users\champuser\Desktop\CSI-230-01\Week9\outfolder\"
# $filePath = Join-Path $folderPath "out.csv"
# List all the files that has the extension ".ps1"
# and save the results to out.csv file
# $files | where { $_.Extension -like ".ps1" } | `
# Export-Csv -Path $filePath

# Without changing directory (don't go in outfolder), find
# every .csv file recursively and change their extensions to 
# .log Recursively display all the files (not directories)
$files=(Get-ChildItem -Recurse -File)
$files | Rename-Item -NewName { $_.Name -replace '.csv' , '.log' }
Get-ChildItem -Recurse -File