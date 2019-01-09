# evals
export BUNDLER_EDITOR=vim
export PATH="$HOME/.rbenv/bin:$PATH" # rbenv
export PATH="$HOME/.nodebrew/current/bin:$PATH" # nodebrew

# history
## where to place history file
export HISTFILE=$HOME/.zsh_history
## the size of history stored in-memory
export HISTSIZE=1000
## the size of history stored in the history file
export SAVEHIST=100000
## ignore duplicates
setopt hist_ignore_dups
## make it possible to edit before execute
setopt hist_verify
## remove extra blanks from commands
setopt hist_reduce_blanks
## history search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
## history incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# modify misspelled commands
setopt correct

# alias
alias v='vagrant'
alias gr='grep'
alias grr='grep -R'
alias ll='ls -l'
alias so='source'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gs='git status'

alias wf='vim $(date +%Y%m%d).md'

# set max file descriptor
ulimit -n 9480

# prompt
function precmd() {
  PROMPT="`prompt_exit_status` `prompt_current_path` `prompt_current_branch`> "
}

function prompt_current_branch() {
  local branch_name st branch_status color

  if [ ! -e  '.git' ]; then
    return 0
  fi

  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`

  if [[ -n `echo $st | grep '^nothing to'` ]]; then
    color='green'
  elif [[ -n `echo $st | grep '^Untracked files'` ]]; then
    branch_status='?'
    color='red'
  elif [[ -n `echo $st | grep '^Changes not staged for commit'` ]]; then
    branch_status='+'
    color='red'
  elif [[ -n `echo $st | grep '^Changes to be committed'` ]]; then
    branch_status='!'
    color='yellow'
  elif [[ -n `echo $st | grep '^rebase in progress'` ]]; then
    # comflicts
    echo "%F{red}!(no branch)"
    return 0
  else
    color='blue'
  fi
  echo "%F{$color}[$branch_name$branch_status]%f"
}

function prompt_current_path() {
  echo ${${:-/${(j:/:)${(M)${(s:/:)${(D)PWD:h}}#(|.)[^.]}}/${PWD:t}}//\/~/\~}
}

function prompt_exit_status() {
  local success fail

  success=$'(ｏ￣∀￣%)ﾉ”ぁぃ'
  fail=$'ρ(･ω･､%)ｲｼﾞｲｼﾞ'

  echo "%(?."%B%F{cyan}$success%b%f"."%B%F{red}$fail%b%f")"
}
