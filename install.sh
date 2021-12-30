#!/bin/zsh
zsh ~/dotfiles/brew_install.sh
ln -sf ~/dotfiles/.tmux.conf               ~/.tmux.conf
ln -sf ~/dotfiles/.bash_profile            ~/.bash_profile
ln -sf ~/dotfiles/.bashrc                  ~/.bashrc
ln -sf ~/dotfiles/.zshrc                   ~/.zshrc
ln -sf ~/dotfiles/.gitignore_global        ~/.gitignore_global
ln -sf ~/dotfiles/.ctags                   ~/.ctags
ln -sf ~/dotfiles/init.vim                 ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vscode/settings.json     ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/dotfiles/vscode/keybindings.json  ~/Library/Application\ Support/Code/User/keybindings.json
