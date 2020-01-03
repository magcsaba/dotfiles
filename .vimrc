set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'gregsexton/gitv'
    Plug 'https://github.com/martinda/Jenkinsfile-vim-syntax.git'
    Plug 'https://github.com/peterhoeg/vim-qml.git'
call plug#end()

filetype off

" File type, indentation and syntax highlight
filetype plugin indent on
syntax on 
set tabstop=4
set shiftwidth=4
set expandtab
set number relativenumber
set colorcolumn=80
set autoindent
set hlsearch
set incsearch
set clipboard=unnamed
set listchars=tab:⟶\ ,trail:·,space:·
colorscheme desert

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Key mappings
inoremap {} {}<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
inoremap {;<CR> {<CR>};<Esc>ko
inoremap ( ()<Esc>i
inoremap () ()<Esc>i
inoremap (); ();<Esc>hi
inoremap ();<CR> ();<CR>
inoremap {}; {<CR>};<Esc>ko
inoremap " ""<Esc>i
inoremap "" ""<Esc>i

" C/C++ indent option
set cinoptions=g0

" Status line
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
  
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set laststatus=2
set statusline=
set statusline+=%0*
set statusline+=%f
set statusline+=\ %m
"set statusline+=%4*
set statusline+=%=
set statusline+=%l\/%L\ :\ %c
set statusline+=\ [%p%%]
set statusline+=%0*
set statusline+=%{StatuslineGit()}


   
