ARG BASE_IMAGE=ghcr.io/kiggi/vscserver-base:latest

FROM $BASE_IMAGE

### .NET ###
COPY /dotnet/install.sh ${INSTALL_SCRIPTS}/dotnet.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/dotnet.sh

### Cleanup ###
COPY /base/cleanup.sh ${INSTALL_SCRIPTS}/cleanup.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/cleanup.sh
