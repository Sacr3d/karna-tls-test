#!/bin/bash

FILE_CA_CLIENT="$FABRIC_CA_CLIENT_HOME/ca/admin/fabric-ca-client-config.yaml"

CONFIG_DIR=/configs

init() {

    if test -f "$FILE_CA_CLIENT"; then
        echo "$FILE_CA_CLIENT exists."
        echo "Will not generate new crypto"

        cd /scripts || exit

        ./enroll-ca-admin.sh

        ./enroll-orderer.sh

        ./enroll-org0-admin.sh

    else

        echo "$FILE_CA_CLIENT does not exist."

        echo "Will try copying..."

        if [ -d $CONFIG_DIR ]; then

            echo "$CONFIG_DIR exists."
            echo "Copying configs to new directory"

            mkdir -p "$FABRIC_CA_CLIENT_HOME/ca/admin"

            mkdir -p "$FABRIC_CA_CLIENT_HOME/orderer"

            cp /configs/fabric-ca-client-config.yaml "$FABRIC_CA_CLIENT_HOME/ca/admin"

            cp /configs/fabric-ca-client-config.yaml "$FABRIC_CA_CLIENT_HOME/orderer"

            mv /configs/fabric-ca-client-config.yaml "$FABRIC_CA_CLIENT_HOME/admin"

            cd /scripts || exit

            ./enroll-ca-admin.sh

            ./enroll-orderer.sh

            ./enroll-org0-admin.sh

        else

            echo "$CONFIG_DIR does not exist."

        fi

    fi

}

init

echo Done
