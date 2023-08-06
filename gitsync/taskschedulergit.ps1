Write-Host "The script was launched by: $env:USERNAME"
$currentUser = $env:USERNAME
Start-Transcript -Path C:\Users\$currentUser\Documents\gitsync\gitsynclog.txt -Append
function BoDSync{
    $taskname = "BoDSync"

    # Try to get the task
    $task = Get-ScheduledTask -TaskName $taskname -ErrorAction SilentlyContinue

    # Check if the task was found
    if ($task -eq $null) {
        # If task was not found create it
        $action = New-ScheduledTaskAction -Execute 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe' -Argument "-File `"C:\Users\$currentUser\Documents\gitsync\gitsync.ps1`" -operation `"pull`""
        $trigger = New-ScheduledTaskTrigger -Daily -At 8AM
        $principal = New-ScheduledTaskPrincipal -UserId "$currentUser" -LogonType ServiceAccount -RunLevel Highest
        $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -DontStopOnIdleEnd
        Register-ScheduledTask -TaskName $taskname -Action $action -Trigger $trigger -Principal $principal -Settings $settings

    } else {
        # if the task was found, do nothing
        Write-Host "Task already exists."
    }
    
}

    
function EoDSync{
    $taskname = "EoDSync"

    # Try to get the task
    $task = Get-ScheduledTask -TaskName $taskname -ErrorAction SilentlyContinue

    # Check if the task was found
    if ($task -eq $null) {
        # If task was not found create it
        $action = New-ScheduledTaskAction -Execute 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe' -Argument "-File `"C:\Users\$currentUser\Documents\gitsync\gitsync.ps1`" -operation `"push`""
        $trigger = New-ScheduledTaskTrigger -Daily -At 4PM
        $principal = New-ScheduledTaskPrincipal -UserId "$currentUser" -LogonType ServiceAccount -RunLevel Highest
        $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -DontStopOnIdleEnd
        Register-ScheduledTask -TaskName $taskname -Action $action -Trigger $trigger -Principal $principal -Settings $settings

    } else {
        # if the task was found, do nothing
        Write-Host "Task already exists."
    }
    

    
}
BoDSync
EoDSync
Stop-Transcript