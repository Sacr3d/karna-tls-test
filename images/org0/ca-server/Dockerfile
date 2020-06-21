# Dockerfile for Hyperledger fabric-ca image.
# Workdir is set to $GOPATH/src/github.com/hyperledger/fabric-ca

# Edited to add custom scripts and to run on Alpine

FROM msassone/karna-base-ca-server:latest
LABEL maintainer "University of Southampton <mattia.sassone.com>"

# ca-server and ca-client will check the following env in order, to get the home cfg path
ENV FABRIC_CA_SERVER_HOME /etc/hyperledger/fabric-ca-server
ENV FABRIC_CA_CLIENT_HOME /root/fabric-ca-client

# This is go simplify this Dockerfile
ENV FABRIC_CA_ROOT $GOPATH/src/github.com/hyperledger/fabric-ca

# Usually the binary will be installed into $GOPATH/bin, but we add local build path, too
ENV PATH=$FABRIC_CA_ROOT/bin:$PATH

#ARG FABRIC_CA_DYNAMIC_LINK=false

# fabric-ca-server will open service to '0.0.0.0:7053/api/v1/'
EXPOSE 7053

RUN mkdir -p $FABRIC_CA_SERVER_HOME \
    $FABRIC_CA_CLIENT_HOME 

COPY fabric-ca-server-config.yaml /configs/fabric-ca-server-config.yaml

COPY fabric-ca-client-config.yaml /configs/fabric-ca-client-config.yaml

COPY /scripts/ /scripts/

RUN chmod +x /scripts/launch.sh
RUN chmod +x /scripts/enroll.sh

VOLUME $FABRIC_CA_SERVER_HOME
VOLUME $FABRIC_CA_CLIENT_HOME

WORKDIR $FABRIC_CA_ROOT

ENTRYPOINT /scripts/launch.sh
