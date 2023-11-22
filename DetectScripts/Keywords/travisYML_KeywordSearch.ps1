#======================================
#./travisYML_KeywordSearch.ps1
#======================================
# Current search all of C:\
#======================================
# Keyword search 
# Files named anything with .travis.yml
# These are primary installation\run files for Bloodhound w\Unique names
# Case-Insensitive
#======================================
for($i=0; $i -lt 50; $i++) {Write-Host "***************"} #Help Read Results
Write-Host "`n`n`n`n`n`n`n`nFILES LABELED WITH STRING '.travis.yml'
`nCase-Insensitive
`nAny location in title."
#======================================
Get-Childitem -Path C:\ -Recurse -Include *travis.yml* -Force -ErrorAction SilentlyContinue
#======================================
#======================================
#======================================
#Example-----------------------------------------------------------------
#Directory: C:\Users\ncterry\Bloodhound\BloodHound-win32-x64\resources\app
#Mode                LastWriteTime         Length Name                          
#----                -------------         ------ ----                          
#-a----       10/11/2016   7:56 PM           2046 .travis.yml               
#======================================
#======================================
#======================================