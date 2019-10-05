#!/bin/bash

icon_disabled=""
icon_enabled=""
status=`systemctl is-active bluetooth.service`

if [ $status == "active" ]
then
    echo "$icon_enabled"
else
    echo "$icon_disabled"
fi
