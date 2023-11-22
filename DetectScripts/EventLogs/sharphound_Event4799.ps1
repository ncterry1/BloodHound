#======================================
# ./sharphound_Event4799.ps1
# Check if SharpHound was run.
# You need to be running PowerShell as an Admin to get results.
#======================================
# In:      Event Viewer>>Windows Logs>>Security
# When listed by time.
# Event-Viewer, SharpHound red-flag is 4-EventIDs (4799) in a row. 
# Example:
#--------
#Client01.WidgetLLC.Internal    5379 1/13/2021 10:57:47 AM
#Client01.WidgetLLC.Internal    5379 1/13/2021 10:57:47 AM
#Client01.WidgetLLC.Internal    4798 1/13/2021 10:57:45 AM
#
#Client01.WidgetLLC.Internal    4799 1/13/2021 10:57:43 AM ------
#Client01.WidgetLLC.Internal    4799 1/13/2021 10:57:43 AM ------
#Client01.WidgetLLC.Internal    4799 1/13/2021 10:57:43 AM ------
#Client01.WidgetLLC.Internal    4799 1/13/2021 10:57:43 AM (we ran Sharphound)
#
#Client01.WidgetLLC.Internal    5059 1/13/2021 10:57:12 AM
#Client01.WidgetLLC.Internal    5061 1/13/2021 10:57:12 AM
#Client01.WidgetLLC.Internal    5058 1/13/2021 10:57:12 A
#===========================================
# SET TIMEFRAME YOU THINK SHARPHOUND WAS EXECUTED IN.
$begin = Get-Date -Date '01/13/2021 10:30:00' #Timeframe beginning
$end = Get-Date -Date '01/13/2021 11:00:00'   #Timeframe ending
#===========================================
# GATHER ALL EVENTS IN THIS TIME FRAME
$logs = Get-EventLog -LogName Security -After $begin -Before $end
#===========================================
# KEEP COUNT TIMES IN A ROW THAT EVENT-4799 APPEARS
$count=0  
#===========================================
# RUN THROUGH EVERY EVENT IN TIMEFRAME
for($i=0; $i -lt 50; $i++) {Write-Host "***************"} #Help Seperate Results
#=======
Write-Host "Explanation: `nSearching through:
`n Event-Viewer\Windows Logs\Security for SharpHound red-flag events. 
`n Searching for four EventID(4799) events in a row.
`n You need to be running PowerShell as an Admin to get results."
Write-Host "`n[START]"
#=======
ForEach ($log in $logs) 
{
    #IF WE HIT THE 4TH EVENT-4799 IN A ROW
    if ($log.EventID -eq '4799' -and $count -eq 3) 
    {
        Write-Host ("`n=============`nSharpHound Event WARNING!!!")
        Write-Host ($log | Select-Object -Property *, "`n=============") #STATE FULL EVENT DETAILS
        $count = 0 #RESET COUNT 
    }#END if-------------------------

    #FOUND 4799, BUT WE HAVENT REACHED 4 IN A ROW
    elseif ($log.EventID -eq '4799') 
    {
        $count = $count + 1
        Write-Host "`nEvent-Viewer>>Windows Logs>>Security`
        Event-4799 count = $count"
    }#END elseif---------------------

    #IF NOT 4799, THEN RESET. LOOKING FOR 4 IN A ROW
    elseif ($log.EventID -ne '4799') 
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
Explanation: 
Searching through:
 Event-Viewer\Windows Logs\Security for SharpHound red-flag events. 
 Searching for four EventID(4799) events in a row.

[START]
Event-Viewer>>Windows Logs>>Security
        Event-4799 count = 1

Event-Viewer>>Windows Logs>>Security
        Event-4799 count = 2

Event-Viewer>>Windows Logs>>Security
        Event-4799 count = 3

=============
SharpHound Event WARNING!!!
@{EventID=4799; MachineName=Client01.WidgetLLC.Internal; Data=System.Byte[]; Index
=16641; Category=(13826); CategoryNumber=13826; EntryType=SuccessAudit; Message=A 
security-enabled local group membership was enumerated.

Subject:
	Security ID:		S-1-5-21-2778787315-2228761457-209862467-500
	Account Name:		Administrator
	Account Domain:		WIDGETLLC
	Logon ID:		0xecce9

Group:
	Security ID:		S-1-5-32-562
	Group Name:		Distributed COM Users
	Group Domain:		Builtin

Process Information:
	Process ID:		0x15d4
	Process Name:		C:\Users\ncterry.WIDGETLLC\Desktop\Bloodhound\BloodHound-master\Co
llectors\SharpHound.exe; Source=Microsoft-Windows-Security-Auditing; ReplacementSt
rings=System.String[]; InstanceId=4799; TimeGenerated=1/13/2021 10:57:43 AM; TimeW
ritten=1/13/2021 10:57:43 AM; UserName=; Site=; Container=; 
==============}
#>
#======================================
#======================================
