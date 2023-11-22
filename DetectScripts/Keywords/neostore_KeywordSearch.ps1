#======================================
#./neostore_KeywordSearch.ps1
#======================================
# Current search all of C:\
#======================================
# Keyword search 
# Files named anything with neostore
# There may be other files in Windows, but neo4j is the Bloodhound database
# Case-Insensitive
#======================================
for($i=0; $i -lt 50; $i++) {Write-Host "***************"} #Help Read Results
Write-Host "`n`n`n`n`n`n`n`nFILES LABELED WITH STRING 'neostore'
`nCase-Insensitive
`nAny location in title."
#======================================
Get-Childitem -Path C:\ -Recurse -Include *neostore* -Force -ErrorAction SilentlyContinue
#======================================
#======================================
#======================================
#Example-----------------------------------------------------------------
#Directory: C:\Users\ncterry.WIDGETLLC\Documents\Neo4j\default.graphdb
#Mode                LastWriteTime         Length Name                          
#----                -------------         ------ ----                          
#-a----        1/19/2021   8:46 AM           8192 neostore                      
#-a----        1/13/2021  10:59 AM             96 neostore.counts.db.a          
#-a----        1/19/2021   8:46 AM             96 neostore.counts.db.b          
#-a----        1/19/2021   8:41 AM              9 neostore.id                   
#-a----        1/19/2021   8:46 AM           8190 neostore.labeltokenstore.db              
#======================================
#Directory: C:\Users\ncterry\Bloodhound\BloodHound-master\BloodHoundExampleDB.db
#Mode                LastWriteTime         Length Name                          
#----                -------------         ------ ----                                            
#-a----        12/9/2020  12:59 PM          49152 neostore.labelscanstore.db    
#-a----        12/9/2020  12:59 PM           8190 neostore.labeltokenstore.db   
#-a----        12/9/2020  12:59 PM              9 neostore.labeltokenstore.db.id
#-a----        12/9/2020  12:59 PM           8192 neostore.labeltokenstore.db.names  
#======================================
#======================================