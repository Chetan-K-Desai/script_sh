$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path
$path1 = $directorypath + '\date.txt'
$path3 = $directorypath + '\path.txt'
$snapshot = Get-Date -Format "dd-MM-yyyy-hh-mm-ss"
#$path2 = Get-Content $path1
#Write-Output $path3
$lin_num =  (Get-Content $path3).Length

for ($i=1; $i -le $lin_num; $i++) {
    $vm =  Get-Content $path3 | Select-Object -First $i | Select-Object -last 1 | ForEach-Object {$_}
    $name =  Get-Content $path1 | Select-Object -First $i | Select-Object -last 1 | ForEach-Object {$_}
    Write-Output "snap is deleted for $vm $name"
    vmrun.exe deletesnapshot "C:\Users\chetan_desai\Documents\Virtual Machines\$vm" "$name"
}

for ($i=1; $i -le $lin_num; $i++) {
    $vm =  Get-Content $path3 | Select-Object -First $i | Select-Object -last 1 | ForEach-Object {$_}
    Write-Output $snapshot > $path1
    $name =  Get-Content $path1 | Select-Object -First $i | Select-Object -last 1 | ForEach-Object {$_}
    Write-Output "tacking snapshort for $vm $name"
    vmrun.exe snapshot "C:\Users\chetan_desai\Documents\Virtual Machines\$vm" "$name"
}