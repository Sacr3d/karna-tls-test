#!/bin/bash

FILE_CA_CLIENT=/root/fabric-ca-client/admin/fabric-ca-client-config.yaml

CONFIG_DIR=/configs

init() {

    if test -f "$FILE_CA_CLIENT"; then
        echo "$FILE_CA_CLIENT exists."
        echo "Will not generate new crypto"

        mv /shared/tls-cert.pem $FABRIC_CA_CLIENT_HOME/tls-cert.pem

        cd /scripts

        ./enroll.sh

    else
        echo "$FILE_CA_CLIENT does not exist."

        echo "Will try copying..."

        if [ -d $CONFIG_DIR ]; then

            echo "$CONFIG_DIR exists."
            echo "Copying configs to new directory"

            mkdir -p $FABRIC_CA_CLIENT_HOME/admin

            mv /configs/fabric-ca-client-config.yaml $FABRIC_CA_CLIENT_HOME/admin

            mv /shared/tls-cert.pem $FABRIC_CA_CLIENT_HOME/tls-cert.pem

            cd /scripts

            ./enroll.sh

        else

            echo "$CONFIG_DIR does not exist."

        fi

    fi

}

init

echo Done
