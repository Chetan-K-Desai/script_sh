#!/bin/bash


threshold=10
ram_utilization=$(free | awk '/Mem:/ {print $3/$2 * 100.0}')


if [ $(echo "$ram_utilization > $threshold" | bc -l) -eq 1 ]; then

    smtp_server="192.168.7.20"
    smtp_port="25"
    smtp_username="noreply@xomicmail.com"
    smtp_password="N3oreply@123"
    recipient="chetan.desai@xomicmail.com"
    subject="High RAM Utilization Alert"
    message="RAM utilization is currently at $ram_utilization%. This exceeds the threshold of $threshold%."


    notify-send -u critical \ "High RAM Utilization Alert" \ "RAM utilization is currently at $ram_utilization%. This exceeds the threshold of $threshold%."

    sendemail -f "$smtp_username" -s "$smtp_server:$smtp_port" -xu "$smtp_username" -xp "$smtp_password" -t "$recipient" -o tls=no -u "$subject" -m "$message"
fi

