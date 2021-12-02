function Demo-Progress { 
    $total = 100
    for ($i = 1; $i -le 100; $1++) {
        write-progress -id 1 -activity 'Progress' -Status "Processing $i of 100" -PercentComplete $i
        Start-Sleep 0.5
    }
}