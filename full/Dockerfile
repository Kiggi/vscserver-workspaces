FROM ${BASE_IMAGE:-'ghcr.io/kiggi/vscserver-base'}

### C / C++ ###
# Add LLVM GPG key and repository to apt (clangd doesn't work)
RUN curl -sL https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add \
    && sudo bash -c 'echo "deb https://apt.llvm.org/focal/ llvm-toolchain-focal main" >> /etc/apt/sources.list.d/llvm.list'
# Install C / C++ tools
RUN sudo apt-get install \
    clang \
    clang-format \
    clang-tidy  \
    g++ \
    gcc \
    gdb \
    lld \
    make -y

### Node.js ###
# Run Node.js setup script
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | sudo bash
# Install nodejs and npm
RUN sudo apt-get install nodejs -y
# Install typescript, yarn and node-gyp
RUN sudo npm install -g typescript yarn node-gyp

### Java ###
# Install OpenJDK
RUN sudo apt-get install openjdk-$JAVA_VERSION-jdk-headless -y
# Install Maven
RUN curl -sL https://dlcdn.apache.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | sudo tar -C /usr/local -xvz
# Add Maven to the PATH
ENV PATH=/usr/local/apache-maven-${MAVEN_VERSION}/bin:${PATH}
# Install Gradle
RUN sudo curl -o /opt/gradle -sL https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip \
    && sudo unzip -d /usr/local /opt/gradle && sudo rm -rf /opt/gradle
# Add Gradle to the PATH
ENV PATH=/usr/local/gradle-${GRADLE_VERSION}/bin:${PATH}

### Haskell ###
RUN sudo apt-get install haskell-platform -y

### Go ###
RUN curl -sL https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz | sudo tar -C /usr/local -xvz
ENV PATH=/usr/local/go/bin:${PATH}

### .NET ###
# Add Microsoft PPA
RUN curl -sL https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -o packages-microsoft-prod.deb
RUN sudo apt install ./packages-microsoft-prod.deb
RUN rm -f ./packages-microsoft-prod.deb
RUN sudo apt-get update && sudo apt-get install -y dotnet-sdk-5.0 dotnet-sdk-3.1

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

### Export path ###
RUN echo "PATH="${PATH}"" | sudo tee /etc/environment
