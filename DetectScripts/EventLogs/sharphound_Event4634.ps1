#======================================
# ./sharphound_Event4634.ps1
# Check if SharpHound was run.
#======================================
# You need to be running PowerShell as an Admin to get results with this.
# This must be run on AD-Domain Controller.
# Looking for multiple AD logoffs in a row (Event 4634).
# Cannot see a row of 4634's on local machines, only on the DC
#======================================
# In:      Event Viewer>>Windows Logs>>Security
# When listed by time.
# Event-Viewer, SharpHound red-flag is at least 5 EventIDs (4634) in a row.
# We are looking for more than 5, Event-4634 in a row, with no other InstanceIds
# This indicates a wide range of nearly simaltaneous logoffs done by Sharphound.
# NOTE - An administrator can also cause numerous logoffs.
#      - Sequential 4634 does not mean Sharphound, but Sharphound always does cause it.
# Example:
#--------
#DC01.WidgetLLC.Internal       4769 1/19/2021 12:37:35 PM
#
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM <---
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM <---
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM <---
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM <---
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM <---
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM <---
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM <---
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM <---
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM <---
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM <---
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM <---
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM <---
#
#DC01.WidgetLLC.Internal       4624 1/19/2021 12:37:34 PM
#DC01.WidgetLLC.Internal       4672 1/19/2021 12:37:34 PM
#DC01.WidgetLLC.Internal       4634 1/19/2021 12:37:34 PM
#DC01.WidgetLLC.Internal       4624 1/19/2021 12:37:34 PM
#DC01.WidgetLLC.Internal       4672 1/19/2021 12:37:34 PM
#===========================================
# SET TIMEFRAME YOU THINK SHARPHOUND WAS EXECUTED IN.
# Needs to be in format that corresponds with local machine.
$begin = Get-Date -Date '01/19/2021 10:30:00' #Timeframe beginning
$end = Get-Date -Date '01/19/2021 14:00:00'   #Timeframe ending
#===========================================
# GATHER ALL EVENTS IN THIS TIME FRAME
$logs = Get-EventLog -LogName Security -After $begin -Before $end
#===========================================
# KEEP COUNT TIMES IN A ROW THAT EVENT-4634 APPEARS
$count=0  
#===========================================
# RUN THROUGH EVERY EVENT IN TIMEFRAME
for($i=0; $i -lt 50; $i++) {Write-Host "***************"} #Help Read Results
Write-Host "Explanation: `nSearching through:
`n Event-Viewer\Windows Logs\Security for SharpHound red-flag events. 
`n Searching for at least five EventID(4634) events in a row.
`n Must be running PowerShell as an Admin to get results.
`n THIS script must be run on the Domain Controller to catch red-flags."
Write-Host "`n[START]"
#===========================================
ForEach ($log in $logs) 
{
    #IF WE HIT THE 5TH EVENT-4634 IN A ROW
    if ($log.EventID -eq '4634' -and $count -eq 5) 
    {
        Write-Host ("`n=============`nSharpHound Event WARNING!!!")
        Write-Host ($log | Select-Object -Property *, "`n=============") #STATE FULL EVENT DETAILS
    }#END if-------------------------

    #FOUND 4634, BUT WE HAVENT REACHED 5 IN A ROW
    elseif ($log.EventID -eq '4634') 
    {
        $count = $count + 1
        Write-Host "`nEvent-Viewer>>Windows Logs>>Security`
        Event-4634 count = $count"
    }#END elseif---------------------

    #IF NOT 4634, THEN RESET. LOOKING FOR 5 IN A ROW
    elseif ($log.EventID -ne '4634') 
    {
        $count = 0
    }#END elseif---------------------

}#END ForEach
#======================================
#======================================
#======================================
#======================================
<#
Example Results:
***************
***************
***************
Explanation: 
Searching through:
 Event-Viewer\Windows Logs\Security for SharpHound red-flag events. 
 Searching for eight EventID(4634) events in a row.
 You need to be running PowerShell as an Admin to get results.

[START]
Event-Viewer>>Windows Logs>>Security
        Event-4634 count = 1
Event-Viewer>>Windows Logs>>Security
        Event-4634 count = 1
Event-Viewer>>Windows Logs>>Security
        Event-4634 count = 2
Event-Viewer>>Windows Logs>>Security
        Event-4634 count = 1
Event-Viewer>>Windows Logs>>Security
        Event-4634 count = 1
Event-Viewer>>Windows Logs>>Security
        Event-4634 count = 2
Event-Viewer>>Windows Logs>>Security
        Event-4634 count = 3
Event-Viewer>>Windows Logs>>Security
        Event-4634 count = 4
=============
SharpHound Event WARNING!!!
@{EventID=4634; MachineName=DC01.WidgetLLC.Internal; Data=System.Byte[]; Index=112347; Category=(12545); CategoryNumber=12545; EntryT
ype=SuccessAudit; Message=An account was logged off.

Subject:
	Security ID:		S-1-5-21-2778787315-2228761457-209862467-500
	Account Name:		Administrator
	Account Domain:		WIDGETLLC
	Logon ID:		0x34a12b

Logon Type:			3

This event is generated when a logon session is destroyed. It may be positively correlated with a logon event using the Logon ID valu
e. Logon IDs are only unique between reboots on the same computer.; Source=Microsoft-Windows-Security-Auditing; ReplacementStrings=Sy
stem.String[]; InstanceId=4634; TimeGenerated=1/19/2021 10:50:31 AM; TimeWritten=1/19/2021 10:50:31 AM; UserName=; Site=; Container=;
 
==============}
Event-Viewer>>Windows Logs>>Security
        Event-4634 count = 1
Event-Viewer>>Windows Logs>>Security
        Event-4634 count = 1
Event-Viewer>>Windows Logs>>Security
        Event-4634 count = 1
==============}
#>
#======================================
#======================================
