#!/bin/bash

export FABRIC_CA_CLIENT_HOME=$FABRIC_CA_CLIENT_HOME/orderer

fabric-ca-client enroll -d -u https://orderer1-org0:ordererpw@172.20.0.11:7053

export FABRIC_CA_CLIENT_MSPDIR=tls-msp

fabric-ca-client enroll -d -u https://orderer1-org0:ordererPW@172.20.0.10:7052 --enrollment.profile tls --csr.hosts orderer1-org0

for entry in "$FABRIC_CA_CLIENT_HOME/tls-msp/keystore"/*; do
    cp "$entry" "$FABRIC_CA_CLIENT_HOME/tls-msp/keystore/key.pem"
done