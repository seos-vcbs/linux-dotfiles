# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

eval "$(pyenv init -)"
autoload -U compinit; compinit

# session-wise fix
ulimit -n 4096

# pure terminal PS1 breaks on CentOS 7. It will use over 100% CPU
# only active pure on Debian
os_name=$(grep PRETTY_NAME /etc/os-release | awk -F= '{ print $2 }')
if [ "${os_name}" != "\"CentOS Linux 7 (Core)\"" ]; then
  fpath+=($HOME/.zsh/pure)
  autoload -U promptinit; promptinit
  prompt pure
  zstyle :prompt:pure:path color white
else
  export PS1="[%n@%m %~]$ "
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# an attempt to set cap to function like esc. using tweaks might be better
setxkbmap -option caps:escape
