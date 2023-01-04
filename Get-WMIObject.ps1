$ComputerName = Read-Host "Computer Name "
Get-WMIObject -ComputerName $ComputerName -ClassName Win32_OperatingSystem |
Select-Object CSName, Caption, BuildNumber, FreePhysicalMemory, FreeVirtualMemory, SerialNumber, LastBootUpTime

$ComputerName = Read-Host "Computer Name "
Get-WMIObject -ComputerName $ComputerName -ClassName Win32_OperatingSystem |
Select-Object *