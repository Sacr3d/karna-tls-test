# Dockerfile for Hyperledger fabric-ca image.
# Workdir is set to $GOPATH/src/github.com/hyperledger/fabric-ca

# Edited to add custom scripts and to run on Alpine

FROM golang:alpine
LABEL maintainer "University of Southampton <mattia.sassone.com>"

ENV PROJECT_VERSION 1.4.7

# ca-server and ca-client will check the following env in order, to get the home cfg path
ENV FABRIC_CA_HOME /etc/hyperledger/fabric-ca-server
ENV CA_CFG_PATH /etc/hyperledger/fabric-ca

# This is go simplify this Dockerfile
ENV FABRIC_CA_ROOT $GOPATH/src/github.com/hyperledger/fabric-ca

# Usually the binary will be installed into $GOPATH/bin, but we add local build path, too
ENV PATH=$FABRIC_CA_ROOT/bin:$PATH

#ARG FABRIC_CA_DYNAMIC_LINK=false

RUN mkdir -p $GOPATH/src/github.com/hyperledger \
    $CA_CFG_PATH \
    $FABRIC_CA_HOME \
    /var/hyperledger/fabric-ca-server

# Need libtool to provide the header file ltdl.h
RUN apk update \
    && apk add libtool unzip git gcc build-base curl \
    && rm -rf /var/cache/apt

# Install yq to update config for fabric-ca
RUN wget -O /go/bin/yq https://github.com/mikefarah/yq/releases/download/2.4.1/yq_linux_amd64 \
    && chmod a+x /go/bin/yq

# clone and build ca
RUN cd $GOPATH/src/github.com/hyperledger \
    && git clone --single-branch -b release-1.4 --depth 1 https://github.com/hyperledger/fabric-ca.git \
    # This will install fabric-ca-server into $GOPATH/bin/
    && go install -ldflags "-X github.com/hyperledger/fabric-ca/lib/metadata.Version=$PROJECT_VERSION -linkmode external -extldflags '-static -lpthread'" github.com/hyperledger/fabric-ca/cmd/fabric-ca-server/...

