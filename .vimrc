syntax on

"Disabling highlighting search
set nohlsearch

"Enabling realative line number indexing
set rnu nu
set numberwidth=3

"Indentation setting
set noet sts=0 sw=4 ts=4
set cindent
set cinoptions=(0,u1,U0,l1

"Rendering whitespaces as visible characters
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
set list

"CtrlP extension
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_working_path_mode='raw'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 0

"Saving last position at any file
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"vim-plug plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

call plug#end()

"Setting-up a gruvbox theme
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"Ctags setup
set tags+=~/.vim/tags

"Keybindings
"
"Ctags:
"Ctrl-\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" For all files set 'textwidth' to 78 characters.
set textwidth=80

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
