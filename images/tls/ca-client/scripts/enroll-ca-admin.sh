#!/bin/bash

export FABRIC_CA_CLIENT_HOME=$FABRIC_CA_CLIENT_HOME/admin

fabric-ca-client enroll -d -u https://tls-ca-admin:tls-ca-adminpw@172.20.0.10:7052

fabric-ca-client register -d --id.name peer1-org1 --id.secret peer1PW --id.type peer -u https://172.20.0.10:7052
fabric-ca-client register -d --id.name peer1-org2 --id.secret peer1PW --id.type peer -u https://172.20.0.10:7052
fabric-ca-client register -d --id.name orderer1-org0 --id.secret ordererPW --id.type orderer -u https://172.20.0.10:7052
