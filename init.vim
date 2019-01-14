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
" }

" Key mappings {
" > normal
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap / /\v\c
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

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
  call dein#add('Shougo/denite.nvim')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-endwise')
  call dein#add('Valloric/YouCompleteMe', {'merged': 0})
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
nnoremap <silent><C-e> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
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

" denite {
noremap <C-p> :Denite file/rec<CR>
noremap <C-b> :Denite buffer<CR>
" > keymaps
call denite#custom#map('insert', '<C-a>', '<Home>')
call denite#custom#map('insert', '<C-e>', '<End>')
call denite#custom#map('insert', '<C-f>', '<Right>')
call denite#custom#map('insert', '<C-b>', '<Left>')
call denite#custom#map('insert', '<C-d>', '<denite:delete_char_before_caret>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:delete_text_after_caret>', 'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-o>', '<denite:do_action:open>', 'noremap')
call denite#custom#map('insert', '<C-s>', '<denite:do_action:vsplit>', 'noremap')
" > ag saerch
call denite#custom#var('file/rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
  \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" }

" syntastic {
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_exec      = "~/.rbenv/shims/ruby" "~/.rbenv/shims/rubocop"
" }

" vim-airline {
let g:airline#extensions#tabline#enabled = 1
" }

" ctags {
nnoremap <C-c> :!ctags -R .<CR>
" }

" over 100 words highlights {
if exists('+colorcolumn')
  set colorcolumn=100
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif
" }
