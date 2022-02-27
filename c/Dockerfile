# Set default base image
ARG BASE_IMAGE=ghcr.io/kiggi/vscserver-base:latest

FROM $BASE_IMAGE

### C / C++ ###
COPY /c/install.sh ${INSTALL_SCRIPTS}/c.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/c.sh

### Cleanup ###
COPY /base/cleanup.sh ${INSTALL_SCRIPTS}/cleanup.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/cleanup.sh
