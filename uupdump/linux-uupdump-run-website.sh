#!/bin/bash
xdg-open http://0.0.0.0:44400
pushd ./uup && php -S 0.0.0.0:44400
