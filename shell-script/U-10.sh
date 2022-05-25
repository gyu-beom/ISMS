############################################
# U-10. /etc/hosts 파일 소유자 및 권한 설정 #
###########################################

#!/bin/bash

PERMISSION=$(ls -l /etc/hosts | cut -d" " -f1 | sed 's/-//')
OWN=$(ls -l /etc/hosts | cut -d" " -f3)

if [ $PERMISSION != "rw-r--r--" ]; then
  chmod 644 /etc/hosts
fi

if [ $OWN != "root" ]; then
  chown root /etc/hosts
fi