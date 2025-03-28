#!/bin/bash

# Use the first argument as the session name or default to "nlp_start"
SESSION_NAME=${1:-nlp_start}

# Start a new tmux session with the provided name or attach if it exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Session $SESSION_NAME already exists"
    echo "To attach to the session: tmux attach-session -t $SESSION_NAME"
else
    tmux new-session -d -s $SESSION_NAME
    
    tmux send-keys -t $SESSION_NAME "module load gcc/13.2.0 cuda/12.4.1-vz7djzz cudnn/9.1.1.17-12-ld5h22c" C-m

    # launch jupyter lab
    tmux send-keys -t $SESSION_NAME "uv run --with jupyter jupyter lab --ip=0.0.0.0 --no-browser" C-m
    
    echo "Session $SESSION_NAME started and running in background"
    echo "To attach to the session: tmux attach-session -t $SESSION_NAME"
fi