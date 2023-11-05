#!/usr/bin/bash
ifname=wlp2s0 # modify this to your network interface

get_lan_ip(){
    ip address show dev $ifname | grep -oP 'inet\W+\K(\d+\.?)+'
}

start_upnp_server(){
    mosh-server $@ | grep -oP 'MOSH.+$'
}

upnp_port_forward(){
    upnpc -e mosh -a $1 $2 $2 UDP
}

lan_ip=$(get_lan_ip)
server_output=$(start_upnp_server $@)
port=$(echo $server_output | grep -oP 'MOSH\W+CONNECT\W+\K\d+')
upnp_port_forward $lan_ip $port
echo $server_output