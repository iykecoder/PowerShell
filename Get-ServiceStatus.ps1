# Get-ServiceStatus.ps1 | Script displays the status of services on a specified machine
# Mandatory paraeters: -ComputerName, -ServiceStatus

Param (
  [Parameter(Mandatory)]
  [String[]]$ComputerName # Specify which computer to gather service status information. This parameter accepts multiple values
)

# Creates a variable for Get-Service Objects. 
$Services = Get-Service -ComputerName $ComputerName

ForEach ($Service in $Services) {
  $ServiceStatus = $Service.Status
  $ServiceDisplayName = $Service.DisplayName
  $ServiceMachineName = $Service.MachineName

  if ($ServiceStatus -eq 'Running') {
    Write-Output "SERVICE OK : : $ServiceDisplayName - Status is $ServiceStatus on $ServiceMachineName"
    Write-Output "-----------------------------------------------------------------------------------------------"
  }
  Else {
    Write-Output "SERVICE WARNING : : $ServiceDisplayName - Status is $ServiceStatus on $ServiceMachineName"
    Write-Output "-----------------------------------------------------------------------------------------------"
  }
}