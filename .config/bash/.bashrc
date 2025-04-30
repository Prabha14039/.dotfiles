# Check if we're inside a tmux session
if [[ -z "$TMUX" ]]; then
  # Start a new tmux session (you can customize the name of the session here)
  tmux new-session -A -s mysession
fi

