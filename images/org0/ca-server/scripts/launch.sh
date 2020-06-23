#!/bin/bash

FILE=/etc/hyperledger/fabric-ca-server/fabric-ca-server-config.yaml

CONFIG_DIR=/configs

initFabric() {

    echo "Initalizing fabric-ca-server"

    fabric-ca-server init -b org0-ca-admin:org0-ca-adminpw --address 172.20.0.11

}

startFabric() {

    echo "Starting fabric-ca-server"

    fabric-ca-server start -d -b org0-ca-admin:org0-ca-adminpw --address 172.20.0.11

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

            mv /configs/fabric-ca-server-config.yaml "$FABRIC_CA_SERVER_HOME"

            startFabric

        else

            echo "$CONFIG_DIR does not exist."

            initFabric
        fi

    fi

}

init

echo Done
