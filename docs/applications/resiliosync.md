# ResilioSync

Homepage: [https://hub.docker.com/r/resilio/sync/](https://hub.docker.com/r/resilio/sync/)

Sync uses peer-to-peer technology to provide fast, private file sharing for teams and individuals. By skipping the cloud, transfers can be significantly faster because files take the shortest path between devices. Sync does not store your information on servers in the cloud, avoiding cloud privacy concerns.

## Usage

Set `resiliosync_enabled: true` in your `inventories/<your_inventory>/nas.yml` file.

The ResilioSync web interface can be found at http://ansible_nas_host_or_ip:8888. 
