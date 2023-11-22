#======================================
#./nativebtree_KeywordSearch.ps1
#======================================
# Current search all of C:\
#======================================
# Keyword search 
# Files named anything with native-btree
# Unique file name related to neo4j database captured info
# Case-Insensitive
#======================================
for($i=0; $i -lt 50; $i++) {Write-Host "***************"} #Help Read Results
Write-Host "`n`n`n`n`n`n`n`nFILES LABELED WITH STRING 'native-btree'
`nCase-Insensitive
`nAny location in title."
#======================================
Get-Childitem -Path C:\ -Recurse -Include *native-btree* -Force -ErrorAction SilentlyContinue
#======================================
#======================================
#======================================
#Example-----------------------------------------------------------------
#Directory: C:\Users\ncterry\Bloodhound\BloodHound-master\BloodHoundExampleDB.db\schema\index
#Mode                LastWriteTime         Length Name                          
#----                -------------         ------ ----                          
#d-----         1/5/2021   1:29 PM                native-btree-1.0             
#======================================
#======================================
#======================================