GO_VERSION=1.17.7

curl -sL https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz | sudo tar -C /usr/local -xvz

export PATH=/usr/local/go/bin:${PATH}