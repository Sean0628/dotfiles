# Set vim as a bundler editor
set -x BUNDLER_EDITOR vim

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
balias cd... 'cd ../..'
balias g 'git'
