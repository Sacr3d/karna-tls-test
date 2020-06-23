#!/bin/bash

export FABRIC_CA_CLIENT_HOME=$FABRIC_CA_CLIENT_HOME/org1/peer1

fabric-ca-client enroll -d -u https://peer1-org1:peer1PW@0.0.0.0:7054

# export FABRIC_CA_CLIENT_MSPDIR=tls-msp
# fabric-ca-client enroll -d -u https://peer1-org1:peer1PW@0.0.0.0:7052 --enrollment.profile tls --csr.hosts peer1-org1