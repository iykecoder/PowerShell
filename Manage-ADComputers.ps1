$ComputersOU = "OU=Hillarys Computers,DC=hillarys,DC=net"
$ADComputers = Get-ADComputer -Filter 'Name -like "H20700"' -SearchBase $ComputersOU | Select Name
$Username = "iakpala"

foreach($computer in $ADComputers){
    Write-Host "Checking path for $computer : " -BackgroundColor Black -ForegroundColor Cyan
    Test-Path "%localAppData%\Starleaf"
    Write-Host "--------------------------------------------------------------------------"
}

# # # # # #

C:\Users\$($Username)\AppData\Local\Starleaf