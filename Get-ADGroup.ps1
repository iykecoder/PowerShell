$UserOU = "OU=HillarysUsers,DC=hillarys,DC=net"

Param(
    [Parameter()]
    [String]$GroupName
)

# Check group membership
$Group = "Windows Authorization Access Group"

#Get all the active users. Filter using Where-Object where the DN of the group does not appear in the MemberOf Property. Then, formats it into an easy-to-view table.
Get-ADUser -Properties memberof -Filter 'Enabled -eq $true' | Where-Object {$Group.DistinguishedName -notin $_.Memberof} | Select Name, DistinguishedName | Sort Name

#Get all the active users. Filter using Where-Object where the DN of the group does not appear in the MemberOf Property. Then, formats it into an easy-to-view table.
Get-ADUser -Properties memberof -Filter 'Enabled -eq $true' | ? { $GroupName.DistinguishedName -like "*$Users0U*" } | Where-Object {$GroupName.DistinguishedName -notin $_.Memberof} | Select Name, DistinguishedName | Sort Name

# # # # # # 

Get-ADGroup -Identity "Finance - Projects" | Select Name | Sort Name

$GroupMembers = Get-ADGroupMember -Identity "GroupName"

Get-ADGroupMember -Identity "GroupName" | ForEach-Object { Add-ADGroupMember -Identity "Finance - Projects" -Members $_.distinguishedName }