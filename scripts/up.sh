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

tmux new-session -d -s prometheus
tmux selectp -t prometheus
tmux splitw -h -p 50
tmux select-pane -t 0
tmux splitw -v -p 50
tmux select-pane -t 0
tmux send-keys -t 'prometheus:0' 'cd /opt/prometheus/core' Enter
tmux send-keys -t 'prometheus:0' './prometheus -config.file=prometheus.yml' Enter
tmux select-pane -t 1
tmux send-keys -t 'prometheus:0' 'cd /opt/prometheus/grafana' Enter
tmux send-keys -t 'prometheus:0' './bin/grafana-server' Enter
tmux select-pane -t 2
tmux send-keys -t 'prometheus:0' 'exporter_orchestrator' Enter
tmux attach-session -t 'prometheus:0'

tmux bind -n M-Left select-pane -L
tmux bind -n M-Right select-pane -R
tmux bind -n M-Up select-pane -U
tmux bind -n M-Down select-pane -D
