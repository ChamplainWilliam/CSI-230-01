cd C:\Users\champuser\Desktop\

clear

Get-EventLog -list

$readLog = Read-Host -Prompt "Please select a log to review"

Get-EventLog -LogName $readLog -Newest 3 | export-csv -NoTypeInformation -Path "C:\Users\champuser\Desktop\rep.csv"