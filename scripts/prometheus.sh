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



if [[ $# -eq 0 ]] ; then
    echo 'Usage: '$0' user group' 
    exit 1
fi

cd /opt
mkdir prometheus
cd prometheus

#install prometheus
wget -q "https://github.com/prometheus/prometheus/releases/download/v1.6.2/prometheus-1.6.2.linux-amd64.tar.gz"
tar -xzf prometheus-*.tar.gz
rm prometheus-*.tar.gz
mv prometheus* core

#mkdir core/target
#mkdir core/alerts
#ln -s $PWD/../config_core/*.yml $PWD/core/
#ln -s $PWD/../config_core/*.rules $PWD/core/alerts/
#ln -s $PWD/../config_core/*.json $PWD/core/target/
ln -s /home/$1/Projects/mso4sc/MSOMonitor/prometheus.yml ./core/
ln -s /home/$1/Projects/mso4sc/MSOMonitor/targets ./core/

#install alertmanager
wget -q "https://github.com/prometheus/alertmanager/releases/download/v0.6.2/alertmanager-0.6.2.linux-amd64.tar.gz"
tar -xzf  alertmanager-*.tar.gz
rm alertmanager-*.tar.gz
mv alertmanager* alertmanager

#mkdir alertmanager/template
#ln -s $PWD/../config_alert/*.yml $PWD/alertmanager/
#ln -s $PWD/../config_alert/*.tmpl $PWD/alertmanager/template/


#install  grafana
wget -q "https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-4.2.0.linux-x64.tar.gz"
tar -zxf grafana-*.tar.gz
rm  grafana-*.tar.gz
mv grafana* grafana

#ln -s $PWD/../config_grafana/*.ini $PWD/grafana/conf

#install  node_exporter
wget -q "https://github.com/prometheus/node_exporter/releases/download/v0.14.0/node_exporter-0.14.0.linux-amd64.tar.gz"
tar -xzf node_exporter-*.tar.gz
rm node_exporter-*.tar.gz
mv node_exporter* node_exporter

#change ownership
chown -R $1:$2 /opt/prometheus

#update user path
echo 'export PATH=$PATH:/opt/prometheus/core:/opt/prometheus/alertmanager:/opt/prometheus/node_exporter' >> /home/$1/.bashrc

#install go to compile exporters
apt-get -y install golang-go
echo 'export PATH=$PATH:/home/$1/Projects/go/bin' >> /home/$1/.bashrc
echo 'export GOPATH=/home/$1/Projects/go' >> /home/$1/.bashrc

