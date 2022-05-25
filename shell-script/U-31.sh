##############################
# U-31. 스팸 메일 릴레이 제한 #
#############################

#!/bin/bash

ps -ef | grep sendmail | grep -v "grep"
if [ $? -eq 0 ]; then
  LINE=$(egrep -n "(R$*.*Relaying denied\"$)" /etc/mail/sendmail.cf | awk '{ if ($1 ~ "#") print NR }')
  sed -e "$LINE s/^#//" -i /etc/mail/sendmail.cf
fi