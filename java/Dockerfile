ARG BASE_IMAGE=ghcr.io/kiggi/vscserver-base:latest

FROM $BASE_IMAGE

### Java ###
COPY ../java/install.sh ${INSTALL_SCRIPTS}/java.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/java.sh
ENV PATH=/usr/local/apache-maven-${MAVEN_VERSION}/bin:/usr/local/gradle-${GRADLE_VERSION}/bin:${PATH}

### Cleanup ###
COPY /base/cleanup.sh ${INSTALL_SCRIPTS}/cleanup.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/cleanup.sh
