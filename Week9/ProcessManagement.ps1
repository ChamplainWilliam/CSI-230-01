# 1) Write a PowerShell script that lists every process for which the StartTime is in the last hour
# and ProcessName starts with 'C'

# Get-Process -name "C*" | Where-Object { $_.StartTime -ge "10/29/2023 16:00:00" }

# 2) Write a PowerShell script that lists every process for which the path does not include the string "system32"

# Get-Process | Where-Object { $_.Path -notlike "*system32" }

# 3) Write a PowerShell script that lists every stopped service, orders it alphabetically, and saves it to a csv file

# $csvPath = "C:\Users\champuser\Desktop\CSI-230-01\Week9\myProcesses.csv"
# Get-Service | Where-Object { $_.Status -eq "Stopped" } | Sort-Object DisplayName `
# | Export-Csv -Path $csvPath

# 4) Write a PowerShell script that lists every file with .ps1 extension, and sorts them by CreationTime (only .ps1 files)

# cd C:\Users\champuser\Desktop\CSI-230-01\Week9
# Get-ChildItem -Filter *.ps1 | Sort-Object CreationTime

# 5) Write a PowerShell script that lists every file whose creation date is greater than 10/24/2023
# (you might need to reformat this date), saves file names and creation dates (only these two)
# to a csv file without the headers (No info headers on the csv file. We have examples in slides)

# Get-ChildItem | Where-Object { $_.LastWriteTime -gt "10/24/2023" }

# 6) Write a PowerShell script that
#    a)If an instance of it is not already running, it starts Google Chrome web browser and directs it Champlain.edu
#    b)If an instance is already running, stops it

if (Get-Process -Name chrome -ErrorAction SilentlyContinue)
{
    Stop-Process -Name chrome
}
else
{
    start 'C:\Program Files\Google\Chrome\Application\chrome.exe' "http://www.champlain.edu"
}