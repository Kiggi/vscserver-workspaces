ARG BASE_IMAGE=ghcr.io/kiggi/vscserver-base:latest

FROM $BASE_IMAGE

### Docker ###
COPY /docker/install.sh ${INSTALL_SCRIPTS}/docker.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/docker.sh

### Cleanup ###
COPY /base/cleanup.sh ${INSTALL_SCRIPTS}/cleanup.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/cleanup.sh
