#!/bin/bash

FILE=/etc/hyperledger/fabric-ca-server/fabric-ca-server-config.yaml

CONFIG_DIR=/configs

initFabric() {

    echo "Initalizing fabric-ca-server"

    fabric-ca-server init -b org1-ca-admin:org1-ca-adminpw --address 172.20.0.12

}

startFabric() {

    echo "Starting fabric-ca-server"

    fabric-ca-server start -b org1-ca-admin:org1-ca-adminpw --address 172.20.0.12

}

init() {

    if test -f "$FILE"; then
        echo "$FILE exists."
        echo "Will not generate new crypto"
        startFabric
    else
        echo "$FILE does not exist."

        echo "Will try copying..."

        if [ -d $CONFIG_DIR ]; then

            echo "$CONFIG_DIR exists."
            echo "Copying configs to new directory"

            mkdir -p $FABRIC_CA_CLIENT_HOME/admin

            mv /configs/fabric-ca-server-config.yaml $FABRIC_CA_SERVER_HOME/

            mv /configs/fabric-ca-client-config.yaml $FABRIC_CA_CLIENT_HOME/admin

            startFabric

        else

            echo "$CONFIG_DIR does not exist."

            initFabric
        fi

    fi

}

init

echo Done
