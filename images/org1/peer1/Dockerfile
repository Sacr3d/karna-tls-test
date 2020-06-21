# Dockerfile for Hyperledger peer image. This actually follow yeasy/hyperledger-fabric
# image and add default start cmd.
# Data is stored under /var/hyperledger/db and /var/hyperledger/production

FROM msassone/karna-base-peer:latest
LABEL maintainer "University of Southampton <mattia.sassone.com>"

ENV FABRIC_CFG_PATH /etc/hyperledger/fabric
ENV FABRIC_CA_CLIENT_HOME /root/fabric-ca-client

EXPOSE 7051

RUN mkdir -p $FABRIC_CA_CLIENT_HOME

# ENV CORE_PEER_MSPCONFIGPATH $FABRIC_CFG_PATH/msp

# install fabric peer and copy sampleconfigs
RUN cd $FABRIC_ROOT/peer \
    && CGO_CFLAGS=" " go install -tags "" -ldflags "$LD_FLAGS" \
    && go clean

COPY core.yaml /configs/core.yaml

COPY fabric-ca-client-config.yaml /configs/fabric-ca-client-config.yaml

COPY /scripts/ /scripts/

RUN chmod +x /scripts/launch.sh

RUN chmod +x /scripts/enroll.sh

VOLUME /etc/hyperledger/fabric

VOLUME $FABRIC_CA_CLIENT_HOME

WORKDIR $FABRIC_ROOT

ENTRYPOINT /scripts/launch.sh