#!/bin/bash

# https://how-to.dev/how-to-create-tmux-session-with-a-script

cd ~/code/opsweb

# create session
session="ops"
tmux new-session -d -s $session

# window-0 is already created, that's why we rename
window=0
tmux rename-window -t $session:$window 'main'

window=1
tmux new-window -t $session:$window -n 'notebook'
tmux send-keys -t $session:$window 'pyenv activate opsweb && python -m notebook' C-m

# attach session
tmux attach-session -t $session
