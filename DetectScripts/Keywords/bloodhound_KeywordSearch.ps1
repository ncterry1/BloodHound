#======================================
#./bloodhound_KeywordSearch.ps1
#======================================
# Current search all of C:\
#======================================
# Keyword search 
# Files named anything with bloodhound. 
# Case-Insensitive
#======================================
for($i=0; $i -lt 50; $i++) {Write-Host "***************"} #Help Read Results
Write-Host "`n`n`n`n`n`n`n`nFILES LABELED WITH STRING 'BLOODHOUND'
`nCase-Insensitive
`nAny location in title."
#======================================
Get-Childitem -Path C:\ -Recurse -Include *bloodhound* -Force -ErrorAction SilentlyContinue
#======================================
#======================================
#======================================
#Example-----------------------------------------------------------------
#Directory: C:\Users\ncterry.WIDGETLLC\AppData\Roaming
#Mode                LastWriteTime         Length Name                            
#----                -------------         ------ ----                            
#d-----         1/5/2021   2:16 PM                bloodhound   
#======================================
#======================================
#======================================