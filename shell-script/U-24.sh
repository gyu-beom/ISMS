############################
# U-24. NFS 서비스 비활성화 #
############################

#!/bin/bash

U_24=$(ps -ef | grep "nfsd" | grep -v 'grep' | awk '{ print $2 }')
PROCESS=($U_24)

if [ -z $PROCESS ]; then
  echo "No process named 'nfsd' is running"
else
  for process in ${PROCESS[@]}
  do
    kill -9 $process
    echo "success kill $process"
  done
fi