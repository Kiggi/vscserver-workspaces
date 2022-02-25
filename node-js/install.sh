# Run Node.js setup script
curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | sudo bash

# Install nodejs and npm
sudo apt-get install nodejs -y

# Upgrade npm
sudo npm install -g npm

# Install typescript, yarn and node-gyp
sudo npm install -g typescript yarn node-gyp