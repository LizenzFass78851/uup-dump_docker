#!/bin/bash
xdg-open http://127.0.0.1:44400
pushd ./uup && php -S 0.0.0.0:44400
