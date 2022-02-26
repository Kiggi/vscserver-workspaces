# Save PATH
echo "PATH="${PATH}"" | sudo tee /etc/environment

# Remove install scripts folder
rm -rf ${INSTALL_SCRIPTS}