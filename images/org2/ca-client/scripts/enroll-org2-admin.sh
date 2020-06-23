#!/bin/bash

export FABRIC_CA_CLIENT_HOME=$FABRIC_CA_CLIENT_HOME/admin

export FABRIC_CA_CLIENT_MSPDIR=msp

fabric-ca-client enroll -d -u https://admin-org2:org2AdminPW@172.20.0.13:7055

export FABRIC_CA_CLIENT_HOME=/root/fabric-ca-client/org2


mkdir -p "$FABRIC_CA_CLIENT_HOME/peer1/msp/admincerts"

cp "$FABRIC_CA_CLIENT_HOME/admin/msp/signcerts/cert.pem" "$FABRIC_CA_CLIENT_HOME/peer1/msp/admincerts/org2-admin-cert.pem"