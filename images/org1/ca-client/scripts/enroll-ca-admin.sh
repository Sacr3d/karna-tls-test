#!/bin/bash

export FABRIC_CA_CLIENT_HOME=$FABRIC_CA_CLIENT_HOME/ca/admin

fabric-ca-client enroll -d -u https://org1-ca-admin:org1-ca-adminpw@172.20.0.12:7054

fabric-ca-client register -d --id.name peer1-org1 --id.secret peer1PW --id.type peer -u https://172.20.0.12:7054
fabric-ca-client register -d --id.name admin-org1 --id.secret org1AdminPW --id.type user -u https://172.20.0.12:7054
fabric-ca-client register -d --id.name user-org1 --id.secret org1UserPW --id.type user -u https://172.20.0.12:7054