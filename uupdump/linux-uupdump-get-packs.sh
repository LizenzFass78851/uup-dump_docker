#!/bin/bash
pushd ./uup && rm -r uuptmp 2>/dev/null
php ./sta/packsgen.php
