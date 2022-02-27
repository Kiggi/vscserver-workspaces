FROM gitpod/openvscode-server:1.64.2

### Versions ###
ENV NODE_VERSION=lts
ENV JAVA_VERSION=17
ENV MAVEN_VERSION=3.8.4
ENV GRADLE_VERSION=7.4
ENV GO_VERSION=1.17.7
ENV DIVE_VERSION=0.10.0

### Paths ###
ENV INSTALL_SCRIPTS=/tmp/install

### Prerequisites ###
# Switch to root user to make installs
USER root
# Disable prompts during install
ENV DEBIAN_FRONTEND noninteractive
# Copy and run prerequisites script
COPY /base/base-install.sh ${INSTALL_SCRIPTS}/base-install.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/base-install.sh
# Set locales to en_US
ENV LANG=en_US.UTF-8
# Switch back to openvscode-server user for setup
USER openvscode-server
