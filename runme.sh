#!/bin/bash

if [ -z "${EYP_ALLOW}" ];
then
  sed -e 's@^Allow.*@@g' -i /etc/tinyproxy.conf
else
  sed -e 's@^Allow.*@Allow '${EYP_ALLOW}'@g' -i /etc/tinyproxy.conf
fi


exec /usr/sbin/tinyproxy -d
