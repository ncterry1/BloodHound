#======================================
#./collectors_KeywordSearch.ps1
#======================================
# Current search all of C:\
#======================================
# Keyword search 
# Files named anything with collectors
#     There are other Windows directories with 'collectors' but
# it is a default directory name to store data gathered by SharpHound. 
# Case-Insensitive
#======================================
for($i=0; $i -lt 50; $i++) {Write-Host "***************"} #Help Read Results
Write-Host "`n`n`n`n`n`n`n`nFILES LABELED WITH STRING 'COLLECTORS'
`nCase-Insensitive
`nAny location in title."
#======================================
Get-Childitem -Path C:\ -Recurse -Include *collectors* -Force -ErrorAction SilentlyContinue
#======================================
#======================================
#======================================
#Example-----------------------------------------------------------------
#Directory: C:\Users\ncterry.WIDGETLLC\Desktop\Bloodhound\BloodHound-master
#Mode                LastWriteTime         Length Name                          
#----                -------------         ------ ----                          
#d-----        1/19/2021  10:54 AM                Collectors                  
#======================================
#======================================
#======================================