FROM gitpod/openvscode-server:1.64.2

### Versions ###
ENV NODE_VERSION=lts
ENV JAVA_VERSION=17
ENV MAVEN_VERSION=3.8.4
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
    apt-utils \
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
