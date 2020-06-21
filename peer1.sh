#!/bin/bash

main() {

    launchTlsCaServer

    sleep 5

    launchTlsCaClient

    sleep 5

    launchOrg0CaServer

    sleep 5

    launchOrg1CaServer

    sleep 5

}

function launchTlsCaServer() {

    pushd docker-compose/tls/ca-server

    docker-compose -p karna-tls-ca-server up -d

    sleep 5

    docker exec -it karna-tls-ca-server cp /etc/hyperledger/fabric-ca-server/tls-cert.pem /shared/tls-cert.pem

    popd

}

function launchTlsCaClient() {

    pushd docker-compose/tls/ca-client

    docker-compose -p karna-tls-ca-client up -d

    sleep 5

    docker exec -it karna-tls-ca-client /./scripts/enroll.sh

    popd

}

function launchOrg0CaServer() {

    pushd docker-compose/org0/host1/ca-server

    docker-compose -p karna-org0-ca-server up -d

    popd

}

function launchOrg1CaServer() {

    pushd docker-compose/org1/host1/ca-server

    docker-compose -p karna-org1-ca-server up -d

    popd

}

main
