#########################################
# U-32. 일반 사용자의 Sendmail 실행 방지 #
# - Ansible 단계에서 Error 발생.        #
########################################

#!/bin/bash

U_32="restrictqrun"
U_32_COMMAND="egrep -n "PrivacyOptions" /etc/mail/sendmail.cf"

VALUE=$(echo $($U_32_COMMAND) | awk -v u_32=$U_32 -F"=" '{ value=($2 ~ u_32) ? 0 : 1; print value }')
if [ $VALUE -eq 1 ]; then
  LINE=$($U_32_COMMAND | cut -d: -f1)
  sed -i "$LINE s/$/,"$U_32"/g" /etc/mail/sendmail.cf
fi