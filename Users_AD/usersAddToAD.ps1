# .\usersAddToAD.ps1
# PowerShell to import users.csv into the Active Directory
#-------------------------------------------------------
# Import Required Modules - only works if you have an AD
Import-Module ActiveDirectory
#-------------------------------------------------------
# Create a new password
# Each new AD user will have this password. Simple example for show.
$securePassword = ConvertTo-SecureString "TESTpassw0rd!" -AsPlainText -Force
-------------------------------------------------------
# Prompt user for CSV file path
# C:\Users\ncterry\Documents\BloodHound_NCT\users.csv
$filepath = Read-Host -Prompt "Please enter the path to your CSV file"
#-------------------------------------------------------
# Import the file into a variable
$users = Import-Csv $filepath
#
<#-------------------------------------------------------
Loop through each row of your csv file, and gather info
The first line is a header, but will then grab the values for each user.
EX.
First Name,Last Name,Job Title,Office Phone,Email Addess,Description,Organizational Unit
Nate,Terry,Nate Terry,403-658-9654,nate@agency.com,C1511 Analyst,"OU=Office,OU=itFlee,DC=WidgetLLC,DC=Internal"
#>
#-------------------------------------------------------
ForEach ($user in $users)
{
    # Gather the user's info
    $fname = $user.'First Name' #Single '' since header has a space.
    $lname = $user.'Last Name'
    $jtitle = $user.'Job Title'
    $officephone = $user.'Office Phone'
    $emailaddress = $user.'Email Addess'
    $description = $user.Description
    $OUpath = $user.'Organizational Unit'
    #
    # Create new AD user for each user in CSV file
    # Remember this is for Active Directory stuff, so it will not work if you are not connected to an AD
    New-ADUser -Name "$fname $lname" -GivenName $fname -Surname $lname -UserPrincipalName "$fname.$lname" -Path $OUpath -AccountPassword $securePassword -ChangePasswordAtLogon $True -OfficePhone $officephone -Description $description -Enabled $True -EmailAddress $emailaddress

    # echo output for each new user
    echo "Account created for $fname $lname in $OUpath"
}
