# vagrant-prometheus
(Vagrant) VirtualBox Machine with Prometheus, AlertManager, Grafana and NodeExporter.

## Setup
To be able to connect from the host machine without using "vagrant ssh" command, change scripts/ssh-settings.sh with the host public key.
To change the gest Ip, modify the Vagrant file (config.vm.network "private_network", ip: "[IP]")