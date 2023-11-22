#./findSimilarFilenames.ps1
#=======================================================================
<#
Sharphound saves files named like this:       20210105142808_BloodHound.zip 
=======================================================================
We want to find any files with 14 digits followed by an underscore
2 ways we found that worked....
#>
#=======================================================================
#=======================================================================
#=======================================================================
Get-Childitem -Path C:\Users\ncterry.WIDGETLLC\Desktop\ -Recurse -Include '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]_*'

Get-Childitem -Path C:\Users\ncterry.WIDGETLLC\Desktop\ -Recurse | Where-Object {$_.Name -match '\d{14}_*'}
#=======================================================================
#=======================================================================
#=======================================================================
# If looking for 14letters - instead of [0-9] use [a-zA-Z]{14}
<#======================================================================
#=======================================================================
PS C:\> Get-Childitem -Path C:\Users\ncterry.WIDGETLLC\Desktop\ -Recurse | Where-Object {$_.Name -match '\d{14}_*'}


    Directory: C:\Users\ncterry.WIDGETLLC\Desktop
Mode                LastWriteTime         Length Name                                                                                                         
----                -------------         ------ ----                                                                                                         
d-----         1/8/2021   1:38 PM                20210105142808_BloodHound                                                                                    


    Directory: C:\Users\ncterry.WIDGETLLC\Desktop\20210105142808_BloodHound
Mode                LastWriteTime         Length Name                                                                                                         
----                -------------         ------ ----                                                                                                         
------         1/5/2021   2:28 PM           7513 20210105142808_computers.json                                                                                
------         1/5/2021   2:28 PM           2813 20210105142808_domains.json                                                                                  
------         1/5/2021   2:28 PM           3936 20210105142808_gpos.json                                                                                     
------         1/5/2021   2:28 PM          77211 20210105142808_groups.json                                                                                   
------         1/5/2021   2:28 PM           5371 20210105142808_ous.json                                                                                      
------         1/5/2021   2:28 PM          19865 20210105142808_users.json                                                                                    


    Directory: C:\Users\ncterry.WIDGETLLC\Desktop\Bloodhound\BloodHound-master\Collectors
Mode                LastWriteTime         Length Name                                                                                                         
----                -------------         ------ ----                                                                                                         
-a----         1/5/2021   2:28 PM           9789 20210105142808_BloodHound.zip                                                                                
-a----         1/5/2021   2:56 PM           9889 20210105145646_BloodHound.zip                                                                                
-a----         1/5/2021   3:03 PM           9784 20210105150313_BloodHound.zip                                                                                
-a----         1/5/2021   3:14 PM           9795 20210105151406_BloodHound.zip                                                                                
-a----         1/6/2021   8:55 AM           9823 20210106085501_BloodHound.zip                                                                                
#>
#=======================================================================