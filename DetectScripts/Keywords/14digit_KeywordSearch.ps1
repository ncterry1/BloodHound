#======================================
#./14digit_KeywordSearch.ps1
#======================================
# Current search all of C:\
#======================================
# Sharphound saves files named like this:       
# 20210105142808_BloodHound.zip, 20210105142808_computers.json, etc. 
# Find any files named starting with 14 digits followed by an underscore
#======================================
for($i=0; $i -lt 50; $i++) {Write-Host "***************"} #Help Seperate Results
Write-Host "`n`n`n`n`n`n`n`nFILES WITH SHARPHOUND NAMING FORMAT"
#======================================
Get-Childitem -Path C:\ -Recurse -Force -ErrorAction SilentlyContinue | Where-Object {$_.Name -match '^\d{14}_*'}
#Example-----------------------------------------------------------------
#Directory: C:\Users\ncterry.WIDGETLLC\Desktop\20210105142808_BloodHound
#Mode                LastWriteTime         Length Name                            
#----                -------------         ------ ----                            
#------         1/5/2021   2:28 PM           7513 20210105142808_computers.json   
#------         1/5/2021   2:28 PM           2813 20210105142808_domains.json     
#------         1/5/2021   2:28 PM           3936 20210105142808_gpos.json  
#======================================