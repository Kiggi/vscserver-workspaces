# Set default base image
ARG BASE_IMAGE=ghcr.io/kiggi/vscserver-base:latest

FROM $BASE_IMAGE

### C / C++ ###
# + needs to be escaped, otherwise build will fail
COPY ../c/install.sh ${INSTALL_SCRIPTS}/c.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/c.sh

### Node.js ###
COPY ../node-js/install.sh ${INSTALL_SCRIPTS}/node-js.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/node-js.sh

### Java ###
COPY ../java/install.sh ${INSTALL_SCRIPTS}/java.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/java.sh
ENV PATH=/usr/local/apache-maven-${MAVEN_VERSION}/bin:/usr/local/gradle-${GRADLE_VERSION}/bin:${PATH}

### Haskell ###
COPY ../haskell/install.sh ${INSTALL_SCRIPTS}/haskell.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/haskell.sh

### Go ###
COPY ../go/install.sh ${INSTALL_SCRIPTS}/go.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/go.sh
ENV PATH=/usr/local/go/bin:${PATH}

### .NET ###
COPY ../dotnet/install.sh ${INSTALL_SCRIPTS}/dotnet.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/dotnet.sh

### Docker ###
COPY ../docker/install.sh ${INSTALL_SCRIPTS}/docker.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/docker.sh

### Cleanup ###
COPY ../base/cleanup.sh ${INSTALL_SCRIPTS}/cleanup.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/cleanup.sh
