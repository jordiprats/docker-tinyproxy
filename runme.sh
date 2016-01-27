#!/bin/bash

sed -e 's@^Allow.*@Allow '${EYP_ALLOW}'@g' -i /etc/tinyproxy.conf

exec /usr/sbin/tinyproxy -d
