#!/bin/bash

main() {

    launchTlsCaServer

    sleep 5

    launchOrg0CaServer

    sleep 5

    launchOrg1CaServer

    sleep 5

    launchOrg2CaServer

}

registerTlsServerAdmin() {

    docker exec -it karna-tls-ca-server /./scripts/enroll.sh

}

launchTlsCaServer() {

    pushd images/tls/

    docker-compose -p karna-tls-ca-server up -d

    sleep 5

    registerTlsServerAdmin

    popd

}

registerorg0ServerAdmin() {

    docker exec -it karna-org0-ca-server /./scripts/enroll.sh

}

launchOrg0CaServer() {

    pushd images/org0/ca-server/

    docker-compose -p karna-org0-ca-server up -d

    sleep 5

    registerorg0ServerAdmin

    popd

}

registerorg1ServerAdmin() {

    docker exec -it karna-org1-ca-server /./scripts/enroll.sh

}

launchOrg1CaServer() {

    pushd images/org1/ca-server/

    docker-compose -p karna-org1-ca-server up -d

    sleep 5

    registerorg1ServerAdmin

    popd

}

registerorg2ServerAdmin() {

    docker exec -it karna-org2-ca-server /./scripts/enroll.sh

}

launchOrg2CaServer() {

    pushd images/org2/ca-server/

    docker-compose -p karna-org2-ca-server up -d

    sleep 5

    registerorg2ServerAdmin

    popd

}

main
