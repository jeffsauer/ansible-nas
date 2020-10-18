#!/bin/bash

# script to provision the ZFS tank storage area for use with Ansible-NAS
#
# In virtual machine, virtio devices /dev/vdb, /dev/vdc, /dev/vdd, /dev/vde
# 
# To destroy an existing zpool:
#   sudo zpool destroy tank
#
# Setup zpool: use raidz2 (min 4 disks, up to 2 can fail), sector size 4k (ashift=12), use physical disk IDs if possible

sudo zpool create -o ashift=12 tank raidz2 vdb vdc vdd vde

zpool list
zpool status tank

sudo zfs create tank/books
sudo zfs set exec=off tank/books

sudo zfs create tank/comics
sudo zfs set exec=off tank/comics

sudo zfs create tank/documents

sudo zfs create tank/downloads
sudo zfs set exec=off tank/downloads

sudo zfs create tank/dump

sudo zfs create tank/games

sudo zfs create tank/isos
sudo zfs set recordsize=1M tank/isos
sudo zfs set compression=off tank/isos
sudo zfs set exec=off tank/isos

sudo zfs create tank/movies
sudo zfs set recordsize=1M tank/movies
sudo zfs set compression=off tank/movies
sudo zfs set exec=off tank/movies

sudo zfs create tank/music
sudo zfs set compression=off tank/music
sudo zfs set exec=off tank/music

sudo zfs create tank/photos
sudo zfs set compression=off tank/photos
sudo zfs set exec=off tank/photos

sudo zfs create tank/podcasts
sudo zfs set compression=off tank/podcasts
sudo zfs set exec=off tank/podcasts

sudo zfs create tank/software

sudo zfs create tank/torrents
sudo zfs set exec=off tank/torrents

sudo zfs create tank/tv
sudo zfs set recordsize=1M tank/tv
sudo zfs set compression=off tank/tv
sudo zfs set exec=off tank/tv
