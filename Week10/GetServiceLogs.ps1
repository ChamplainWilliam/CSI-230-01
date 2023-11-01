# function that lists registered services that the user wants. 
# uses recursion to keep it running until the user quits.
function serviceLogs
{
    # array with the three possible values
    $serviceStatus = @('All', 'Stopped', 'Running')
    # prompt user for imput
    $input = Read-Host -Prompt "Do you want to see 
    [1] All services
    [2] Stopped services
    [3] Running services
    [4] Quit
    "
     # user wants to see all services
     if ($input -eq 1)
     {
        Get-Service
        serviceLogs
     }
     # user wants to see stopped services
     if ($input -eq 2)
    {
       Get-Service | Where-Object { $_.Status -eq $serviceStatus[1] }
       serviceLogs
    }
     # user wants to see running services
     if ($input -eq 3)
    {
       Get-Service | Where-Object { $_.Status -eq $serviceStatus[2] }
       serviceLogs
    }
    # user wants to quit
    if ($input -eq 4)
    {
        exit
    }
    # invalid input
    else
    {
       Write-Host "Invalid input, must be between 1-4"
       serviceLogs
    }
}
serviceLogs