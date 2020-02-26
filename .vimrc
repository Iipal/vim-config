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

"Saving last position at any file
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"Setup /usr/include ctags
set tags+=~/.vim/tags

"CtrlP plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_working_path_mode='raw'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 0

"vim-plug plugins
call plug#begin('~/.vim/plugged')

Plug 'terryma/vim-multiple-cursors'
Plug 'maralla/completor.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'

call plug#end()

"Setting-up a completor plugin
" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
    return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

inoremap <expr> <Tab> Tab_Or_Complete()

noremap <silent> <leader>d :call completor#do('definition')<CR>
noremap <silent> <leader>c :call completor#do('doc')<CR>
noremap <silent> <leader>f :call completor#do('format')<CR>
noremap <silent> <leader>s :call completor#do('hover')<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"Setting-up a auto-pairs plugin
let g:AutoPairsFlyMode = 1

"Setting-up a gruvbox theme
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" For all files set 'textwidth' to 78 characters.
set textwidth=80
