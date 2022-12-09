
var=`date +%d-%m-%Y`

mysqldump -u "root" --password="password" databashname > #git path/$var.sql

git add $var.sql && git commit -m "$var backup" && git push origin master

rm -f git path/$var.sql

