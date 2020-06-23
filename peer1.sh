#!/bin/bash

main() {

    launchTlsCaServer

    sleep 5

    launchTlsCaClient

    sleep 5

    launchOrg0CaServer

    sleep 5

    launchOrg0CaClient

    sleep 5

    launchOrg1CaServer

    sleep 5

    launchOrg1CaClient

    sleep 5

    launchOrg2CaServer

    sleep 5

    launchOrg2CaClient

}

function launchTlsCaClient() {

    pushd docker-compose/tls/ca-client || return

    docker-compose -p karna-tls-ca-client up -d

    popd || exit

}

function launchTlsCaServer() {

    pushd docker-compose/tls/ca-server || return

    docker-compose -p karna-tls-ca-server up -d

    sleep 5

    docker exec -it karna-tls-ca-server cp /etc/hyperledger/fabric-ca-server/ca-cert.pem /shared/tls-ca-cert.pem

    popd || exit

}

function launchOrg0CaClient() {

    pushd docker-compose/org0/host2/ca-client || return

    docker-compose -p karna-org0-ca-client up -d

    popd || exit

}

function launchOrg0CaServer() {

    pushd docker-compose/org0/host1/ca-server || return

    docker-compose -p karna-org0-ca-server up -d

    sleep 5

    docker exec -it karna-org0-ca-server cp /etc/hyperledger/fabric-ca-server/ca-cert.pem /shared/org0-ca-cert.pem

    popd || exit

}

function launchOrg1CaClient() {

    pushd docker-compose/org1/host2/ca-client || return

    docker-compose -p karna-org1-ca-client up -d

    popd || exit

}

function launchOrg1CaServer() {

    pushd docker-compose/org1/host1/ca-server || return

    docker-compose -p karna-org1-ca-server up -d

    sleep 5

    docker exec -it karna-org1-ca-server cp /etc/hyperledger/fabric-ca-server/ca-cert.pem /shared/org1-ca-cert.pem

    popd || exit

}

function launchOrg2CaClient() {

    pushd docker-compose/org2/host2/ca-client || return

    docker-compose -p karna-org2-ca-client up -d

    popd || exit

}

function launchOrg2CaServer() {

    pushd docker-compose/org2/host1/ca-server || return

    docker-compose -p karna-org2-ca-server up -d

    sleep 5

    docker exec -it karna-org2-ca-server cp /etc/hyperledger/fabric-ca-server/ca-cert.pem /shared/org2-ca-cert.pem

    popd || exit

}

docker network create -d bridge karna-dev-net

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

main
