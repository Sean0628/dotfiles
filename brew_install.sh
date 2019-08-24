#!/bin/bash
function command_exists {
  command -v "$1" > /dev/null;
}

function gem_exists {
  gem list -i "$1" > /dev/null;
}

if ! command_exists nvim ; then
  brew install neovim
fi

if ! command_exists ag ; then
  brew install the_silver_searcher
fi

if ! command_exists ctags ; then
  brew install ctags
fi

if ! command_exists zsh ; then
  brew install zsh
fi

if ! command_exists CMake ; then
  brew install CMake
fi

if ! command_exists tmux ; then
  brew install tmux
fi

if ! command_exists rg ; then
  brew install ripgrep
fi

if ! command_exists autojump ; then
  brew install autojump
fi

if ! command_exists ghq ; then
  brew install ghq
fi

if ! gem_exists tmuxinator ; then
  gem install tmuxinator
fi
