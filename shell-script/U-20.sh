###############################
# U-20. Finger 서비스 비활성화 #
###############################

#!/bin/bash

cat /etc/xinetd.d/finger | grep disable
if [ $? -eq 0 ]; then
  LINE=$(egrep -n "(*disable*)" /etc/xinetd.d/finger | cut -d: -f1)
  sed -e "$LINE s/yes/no/" -i /etc/xinetd.d/finger
  service xinetd restart
fi
