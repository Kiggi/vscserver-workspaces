# Install necessary tools (sorted alphabetically)
apt-get update
apt-get upgrade -y

apt-get install -y \
    apt-transport-https \
    apt-utils \
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

# Set .env variables
if [ -f .env ]; then
    # Load Environment Variables
    export $(cat ../.env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}' )
fi

# Generate locale en_US.UTF-8
locale-gen en_US.UTF-8

# Increase maximum file watchers
echo fs.inotify.max_user_watches=${FILE_WATCHERS} | sudo tee -a /etc/sysctl.conf

# Add openvscode-server user to sudoers file
echo "openvscode-server  ALL=(ALL) NOPASSWD:ALL"  >> /etc/sudoers
