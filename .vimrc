syntax enable
let g:solarized_termtrans=1
set background=dark
set number
set ruler
set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase
set incsearch
set smartcase
set laststatus=2
set autoindent

set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
        call neobundle#begin(expand('~/.vim/bundle/'))
        NeoBundleFetch 'Shougo/neobundle.vim'
        endif

        "insert here your Neobundle plugins"

        NeoBundle 'scrooloose/nerdtree'
        NeoBundle 'altercation/vim-colors-solarized'
        NeoBundle 'itchyny/lightline.vim'
        NeoBundle 'ayu-theme/ayu-vim'
        call neobundle#end()

        filetype plugin indent on


colorscheme ron

"文字の後ろに色をつけない"
hi Normal ctermbg=NONE

nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap gr :tabprevious<CR>


