# SWITCHES AVAILABLE FOR 'Get-NetIPAddress' CMDLET aka 'IPCONFIG' in Windows Command Prompt
# - /ALL : Displays the full TCP/IP configuration for all adapters. Physical or logical adapters
# - /DISPLAYDNS : Displays the contents of the DNS client resolver cache
# - /FLUSHDNS : Flushes and resets the contents of the DNS client resolver cache.
# - /REGISTERDNS : Initiates manual dynamic registration for the DNS names and IP addresses that are configured at a computer.
# - /RELEASE : Release the current DHCP configuration for either all adapters, or for a specific adapter if the <adapter> parameter is included
# - /RENEW : Renews the current DHCP configuration for either all adapters, or for a specific adapter if the <adapter> parameter is included
# - /SETCLASSID : Configures the DHCP class ID for a specified adapter. To set the DHCP class ID for all adapters, use the asterisk (*) wildcard character in place of adapter
# - /SHOWCLASSID : Displays the DHCP class ID for a specified adapter. To see the DHCP class ID for all adapters, use the asterisk (*) wildcard character in place of adapter

# GET THE IP ADDRESS OF ALL INTERFACES. IPv4 AND IPv6 INTERFACES WILL BE DISPLAYED
Get-NetIpAddress | Sort InterfaceAlias | ft -AutoSize

# GET THE IP ADDRESS OF ALL IPv4 ADDRESS FAMILY INTERFACES. EXCLUDE IPv6 INTERFACES
Get-NetIpAddress | ? {$_.IPAddress -notlike "fe80*" -and $_.IPAddress -notlike "*::1*" } | Select InterfaceAlias, IPAddress | Sort InterfaceAlias