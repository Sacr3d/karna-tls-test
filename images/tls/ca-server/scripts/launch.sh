#!/bin/bash

FILE_CA_SERVER=/etc/hyperledger/fabric-ca-server/fabric-ca-server-config.yaml

CONFIG_DIR=/configs

initFabric() {

    echo "Initalizing fabric-ca-server"

    fabric-ca-server init -b tls-ca-admin:tls-ca-adminpw --address 172.20.0.10

}

startFabric() {

    echo "Starting fabric-ca-server"

    fabric-ca-server start -b tls-ca-admin:tls-ca-adminpw --address 172.20.0.10

}

init() {

    if test -f "$FILE_CA_SERVER"; then
        echo "$FILE_CA_SERVER exists."
        echo "Will not generate new crypto"
        startFabric
    else
        echo "$FILE_CA_SERVER does not exist."

        echo "Will try copying..."

        if [ -d $CONFIG_DIR ]; then

            echo "$CONFIG_DIR exists."
            echo "Copying configs to new directory"

            mkdir -p $FABRIC_CA_CLIENT_HOME/admin

            mv /configs/fabric-ca-server-config.yaml $FABRIC_CA_SERVER_HOME/

            startFabric

        else

            echo "$CONFIG_DIR does not exist."

            initFabric
        fi

    fi

}

init

echo Done
