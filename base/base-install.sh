INSTALL_SCRIPTS=/tmp/install

### Prerequisites ###
# Install system tools (sorted alphabetically)
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

# Set .env variables
if [ -f .env ]; then
    # Load Environment Variables
    export $(cat ../.env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}' )
fi

# Generate locale en_US.UTF-8
locale-gen en_US.UTF-8
export LANG=en_US.UTF-8

# Increase maximum file watchers
echo fs.inotify.max_user_watches=${FILE_WATCHERS} | sudo tee -a /etc/sysctl.conf

# Add openvscode-server user to sudoers file
echo "openvscode-server  ALL=(ALL) NOPASSWD:ALL"  >> /etc/sudoers

### Base Tools ###
# Install Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt update
apt install gh
