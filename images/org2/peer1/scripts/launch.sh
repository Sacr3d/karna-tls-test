#!/bin/bash

FILE_PEER=$FABRIC_CFG_PATH/core.yaml

FILE_CA_CLIENT=$FABRIC_CFG_PATH/fabric-ca-client-config.yaml

CONFIG_DIR=/configs

initCaClient() {

    if test -f "$FILE_CA_CLIENT"; then
        echo "$FILE_CA_CLIENT exists."
        echo "Will not generate new crypto"

        /./scripts/enroll.sh

    else
        echo "$FILE_CA_CLIENT does not exist."

        echo "Will try copying..."

        if [ -d $CONFIG_DIR ]; then

            echo "$CONFIG_DIR exists."
            echo "Copying configs to new directory"

            ls $FABRIC_CA_CLIENT_HOME

            mkdir -p $FABRIC_CA_CLIENT_HOME/org1/peer1

            mv /configs/fabric-ca-client-config.yaml $FABRIC_CA_CLIENT_HOME/org1/peer1

            /./scripts/enroll.sh

        else

            echo "$CONFIG_DIR does not exist."

            echo "EXITING"

        fi

    fi

}

startPeer() {

    echo "Starting peer"

    peer node start
}

initPeer() {

    if test -f "$FILE_PEER"; then
        echo "$FILE_PEER exists."
        echo "Will not generate new crypto"

        mkdir -p $FABRIC_CFG_PATH/

    else
        echo "$FILE_PEER does not exist."

        echo "Will try copying..."

        if [ -d $CONFIG_DIR ]; then

            echo "$CONFIG_DIR exists."
            echo "Copying configs to new directory"

            mv /configs/core.yaml $FABRIC_CFG_PATH/

            mkdir -p $FABRIC_CFG_PATH/

        else

            echo "$CONFIG_DIR does not exist."

            echo "EXITING"
        fi

    fi

}

initCaClient

initPeer

echo Done
