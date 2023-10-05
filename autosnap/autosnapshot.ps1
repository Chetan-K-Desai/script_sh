$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path
$path = $directorypath + '\path.txt'
vmrun -T ws list | Select-Object -Skip 1 > $path
$snapshot = Get-Date -Format "dd-MM-yyyy"
$lin_num =  (Get-Content $path).Length

for ($i=1; $i -le $lin_num; $i++) {
    $vm =  Get-Content $path | Select-Object -First $i | Select-Object -last 1 | ForEach-Object {$_}
    Write-Output "Tacking snapshort of $vm and snap name is $snapshot"
    vmrun.exe snapshot "$vm" "$snapshot"
}

for ($i=1; $i -le $lin_num; $i++) {
    $vm =  Get-Content $path | Select-Object -First $i | Select-Object -last 1 | ForEach-Object {$_}
    $delete = vmrun -T ws listSnapshots "$vm" | Select-Object -Skip 1 | Select-Object -SkipLast 1
    Write-Output "Deleting snapshot of $vm and snap name is $delete"
    vmrun.exe deletesnapshot "$vm" "$delete"
}