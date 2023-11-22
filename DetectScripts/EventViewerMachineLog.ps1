<#
Find Event-Viewer >> Windows Logs >> Security
Check for Events with the EventID 4624
Print out correlating MachineNames that are attached to that login event.
#>
$begin = Get-Date -Date '12/22/2020 11:00:00'
$end = Get-Date -Date '1/5/2021 16:00:00'
$logs = Get-EventLog -LogName Security -InstanceId 4624 -After $begin -Before $end
$logs | Select-Object -Property MachineName