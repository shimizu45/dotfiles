syntax enable
set background=dark
set nu
set rnu
set ruler
set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase
set incsearch
set smartcase
set laststatus=2
set autoindent
set list

set nocompatible

colorscheme ron

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
call plug#end()

"文字の後ろに色をつけない"
hi Normal ctermbg=NONE

"Vimで表示させてる特殊文字に色設定"
hi NonText    ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE
hi SpecialKey ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE

hi SignColumn ctermbg=None
hi Pmenu ctermfg=White ctermbg=Black
hi PmenuSel ctermfg=Gray ctermbg=Black
hi CocFloating ctermfg=White ctermbg=Black
hi CocErrorFloat ctermbg=Red

nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap gr :tabprevious<CR>
