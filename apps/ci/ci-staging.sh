#!/usr/bin/env bash

#
# THIS FILE IS USED TO DEPLOY THE AZEROTHCORE TO THE STAGING SERVER
#

set -e

export DEBIAN_FRONTEND=noninteractive
dpkg --configure -a
apt-get -y install screen
killall authserver || echo "Authserver was not running."
killall worldserver || echo "Worldserver was not running."
./acore.sh init
# uncomment when we need to download new client data
# ./acore.sh "client-data"
screen -S authserver -d -m ./acore.sh run-authserver
screen -S worldserver -d -m ./acore.sh run-worldserver


