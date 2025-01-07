#!/bin/bash
pushd ./uup # && php -S 0.0.0.0:44400
[ -f /usr/sbin/apache2 ] && service apache2 start # for debian
[ -f /usr/sbin/httpd ]   && httpd -k start        # for alpine
