#======================================
#./sharphound_KeywordSearch.ps1
#======================================
# Current search all of C:\
#======================================
# Keyword search 
# Files named anything with sharphound. 
# Case-Insensitive
#======================================
for($i=0; $i -lt 50; $i++) {Write-Host "***************"} #Help Read Results
Write-Host "`n`n`n`n`n`n`n`nFILES LABELED WITH STRING 'SHARPHOUND'
`nCase-Insensitive
`nAny location in title."
#======================================
Get-Childitem -Path C:\ -Recurse -Include *sharphound* -Force -ErrorAction SilentlyContinue
#======================================
#======================================
#======================================
#Example-----------------------------------------------------------------
#Directory: C:\Users\Administrator\AppData\Local\Microsoft\CLR_v4.0_32\UsageLogs
#Mode                LastWriteTime         Length Name                            
#----                -------------         ------ ----                            
#-a----        1/13/2021  10:57 AM           3558 SharpHound.exe.log
#======================================
#======================================
#======================================