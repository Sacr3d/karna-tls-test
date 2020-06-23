#!/bin/bash

export FABRIC_CA_CLIENT_HOME=$FABRIC_CA_CLIENT_HOME/peer1

fabric-ca-client enroll -d -u https://peer1-org2:peer1PW@172.20.0.13:7055

export FABRIC_CA_CLIENT_MSPDIR=tls-msp

fabric-ca-client enroll -d -u https://peer1-org2:peer1PW@172.20.0.10:7052 --enrollment.profile tls --csr.hosts peer1-org2

for entry in "$FABRIC_CA_CLIENT_HOME/tls-msp/keystore"/*; do
    cp "$entry" "$FABRIC_CA_CLIENT_HOME/tls-msp/keystore/key.pem"
done