#!/bin/bash
#
# ansible_nas_provision.sh script
#
# download / install Ubuntu Server 20.04.1 LTS from https://ubuntu.com/download/server
#
# make primary user name "admin"
# install using ZFS filesystem
#
# Setup ZFS pool "tank" using zfs_provision.sh script

sudo apt install git openssh-server ansible

# make sure that sshd is set to autostart upon boot
sudo systemctl enable ssh

cd /home/admin

git clone https://github.com/davestephens/ansible-nas.git && cd ansible-nas

git clone https://github.com/jeffsauer/ansible-nas.git

ansible-galaxy install -r requirements.yml

ansible-playbook -i inventories/ansible-nas/inventory nas.yml -b -K

# fix up zfs pool tank permissions
sudo chown -R ansible-nas.ansible-nas *

# install bpytop performance monitor
sudo snap install bpytop
sudo snap connect bpytop:mount-observe
sudo snap connect bpytop:network-control
sudo snap connect bpytop:hardware-observe
sudo snap connect bpytop:system-observe
sudo snap connect bpytop:process-control
sudo snap connect bpytop:physical-memory-observe
