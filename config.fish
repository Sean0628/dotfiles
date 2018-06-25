# Set vim as a bundler editor
set -x BUNDLER_EDITOR vim

set fish_plugins theme peco
ulimit -n 9480

# Bind for peco history to Ctrl+r
function fish_user_key_bindings
  bind \cr peco_select_history
end

# Balias
balias rr 'rake routes'
balias rs 'rails s'
balias rt 'rails t'
balias rc 'rails c'
balias cd... 'cd ../..'
balias gb 'git branch'
balias ga 'git add'
balias gc 'git commit'
balias gco 'git checkout'
balias gd 'git diff'
balias gs 'git status'
