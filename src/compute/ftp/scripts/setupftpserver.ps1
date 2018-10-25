Write-Host "Custom Script Started"

#Format and raw disks
$disks = Get-Disk | Where partitionstyle -eq 'raw' | sort number

#First drive that is add is E Drive

    $letters = 69..89 | ForEach-Object { [char]$_ }
    $count = 0
    $labels = "data1","data2"

    foreach ($disk in $disks) {
        $driveLetter = $letters[$count].ToString()
        $disk | 
        Initialize-Disk -PartitionStyle MBR -PassThru |
        New-Partition -UseMaximumSize -DriveLetter $driveLetter |
        Format-Volume -FileSystem NTFS -NewFileSystemLabel $labels[$count] -Confirm:$false -Force
    $count++
    }


    $GrouptoAdd = "wv.local\Domain Users"

    # Adding Domain Group to Remote Desktop Users Group
    ####################################################
    write-output(" ")
    write-output("Adding Domain Group $GrouptoAdd to Remote Desktop Users Group")
    write-output(" ")

    $GroupObj = [ADSI]"WinNT://localhost/Remote Desktop Users"
    $GroupObj.add("WinNT://""$GroupToAdd""")
    
    write-output("Custom script finished")


    #Add a persistent mount to Azure File Share
    