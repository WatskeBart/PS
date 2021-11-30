Get-WmiObject -Namespace root -List -Recurse | Select-Object -Unique __NAMESPACE #Overzicht van namespaces (werkt alleen in Windows PowerShell, dus niet in PS Core)

Get-CimClass -Namespace root/CIMV2 #Overzicht van classes uit root/CIMv2 (classes beginnend met een dubbele underscore, zijn system classes en worden doorgaans niet gebruikt)

Get-CimClass *network* | Sort-Object CimClassName #Overzicht van alle classes welke het woord 'network' bevatten en gesorteerd op CimClassName

(Get-WmiObject -Class Win32_OperatingSystem -ComputerName .).InvokeMethod("Win32Shutdown",0) #Gebruik de class Win32_OperatingSystem om de lokale computer uit te loggen
(gwmi Win32_OperatingSystem).Win32Shutdown(0) #Verkorte variant van bovenstaande
## Overzicht van Flags
# 0 – Log Off
# 4 – Forced Log Off
# 1 – Shutdown
# 5 – Forced Shutdown
# 2 – Reboot
# 6 – Forced Reboot
# 8 – Power Off
# 12 – Forced Power Off

Get-WmiObject -Class Win32_OperatingSystem | Get-Member -MemberType Method #Overzicht van beschikbare methods binnen de class Win32_OperatingSystem
Get-CimClass -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty CimClassMethods #Overzicht van beschikbare methods via CIM

Invoke-CimMethod -ClassName Win32_Process -MethodName Create -Arguments @{CommandLine='mspaint.exe'} #Start MSPaint via Invoke-CimMethod
Get-CimInstance -ClassName Win32_Process -Filter "Name='mspaint.exe'" | Invoke-CimMethod -Name Terminate #Overzicht van CimIntances en filter op mspaint.exe en sluit deze af via Invoke-CimMethod

