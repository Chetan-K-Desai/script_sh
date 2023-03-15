$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path
$couch = $directorypath + '\couch'

cd $couch
Start-BitsTransfer https://couchdb.neighbourhood.ie/downloads/3.3.1/win/apache-couchdb-3.3.1.msi

$msi = 'apache-couchdb-3.3.1.msi'
$admin = 'admin'
$password = 'chetan123'
msiexec /i $msi /quiet INSTALLSERVICE=1 ADMINUSER=$admin ADMINPASSWORD=$password /norestart /l* log.txt
msiexec /x $msi INSTALLSERVICE=1 APPLICATIONFOLDER="C:\CouchDB" ADMINUSER=$admin ADMINPASSWORD=$password /quiet /norestart /l* log.txt
# Start-Process msiexec -Wait -ArgumentList "/i $msi /quiet INSTALLSERVICE=1 ADMINUSER=$admin ADMINPASSWORD=$password /norestart /l* log.txt"
# Start-Sleep -Seconds 60
# msiexec /i $msi /quiet INSTALLSERVICE=1 ADMINUSER=$admin ADMINPASSWORD=$password /norestart /l* log.txt
# Invoke-RestMethod "http://localhost:5984/_node/nonode@nohost/_config/admins/$username" -Method PUT -Headers $headers -Body $password -ContentType "application/json"
# Start-Process msiexec.exe -Wait -ArgumentList '/i CouchDB-x.x.x.msi /qb'


#curl -X POST -H "Content-Type: application/json" http://admin:chetan123@localhost:5984/_cluster_setup -d '{"action": "enable_cluster", "bind_address":"0.0.0.0", "username": "admin", "password":"chetan123", "port": 5984, "node_count": "3", "remote_node": "192.168.29.140", "remote_current_user": "node1", "remote_current_password": "chetan123" }'

#Start-Process apache-couchdb-3.3.1.msi
#Start-Process msiexec.exe -Wait -ArgumentList '/i apache-couchdb-3.3.1.msi /qb'

#TO DELETE COUCHDB
#msiexec /x $msi /quiet /norestart /l* log.txt
