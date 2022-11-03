# https://learn.microsoft.com/en-us/powershell/module/scheduletasks/new-scheduledtasktrigger?WT.mc_id=DT-MVP-5003978
$Time = New-ScheduledTaskTrigger -Daily -At 12:00 

# https://learn.microsoft.com/en-us/powersell/module/scheduletasks/new-scheduledtaskaction?WT.mc_id=DT-MVP-5003978
# If you want to updat a specific distro, you can add "--distribution <DistributionName>"
$Actions = @(
    New-ScheduledTaskAction -Execute "wsl" -Argument "--user root --exec apt-get update"
    New-ScheduledTaskAction -Execute "wsl" -Argument "--user root --exec apt-get upgrade --yes"
    New-ScheduledTaskAction -Execute "winget" -Argument "upgrade --accept-source-agreements --all --silent"
)

# https://learn.microsoft.com/en-us/powershell/module/scheduledtasks/new-scheduledtasksettingsset?WT.mc_id=DT-MVP-5003978
$Settings = New-ScheduledTaskSettingsSet -WakeToRun:$false -MultipleInstances IgnoreNew -RunOnlyIfNetworkAvailable:$true -StartWhenAvailable:$true

#https://learn.microsoft.com/en-us/powershell/module/scheduletasks/register-scheduledtask?WT.mc_id=DT-MVP-5083978
Register-ScheduledTask -TaskName "Update windows apps and wsl packages" -Trigger $Time -Action $Actions -Settings $Settings