#!/bin/bash

export FABRIC_CA_CLIENT_HOME=$FABRIC_CA_CLIENT_HOME/admin

export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-org1:org1AdminPW@172.20.0.12:7054

export FABRIC_CA_CLIENT_HOME=/root/fabric-ca-client/org1


mkdir -p "$FABRIC_CA_CLIENT_HOME/peer1/msp/admincerts"

cp "$FABRIC_CA_CLIENT_HOME/admin/msp/signcerts/cert.pem" "$FABRIC_CA_CLIENT_HOME/peer1/msp/admincerts/org1-admin-cert.pem"