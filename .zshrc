# evals {
export BUNDLER_EDITOR=vim
if [ ! -z "$TMUX" ]; then
  export PATH="$HOME/.rbenv/bin:$HOME/.nodebrew/current/bin:$PATH" # [rbenv, nodebrew]
  eval "$(rbenv init -)"
fi
# }

# modify misspelled commands
setopt correct
# set max file descriptor
ulimit -n 9480

# history {
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

## peco
function peco_history_search() {
  BUFFER=`history -n 1 | tail -r | awk '!ary[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco_history_search
bindkey '^R' peco_history_search
# }

# alias {
alias vim='nvim'
alias v='vagrant'
alias d='docker'
alias ll='ls -l'
alias so='source'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gco='git checkout'
alias gc='git commit'
alias gd='git diff'
alias gf='git fetch'
alias gs='git status'
alias ggr='git grep'

alias wf='cd $HOME/others/workflow; vim $(date +%Y%m%d).md'
alias sl='open /Applications/Slack.app'
# }

# prompt {
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
# }

# git utils {
## git checkout a branch selected with peco
function gcop() {
  if [ $(echo $1 | egrep -- "^-a$") ]; then
      local opt="$1"
      shift
  fi

  git branch $opt |
    cut -b 3- |
    grep -v -- '->' |
    peco |
    sed -e 's/remotes\/origin\///' |
    xargs git checkout
}

## git branch -D a branch selected with peco
function gdp() {
  git branch |
    cut -b 3- |
    peco |
    xargs git branch -D
}

## get commit title
function gt() {
  git log | sed 's/^[ \t]*//' | egrep "^refs" | peco | pbcopy
}
# }

# ghq utils {
function ghqp() {
  ghq look $(ghq list | peco | cut -d '/' -f 3)
}
# }

# to utilize antojump {
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# }

# load .zshrc.local if exists {
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
# }
