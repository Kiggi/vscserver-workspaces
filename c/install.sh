# Add LLVM Repository key
curl -sL https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add

# Add LLVM Repository to source list
sudo bash -c 'echo "deb https://apt.llvm.org/focal/ llvm-toolchain-focal main" >> /etc/apt/sources.list.d/llvm.list'

# Install C / C++ tools
sudo apt-get install \
    clang \
    clang-format \
    clang-tidy  \
    g++ \
    gcc \
    gdb \
    lld \
    make -y