set fish_plugins theme peco

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end
# balias>>>>>>>>>>>>>>>>>>>>>>>>>>
balias rr 'rake routes'
balias rs 'rails s'
balias rt 'rails t'
balias rc 'rails c'
balias cd... 'cd ../..'
balias g 'git'
