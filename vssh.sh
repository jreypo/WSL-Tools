#!/bin/bash

pwd_alias () { echo "$PWD"; }
get_port () {
        SSH_PORT="`/mnt/c/HashiCorp/Vagrant/bin/vagrant.exe ssh-config $1 | grep Port | awk '{ print $2 }' | dos2unix`"
        echo $SSH_PORT
}

if [[ "$1" == "" ]]; then
  VM="default"
  ssh -p `get_port` -i `pwd_alias`/.vagrant/machines/default/virtualbox/private_key vagrant@127.0.0.1
else
  ssh -p `get_port` -i `pwd_alias`/.vagrant/machines/$1/virtualbox/private_key vagrant@127.0.0.1
fi