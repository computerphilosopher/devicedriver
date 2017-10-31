set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

let $HOME=$VIM
let $USB=$VIM.'\..' 
let $PATH=$HOME.'\MinGW\msys\1.0\bin'

let $Git=$VIM.'\git'
let $TEMP='C:\Temp'
let $TMP=$TEMP

set shell=$HOME\MinGW\msys\1.0\bin\bash
set shellcmdflag=-ic

"set shell=$Git/git-cmd


behave mswin

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
        let cmd = '""' . $VIMRUNTIME . '\diff"'
        let eq = '"'
      else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

syntax on

set noundofile
set nobackup
set nu
set relativenumber
set autoindent
set smartindent
set autochdir


cnoreabbrev W w
cnoreabbrev Wq wq


"set expandtab
set tabstop=4 shiftwidth=4 softtabstop=4
    

nmap <CR> o<ESC>
inoremap jk <ESC>

nnoremap <a-l> :NERDTreeToggle <CR>

map <F5> :!gcc % -o %<.exe<CR> :!%<.exe<CR>


set rtp+=$HOME\.vim\bundle\Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kana/vim-arpeggio'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/supertab'


call vundle#end()

colorscheme molokai



set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_shell_slash = 1
let g:syntastic_c_checkers = ['gcc']



filetype off " <<< this line
filetype plugin indent on


