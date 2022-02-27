# Add docker gpg key to apt
curl -sL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add

# Add docker repository to apt
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Install docker-cli
sudo apt-get install docker-ce-cli -y

# Add dive
wget https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb
sudo apt install ./dive_${DIVE_VERSION}_linux_amd64.deb
rm -f ./dive_${DIVE_VERSION}_linux_amd64.deb