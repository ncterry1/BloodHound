#======================================
#./neo4j_KeywordSearch.ps1
#======================================
# Current search all of C:\
#======================================
# Keyword search
# Files named anything with neo4j. 
# Case-Insensitive
#======================================
for($i=0; $i -lt 50; $i++) {Write-Host "***************"} #Help Read Results
Write-Host "`n`n`n`n`n`n`n
`nFILES LABELED WITH STRING 'NEO4J'
`nCase-Insensitive
`nAny location in title."
#======================================
Get-Childitem -Path C:\ -Recurse -Include *neo4j* -Force -ErrorAction SilentlyContinue
#======================================
#======================================
#======================================
#Example-----------------------------------------------------------------
#Directory: C:\Windows\Prefetch
#Mode                LastWriteTime         Length Name                            
#----                -------------         ------ ----                            
#-a----        1/13/2021  10:54 AM          37863 NEO4J-CE.EXE-B1611940.pf        
#-a----         1/5/2021   1:51 PM          23441 NEO4J-CE.EXE-F086D5E0.pf        
#-a----         1/5/2021   2:38 PM          49739 NEO4J-COMMUNITY_WINDOWS-X64_3-EA7271E9.pf    
#======================================
#======================================
#======================================