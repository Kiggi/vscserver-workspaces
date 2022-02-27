# Install necessary tools (sorted alphabetically)
apt-get update
apt-get upgrade -y

apt-get install -y \
    apt-transport-https \
    bash-completion \
    build-essential \
    ca-certificates \
    emacs-nox \
    fish \
    jq \
    less \
    locales \
    lsof \
    man-db \
    multitail \
    nano \
    ninja-build \
    ssl-cert \
    sudo \
    time \
    unzip \
    zip \
    zsh \
    ubuntu-server

# Generate locale en_US.UTF-8
locale-gen en_US.UTF-8

# Add openvscode-server to sudoers file
echo "openvscode-server  ALL=(ALL) NOPASSWD:ALL"  >> /etc/sudoers
