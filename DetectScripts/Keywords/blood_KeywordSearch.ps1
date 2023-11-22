#======================================
#./blood_KeywordSearch.ps1
#======================================
# Current search all of C:\
#======================================
# Keyword search 
# Files named anything with blood. 
# Case-Insensitive
#======================================
for($i=0; $i -lt 50; $i++) {Write-Host "***************"} #Help Seperate Results
Write-Host "`n`n`n`n`n`n`n`nFILES LABELED WITH STRING 'BLOOD'
`nCase-Insensitive
`nAny location in title."
#======================================
Get-Childitem -Path C:\ -Recurse -Include *blood* -Force -ErrorAction SilentlyContinue
#======================================
#======================================
#======================================
#Example-----------------------------------------------------------------
#Directory: C:\Windows\Prefetch
#Mode                LastWriteTime         Length Name                            
#----                -------------         ------ ----                            
#-a----        1/13/2021  10:55 AM          35339 BLOODHOUND.EXE-73CA478D.pf   
#======================================
#======================================
#======================================