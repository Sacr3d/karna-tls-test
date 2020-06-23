#!/bin/bash

export FABRIC_CA_CLIENT_HOME=$FABRIC_CA_CLIENT_HOME/ca/admin

fabric-ca-client enroll -d -u https://org2-ca-admin:org2-ca-adminpw@172.20.0.13:7055

fabric-ca-client register -d --id.name peer1-org2 --id.secret peer1PW --id.type peer -u https://172.20.0.13:7055
fabric-ca-client register -d --id.name admin-org2 --id.secret org2AdminPW --id.type user -u https://172.20.0.13:7055
fabric-ca-client register -d --id.name user-org2 --id.secret org2UserPW --id.type user -u https://172.20.0.13:7055