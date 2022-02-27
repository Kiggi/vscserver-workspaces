ARG BASE_IMAGE=ghcr.io/kiggi/vscserver-base:latest

FROM $BASE_IMAGE

### Haskell ###
COPY /haskell/install.sh ${INSTALL_SCRIPTS}/haskell.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/haskell.sh

### Cleanup ###
COPY /base/cleanup.sh ${INSTALL_SCRIPTS}/cleanup.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/cleanup.sh
