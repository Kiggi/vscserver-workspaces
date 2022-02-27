ARG BASE_IMAGE=ghcr.io/kiggi/vscserver-base:latest

FROM $BASE_IMAGE

### Go ###
COPY /go/install.sh ${INSTALL_SCRIPTS}/go.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/go.sh
ENV PATH=/usr/local/go/bin:${PATH}

### Cleanup ###
COPY /base/cleanup.sh ${INSTALL_SCRIPTS}/cleanup.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/cleanup.sh
