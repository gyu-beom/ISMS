###########################
# U-33. DNS 보안 버전 패치 #
###########################

#!/bin/bash

ps -ef | grep "named" | grep -v 'grep'
if [ $? -eq 0 ]; then
  kill -9 `ps -ef | grep "named" | grep -v 'grep' | awk '{ print $2 }'`
fi