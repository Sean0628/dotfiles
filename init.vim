" Basic {
set number
set scrolloff=3
set hlsearch
set ruler
set noswapfile
set smartindent
set smarttab
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:•
set clipboard+=unnamed
set history=200
set ts=2 sw=2 et

let mapleader = "\<Space>"
" }

" Key mappings {
" > normal
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap / /\v\c
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <Leader>r :Rg<Space>
nnoremap <Leader>w :w<CR>
nmap <Leader>g [git]
nnoremap <silent> [git]b :Gblame<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <Leader>m :CtrlPMRUFiles<CR>
nnoremap <C-c> :!ctags -R .<CR>

" > input
inoremap <silent> jj <ESC>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
" }

" dein {
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  " plugins {
  call dein#add('rakr/vim-one')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-endwise')
  call dein#add('Valloric/YouCompleteMe', {'merged': 0})
  call dein#add('dense-analysis/ale')
  call dein#add('mattn/emmet-vim')
  call dein#add('jremmen/vim-ripgrep')
  call dein#add('mxw/vim-jsx')
  call dein#add('pangloss/vim-javascript')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('rust-lang/rust.vim')
" }
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
" }

" POD {
if has('syntax')
  syntax on

  syn sync fromstart

  function! ActivateInvisibleIndicator()
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Red guibg=darkgray gui=underline
    "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
    "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
    "syntax match InvisibleTab "\t" display containedin=ALL
    "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
  endfunction

  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif
" }

" nerdtree {
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md',     'Magenta', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('php',    'blue',    'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('js',     'blue',    'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ts',     'blue',    'none', 'green',   '#151515')
call NERDTreeHighlightFile('svelte', 'blue',    'none', 'green',   '#151515')
call NERDTreeHighlightFile('vue',    'green',   'none', 'green',   '#151515')
call NERDTreeHighlightFile('jsx',    'green',   'none', 'green',   '#151515')
call NERDTreeHighlightFile('rs',     'green',   'none', 'green',   '#151515')
" }

" vim-one {
let g:airline_theme='one'
colorscheme one
set background=dark
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum
" }

" background {
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
" }

" over 100 words highlights {
if exists('+colorcolumn')
  set colorcolumn=100
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif
" }

" ale {
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <Leader>f :ALEFix<CR>
  let g:ale_fixers = {
  \   'javascript': [
  \       'prettier',
  \   ],
  \   'typescript': [
  \       'prettier',
  \   ],
  \   'yaml': [
  \       'prettier',
  \   ],
  \   'ruby': [
  \       'rubocop',
  \   ],
  \}
  let g:ale_ruby_rubocop_options = ['--force-exclusion']
  let g:ale_linters = {'javascript': ['eslint'], 'javascript.jsx': ['eslint'], 'c++': ['g++'] }

  let g:ale_fix_on_save = 1
  let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
  let g:ale_ruby_rubocop_options = '-D'
  let g:ale_lint_on_text_changed = 'always'
  let g:ale_open_list = 0
  " You can disable this option too
  " if you don't want linters to run on opening a file
  let g:ale_lint_on_enter = 0

  let g:ale_cpp_clang_options = '-std=c++17 -I./src'
  let g:ale_cpp_gcc_options = '-std=c++17 -I./src'

  function! ToggleFixOnSave()
    let g:ale_fix_on_save = !g:ale_fix_on_save
    if g:ale_fix_on_save == 1
      echo 'fix_on_save is ON'
    else
      echo 'fix_on_save is OFF'
    endif
  endfunction

  nmap <silent> <Leader>a :call ToggleFixOnSave()<CR>" }
" }

" ctrlp.vim {
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom, order:ttb, min:1m max:40'
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_mruf_relative = 1

if executable('rg')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'rg --files %s'
elseif executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif
" }

" vim-javascript {
let g:javascript_plugin_flow = 1
" }
