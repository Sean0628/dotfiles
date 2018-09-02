# Set vim as a bundler editor
set -x BUNDLER_EDITOR vim
set -x SVN_EDITOR vim

# plugins
set fish_plugins theme peco

# Bind for peco history to Ctrl+r
function fish_user_key_bindings
  bind \cr peco_select_history
end

# Balias
balias rr 'rake routes'
balias rs 'rails s'
balias rt 'rails t'
balias rc 'rails c'
balias g 'git'
balias gb 'git branch'
balias ga 'git add'
balias gc 'git commit'
balias gco 'git checkout'
balias gd 'git diff'
balias gs 'git status'
balias v 'vagrant'

# rbenv setting
status --is-interactive; and source (rbenv init -|psub)

# nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH

# vim
set -x PATH /usr/local/bin $PATH

# others
ulimit -n 9480
