#======================================
#./azurehound_KeywordSearch.ps1
#======================================
# Current search all of C:\
#======================================
# Keyword search 
# Files named anything with azurehound. 
# Case-Insensitive
#======================================
for($i=0; $i -lt 50; $i++) {Write-Host "***************"} #Help Read Results
Write-Host "`n`n`n`n`n`n`n`nFILES LABELED WITH STRING 'AZUREHOUND'
`nCase-Insensitive
`nAny location in title."
#======================================
Get-Childitem -Path C:\ -Recurse -Include *azurehound* -Force -ErrorAction SilentlyContinue
#======================================
#======================================
#======================================
#Example-----------------------------------------------------------------
#Directory: C:\Users\ncterry\Bloodhound\BloodHound-master\docs\data-collection
#Mode                LastWriteTime         Length Name                          
#----                -------------         ------ ----                          
#-a----        12/9/2020  12:59 PM           2537 azurehound.rst  
#======================================
#======================================
#======================================