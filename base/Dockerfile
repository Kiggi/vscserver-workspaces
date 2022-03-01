FROM gitpod/openvscode-server:1.64.2

### Prerequisites ###
# Switch to root user to make installs
USER root

# Disable prompts during install
ENV DEBIAN_FRONTEND noninteractive
# Copy and run prerequisites script
COPY /base/base-install.sh ${INSTALL_SCRIPTS}/base-install.sh
RUN /bin/sh ${INSTALL_SCRIPTS}/base-install.sh

# Switch back to openvscode-server user for setup
USER openvscode-server
