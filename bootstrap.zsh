#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
        --exclude "bootstrap.zsh" \
        --exclude "CREDIT.md" \
        --exclude "NEOVIM.md" \
        -avh --no-perms . ~;
	source ~/.zshrc;
}

doIt;
unset doIt;
