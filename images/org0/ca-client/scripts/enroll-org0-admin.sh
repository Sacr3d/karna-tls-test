#!/bin/bash

export FABRIC_CA_CLIENT_HOME=$FABRIC_CA_CLIENT_HOME/admin

export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-org0:org0adminpw@172.20.0.11:7053

export FABRIC_CA_CLIENT_HOME=/root/fabric-ca-client/org0


mkdir -p "$FABRIC_CA_CLIENT_HOME/orderer/msp/admincerts"

cp "$FABRIC_CA_CLIENT_HOME/admin/msp/signcerts/cert.pem" "$FABRIC_CA_CLIENT_HOME/orderer/msp/admincerts/orderer-admin-cert.pem"