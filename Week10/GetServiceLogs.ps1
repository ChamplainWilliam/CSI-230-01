function serviceLogs
{
    $serviceStatus = @('All', 'Stopped', 'Running')
    $input = Read-Host -Prompt "Do you want to see 
    [1] All services
    [2] Stopped services
    [3] Running services
    [4] Quit
    "
     if ($input -eq 1)
     {
        Get-Service
        serviceLogs
     }

     if ($input -eq 2)
    {
       Get-Service | Where-Object { $_.Status -eq $serviceStatus[1] }
       serviceLogs
    }

     if ($input -eq 3)
    {
       Get-Service | Where-Object { $_.Status -eq $serviceStatus[2] }
       serviceLogs
    }
    if ($input -eq 4)
    {
        exit
    }
    else
    {
       Write-Host "Invalid input, must be between 1-4"
       serviceLogs
    }
}
serviceLogs