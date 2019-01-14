#!/bin/bash
sh ./brew_install.sh
ln -sf ~/dotfiles/.vimrc            ~/.vimrc
ln -sf ~/dotfiles/config.fish       ~/.config/fish/config.fish
ln -sf ~/dotfiles/.tmux.conf        ~/.tmux.conf
ln -sf ~/dotfiles/.bash_profile     ~/.bash_profile
ln -sf ~/dotfiles/.bashrc           ~/.bashrc
ln -sf ~/dotfiles/.zshrc            ~/.zshrc
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.ctags            ~/.ctags
ln -sf ~/dotfiles/.ideavimrc        ~/.ideavimrc
ln -sf ~/dotfiles/init.vim          ~/.config/nvim/init.vim
