#############################################
# U-08. /etc/passwd 파일 소유자 및 권한 설정 #
############################################

#!/bin/bash

PERMISSION=$(ls -l /etc/passwd | cut -d" " -f1 | sed 's/-//')
OWN=$(ls -l /etc/passwd | cut -d" " -f3)

if [ $PERMISSION != "rw-r--r--" ]; then
  chmod 644 /etc/passwd
fi

if [ $OWN != "root" ]; then
  chown root /etc/passwd
fi