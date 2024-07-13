# only prompt for ssh sessions if it is login shell

if [[ -n "$SSH_CONNECTION" && -z "$TMUX_PANE" ]]; then
    if command -v tmux &>/dev/null && command -v gum &>/dev/null; then
        if session_list=$(tmux list-sessions -F '#{session_name}' 2>/dev/null); then
            if [[ -n "$session_list" ]]; then
                session_name=$(echo "$session_list" | gum filter --prompt "select your existing ssh session > ")
                if [[ -n "$session_name" ]]; then
                    tmux attach -t "$session_name" 2>/dev/null
                else
                    echo "No session selected."
                fi
            else
                # echo "No existing tmux sessions found."
            fi
        else
            # echo "Failed to list tmux sessions."
        fi
    else
        echo "tmux or gum is not installed."
    fi
fi
