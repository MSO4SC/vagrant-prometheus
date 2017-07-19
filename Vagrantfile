#!/bin/bash

# Copyright 2017 MSO4SC - javier.carnero@atos.net
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "private_network", ip: "192.168.56.22"
  # config.vm.network "public_network"

  config.vm.synced_folder "../../../Projects", "/home/ubuntu/Projects"

  config.vm.provider "virtualbox" do |vb|
    # Not display the VirtualBox GUI when booting the machine
    vb.gui = false
	vb.cpus = 2 
    # Customize the amount of memory on the VM:
    vb.memory = "5120"
    # vb.customize ["modifyvm", :id, "--vram", "12"]
  end
  
  config.vm.provision "shell", path: "scripts/basic-deps.sh"
  config.vm.provision "shell", path: "scripts/ssh-settings.sh"
  config.vm.provision "shell", path: "scripts/prometheus.sh", args: ["ubuntu","ubuntu"]
  config.vm.provision "file", source: "scripts/clean.sh", destination: "/home/ubuntu"
  config.vm.provision "file", source: "scripts/up.sh", destination: "/home/ubuntu"
  config.vm.provision "file", source: "scripts/down.sh", destination: "/home/ubuntu"
  
  #HACK TO AVOID ttyname failed: Inappropiate ioctl for device
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
end
