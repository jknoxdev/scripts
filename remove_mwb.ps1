
Write-Host "Attempting removal for MalwareBytes..." -ForegroundColor Yellow
Write-Host "Checking for MalwareBytes registry keys..."

write-host "MalwareBytes1: checking...."
$malwareBytes1 = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*MalwareBytes*" }
write-host "...results for *MalwareBytes* :" $malwareBytes1

write-host "MalwareBytes2: checking...."
$malwareBytes2 = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*Malware*" }
write-host "*Malware*" $malwareBytes2

write-host "MalwareBytes3: checking...."
$malwareBytes3 = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*Bytes*" }
write-host "*Bytes*" $malwareBytes3

write-host "MalwareBytes4: checking...."
$malwareBytes4 = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*Malware Bytes*" }
write-host "*Malware Bytes*" $malwareBytes4


write-host 'checking for installed location via get-package.....'
$installed_loc = get-package malware* | % { $_.metadata['installlocation'] }
write-host 'installed_loc: ' $installed_loc

get-package $installed_loc | uninstall-package -Force -Verbose


$check_loc = get-package $installed_loc | % { $_.metadata['installlocation'] }

if ($check_loc -eq $null) {
    Write-Host "MalwareBytes has been removed"
}
else {
    Write-Host "MalwareBytes has not been removed"
}




#Get-Package malware* | % { $_.metadata['installlocation'] } | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue -Verbose    # Remove the installation folder    # Remove the installation folder        
