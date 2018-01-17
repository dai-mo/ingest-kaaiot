#!/bin/bash

# m4_ignore(
echo "This is just a script template, not the script (yet) - pass it to 'argbash' to fix this." >&2
exit 11  #)Created by argbash-init v2.5.1
# ARG_OPTIONAL_SINGLE([credentials], s, [path to credentials json file], [$PWD/org.dcs.iot.kaa.client/src/test/resources/kaaCredentials.yaml])
# ARG_OPTIONAL_SINGLE([config], o, [path to config directory], [$PWD/org.dcs.iot.kaa.client/src/test/resources/kaa-config])
# ARG_HELP([Script to initialise a Kaa IoT Instance with DCS credentials and configuration])
# ARGBASH_GO

sbt -DkaaCredentials=$_arg_credentials \
    -DkaaConfigDir=$_arg_config \
    "kaaiot-client/runMain org.dcs.iot.kaa.KaaIoTInitialiser"
    
