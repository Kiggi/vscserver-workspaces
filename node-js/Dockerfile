ARG BASE_IMAGE=ghcr.io/kiggi/vscserver-base:latest

FROM $BASE_IMAGE

### Node.js ###
COPY ../node-js/install.sh ${INSTALL_SCRIPTS}/node-js.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/node-js.sh

### Cleanup ###
COPY /base/cleanup.sh ${INSTALL_SCRIPTS}/cleanup.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/cleanup.sh
