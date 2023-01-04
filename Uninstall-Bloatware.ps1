Get-AppxPackage | ? { $_.InstallLocation -like "*C:\Windows\SystemApps*" } |Select Name, Version, InstallLocation | Sort Name
Get-AppxPackage | ? { $_.InstallLocation -like "*C:\Program Files*" } |Select Name, Version, InstallLocation | Sort Name
Get-AppxPackage | ? { $_.Name -like "*xbox*" } | Select Name, Version, InstallLocation | Sort Name
Get-AppxProvisionedPackage -Online | ? {$_.PackageName -like "*xbox*"} | Select DisplayName, Version, InstallLocation | Sort Name

# Create list of bloatware to uninstall in bulk
$bloatware = @('xbox')

# UNINSTALL APPS FROM USER PROFILE
for($i=0; $i -lt $bloatware.Length;$i++){
    Get-AppxPackage -AllUsers | ? { $_.Name -like '*' + $bloatware[$i] + '*' } | Remove-AppxPackage -AllUsers 

    if($? -eq $false){
        $Error[0] | Out-File "C:\PS\Error.txt" -Append
    }
}

# UNINSTALL APPS FROM SYSTEM
for($i=0; $i -lt $bloatware.Length;$i++){
    Get-AppxProvisionedPackage -Online | ? { $_.PackageName -like '*' + $bloatware[$i] + '*' } | Remove-AppxProvisionedPackage -Online

    if($? -eq $false){
        $Error[0] | Out-File "C:\PS\Error.txt" -Append
    }
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

Get-AppxPackage | gm
Get-AppxProvisionedPackage -Online | gm
