####################################
# U-07. 파일 및 디렉터리 소유자 설정 #
####################################

#!/bin/bash

NOUSER_FILES=$(find / -nouser -o -nogroup 2> /dev/null)
for NOUSER_FILE in $NOUSER_FILES
do
  rm -rf $NOUSER_FILE
done