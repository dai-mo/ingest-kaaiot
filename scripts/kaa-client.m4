#!/bin/bash

# m4_ignore(
echo "This is just a script template, not the script (yet) - pass it to 'argbash' to fix this." >&2
exit 11  #)Created by argbash-init v2.5.1
# ARG_OPTIONAL_SINGLE([credentials],[s],[path to credentials json file],[$PWD/org.dcs.iot.kaa.client/src/test/resources/kaaCredentials.yaml])
# ARG_OPTIONAL_SINGLE([config],[o],[path to config directory],[$PWD/org.dcs.iot.kaa.client/src/test/resources/kaa-config])
# ARG_POSITIONAL_SINGLE([application],[kaaiot application to simulate client. Possible values are, \n hbt (Heartbeat Monitor Client) \n temp (Temperature Monitor Client)])
# ARG_HELP([Script to simulate a KaaIoT Client. \n This script requires that you download the target java sdk jar to the org.dcs.kaa.client/lib directory. \n Refer to the org.dcs.kaa.client/README.md for more details])
# ARGBASH_GO()

APP_CLIENT=

case $_arg_application in
    hbt )
        APP_CLIENT="HeartbeatMonitorClient"
        echo "Launching heartbeat monitor client ..."
        echo ""
        ;;
    temp )
        APP_CLIENT="DataCollectionClient"
        echo "Launching temperature monitor client ..."
        echo ""
        ;;
    *)
        echo "ERROR: Invalid application $_arg_application specified"        
        echo ""
        print_help       
        exit 1
        ;;
esac

echo "Copying org.dcs.iot.kaa.client/clients/${APP_CLIENT}.scala to org.dcs.iot.kaa.client/src/main/scala/org/dcs/iot/kaa/client"
echo ""

cp org.dcs.iot.kaa.client/clients/${APP_CLIENT}.scala org.dcs.iot.kaa.client/src/main/scala/org/dcs/iot/kaa/client

sbt "kaaiot-client/runMain org.dcs.iot.kaa.client.${APP_CLIENT}"
