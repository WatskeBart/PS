New-Item -Type Directory -Path "C:\testfolder"
$acl = Get-Acl "c:\testfolder"
$ar = New-Object System.Security.AccessControl.FileSystemAccessRule("accountnaam", "FullControl", "Allow")
$acl.SetAccessRule($ar)
Set-Acl -Path "c:\testfolder" -AclObject $acl
