###############################################
# U-13. /etc/services 파일 소유자 및 권한 설정 #
# - Ansible 단계에서 Error 발생.              #
##############################################

#!/bin/bash

PERMISSION=$(ls -l /etc/services | cut -d" " -f1 | sed 's/-//')
OWN=$(ls -l /etc/services | cut -d" " -f3)

if [ $PERMISSION != "rw-r--r--" ]; then
  chmod 644 /etc/services
fi

if [ $OWN != "root" ]; then
  chown root /etc/services
fi