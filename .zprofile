# only prompt for ssh sessions if it is login shell
if [[ -n "$SSH_CONNECTION" && -z "$TMUX_PANE" ]]; then
  tmux attach -t $(tmux list-sessions -F '#{session_name}' | gum filter --prompt "select your existing ssh session > ") 2>/dev/null
fi
