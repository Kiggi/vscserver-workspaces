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
# Add Microsoft PPA
RUN curl -sL https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -o packages-microsoft-prod.deb
RUN sudo apt install ./packages-microsoft-prod.deb
RUN rm -f ./packages-microsoft-prod.deb
RUN sudo apt-get update && sudo apt-get install -y dotnet-sdk-6.0 dotnet-sdk-5.0 dotnet-sdk-3.1

### Docker ###
# Add docker gpg key to apt
RUN curl -sL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
# Add docker repository to apt
RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
# Install docker packages
RUN sudo apt-get install docker-ce-cli -y
# Add openvscode-server to docker group
# RUN sudo usermod -aG docker openvscode-server
# Add dive
RUN wget https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb && \
    sudo apt install ./dive_${DIVE_VERSION}_linux_amd64.deb && \
    rm -f ./dive_${DIVE_VERSION}_linux_amd64.deb

### Cleanup ###
COPY ../base/cleanup.sh ${INSTALL_SCRIPTS}/cleanup.sh
RUN ${INSTALL_SCRIPTS}/cleanup.sh
