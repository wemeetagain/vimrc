set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" https://github.com/w0rp/ale
Plugin 'w0rp/ale'
" https://github.com/sirtaj/vim-openscad
Plugin 'sirtaj/vim-openscad'
" https://github.com/leafgarland/typescript-vim
Plugin 'leafgarland/typescript-vim'
" https://github.com/Quramy/tsuquyomi
Plugin 'Quramy/tsuquyomi'
" https://github.com/Shougo/vimproc.vim
Plugin 'Shougo/vimproc.vim'
" https://github.com/Valloric/YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
" https://github.com/altercation/vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'
" https://github.com/rstacruz/sparkup
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'
" https://github.com/jreybert/vimagit
Plugin 'jreybert/vimagit'
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Begin user config

" Misc

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

set nu
set hlsearch

" javascript/typescript

au BufNewFile,BufRead *.tsx set filetype=typescript
au BufNewFile,BufRead *.jsx set filetype=javascript
autocmd Filetype javascript setlocal sw=2 ts=2 sts=2
autocmd Filetype typescript setlocal sw=2 ts=2 sts=2

" autocomplete settings

if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" syntax highlighting

syntax enable

set background=dark
set term=xterm-256color
let g:solarized_termcolors=256
colorscheme solarized

"linter

let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'typescript': ['eslint']
 \ }

" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 0
