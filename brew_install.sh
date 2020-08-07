#!/bin/zsh
function command_exists {
  command -v "$1" > /dev/null;
}

function gem_exists {
  gem list -i "$1" > /dev/null;
}

declare -A commandList=( \
  [nvim]=neovim [ag]=the_silver_searcher \
  [ctags]=ctags [CMake]=CMake [tmux]=tmux \
  [rg]=ripgrep [autojump]=autojump [ghq]=ghq \
  [jq]=jq [peco]=peco
  )

for key val in ${(kv)commandList}; do
	if ! command_exists $key ; then
    brew install $val
  fi
done
