# mosh-server-upnp-bash
simple launch script to automate the upnpc port forward upon mosh connection

## Dependencies
- iproute2
- miniupnpc
- mosh

## Install
```shell
# Clone this repo
git clone https://x.muio.cn:7773/rexoen/mosh-server-upnp-bash

# Modify the interface value
cd mosh-server-upnp-bash

vim mosh_server_upnp.sh
# ...
#!/usr/bin/bash
ifname=wlp2s0 # modify this to your network interface
# ...

# Install script in your server $PATH
sudo install -Dm755 mosh_server_upnp.sh /usr/local/bin
```

## Usage
```shell
# connect server from client
mosh --server=mosh_server_upnp.sh user@server-ip
```