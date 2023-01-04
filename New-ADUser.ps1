# ----- GLOBAL VARIABLES ----- #
$Domain = "techneaks.net"
$PASSWORD_FOR_USERS   = "Password1"
$DomainPassword = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force
$EmployeesOU = "OU=Employees,DC=techneaks,DC=net"
$USER_LIST = Get-Content .\names.txt
# ------------------------------------------------------ #

foreach ($object in $USER_FIRST_LAST_LIST) {
    $GivenName = $object.Split(" ")[0]
    $Surname = $object.Split(" ")[1]
    $DisplayName = "$GivenName" + " " + "$Surname"
    $Username = "$($GivenName.Substring(0,1))$($Surname)".ToLower()
    Write-Host "Creating user: $($Username)" -BackgroundColor Black -ForegroundColor Cyan
    
    New-AdUser -AccountPassword $DomainPassword `
               -GivenName $GivenName `
               -Surname $Surname `
               -DisplayName $DisplayName `
               -SamAccountName $Username `
               -Name $DisplayName `
               -EmployeeID $Username `
               -PasswordNeverExpires $true `
               -Path $EmployeesOU `
               -Enabled $true `
               -Office "Remote" `
               -UserPrincipalName "$GivenName.$Surname@techneaks.co.uk"
}
