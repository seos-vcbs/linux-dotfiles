# Neovim Installation

Follow the prerequisite

https://nvchad.com/docs/quickstart/install

Download Jetbrains Nerd Font
https://www.nerdfonts.com/font-downloads

Install Ripgrep
```
$ brew install ripgrep
```

Install NVChad
```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

Delete existing custom folder
```
cd ~/.config/nvim/lua
rm -rf custom
```

Git clone NVChad golang customization config
```
git clone https://github.com/dreamsofcode-io/neovim-go-config.git ./custom --depth 1
```

Execute `:MasonInstallAll` to
* install gopls

Install goimports revisor
```
go install -v github.com/incu6us/goimports-reviser/v3@latest
```

Install golines formatter
```
go install github.com/segmentio/golines@latest
```

Install go-delve for debegging
```
go install github.com/go-delve/delve/cmd/dlv@latest
```

Install Treesitter parser for go
```
TSInstall go
```

NVChad theme change

`SPC t h`

# Tmux setup
https://www.youtube.com/watch?v=DzNmUNvnB04&t=202s

Check out tmux plugins
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
