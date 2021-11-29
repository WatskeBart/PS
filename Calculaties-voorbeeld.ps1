Get-Volume |
Select-Object -Property DriveLetter,
    @{
        n='Size(GB)';
        e={'{0:N2}' -f ($PSItem.Size / 1GB)}
    },
    @{
        n='FreeSpace(GB)';
        e={'{0:N2}' -f ($PSItem.SizeRemaining / 1GB)}
    }