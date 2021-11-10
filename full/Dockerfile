FROM gitpod/openvscode-server:1.62.0

### Versions ###
ENV NODE_VERSION=lts
ENV JAVA_VERSION=17
ENV MAVEN_VERSION=3.8.2
ENV GRADLE_VERSION=7.2
ENV GO_VERSION=1.17.1
ENV NET_VERSION=LTS
ENV DIVE_VERSION=0.10.0

### Prerequisites ###
# Switch to root user to make installs and add openvscode-server to sudo group
USER root
RUN apt-get update
# Install necessary tools (sorted alphabetically) (ripgrep doesn't work) (apt-utils?)
RUN apt-get install \
    apt-transport-https \ 
    bash-completion \
    build-essential \
    ca-certificates \
    curl \
    emacs-nox \
    fish \
    gnupg \
    htop \
    jq \
    less \
    locales \
    lsb-release \
    lsof \
    man-db \
    multitail \
    nano \
    ninja-build \
    software-properties-common \
    ssl-cert \
    sudo \
    time \
    unzip \
    vim \
    zip \
    zsh -y
# Generate and set locale to en_US.UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
# Add openvscode-server to sudoers file
RUN echo "openvscode-server  ALL=(ALL) NOPASSWD:ALL"  >> /etc/sudoers
# Switch back to openvscode-server for setup
USER openvscode-server
# Test sudo capability of openvscode-server
RUN sudo echo "openvscode-server running sudo"

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
RUN curl -sL https://dlcdn.apache.org/maven/maven-3/3.8.2/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | sudo tar -C /usr/local -xvz
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

#### .NET ###
# Add Microsoft PPA
RUN curl -sL https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -o packages-microsoft-prod.deb
RUN sudo apt install ./packages-microsoft-prod.deb
RUN rm -f ./packages-microsoft-prod.deb
RUN sudo apt-get update && sudo apt-get install -y dotnet-sdk-5.0 dotnet-sdk-3.1

### Docker ###
# Add vfs storage-driver config to daemon.json
RUN sudo mkdir /etc/docker && echo '{"storage-driver": "vfs"}' | sudo tee /etc/docker/daemon.json
# Add docker gpg key to apt
RUN curl -sL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
# Add docker repository to apt
RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
# Install docker packages
RUN sudo apt-get install docker-ce docker-ce-cli containerd.io -y
# Add openvscode-server to docker group
RUN sudo usermod -aG docker openvscode-server
# Add dive
RUN wget https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb && \
    sudo apt install ./dive_0.9.2_linux_amd64.deb && \
    rm -f ./dive_0.9.2_linux_amd64.deb

RUN echo "PATH="${PATH}"" | sudo tee /etc/environment
ENTRYPOINT sudo service docker start && ${OPENVSCODE_SERVER_ROOT}/server.sh
