#########################################
# U-23. DoS 공격에 취약한 서비스 비활성화 #
#########################################

#!/bin/bash

U_23=("/etc/xinetd.d/echo" "/etc/xinetd.d/discard" "/etc/xinetd.d/daytime" "/etc/xinetd.d/chargen")

for u_23 in ${U_23[@]}
do
  ls -al $u_23 2> /dev/null
  if [ $? -eq 0 ]; then
    LINE=$(egrep -n "(*disable*)" $u_23 | cut -d: -f1)
    sed -e "$LINE s/no/yes/" -i $u_23
  fi
done

service xinetd restart