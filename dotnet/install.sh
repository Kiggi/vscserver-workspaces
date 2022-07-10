# Add Microsoft PPA
curl -sL https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -o packages-microsoft-prod.deb
sudo apt install ./packages-microsoft-prod.deb
rm -f ./packages-microsoft-prod.deb

# Install current versions
sudo apt-get update
sudo apt-get install -y dotnet-sdk-${DOTNET_LATEST_VERSION} dotnet-sdk-${DOTNET_LATEST_VERSION}