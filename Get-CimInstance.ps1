$ComputerName = Read-Host "Computer Name "
Get-CimInstance -ComputerName $ComputerName -ClassName Win32_OperatingSystem |
Select-Object CSName, LastBootUpTime, BuildNumber, CurrentTimeZone, FreePhysicalMemory, FreeVirtualMemory, SerialNumber

$ComputerName = Read-Host "Computer Name "
Get-WMIObject -ComputerName $ComputerName -ClassName Win32_OperatingSystem |
Select-Object CSName, LastBootUpTime, BuildNumber, CurrentTimeZone, FreePhysicalMemory, FreeVirtualMemory, SerialNumber