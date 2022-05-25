######################################
# U-25. NFS 접근 통제                #
# - everyone 마운트 제거 전까지 구현. #
#####################################

#!/bin/bash

HOSTNAME=$(hostname)
CHECK1=$(systemctl list-unit-files nfs-server.service | grep ^nfs | awk '{ print $2 }')
CHECK2=$(showmount -e $HOSTNAME | grep everyone | wc -l)

if [ $CHECK1 == 'disabled' ] || [ $CHECK2 == 0 ]; then
  echo "Clean"
fi