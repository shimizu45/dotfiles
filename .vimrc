call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'skanehira/preview-markdown.vim'
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'tpope/vim-surround'
Plug 'osyo-manga/vim-over'
call plug#end()

syntax enable
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
set showcmd
set nowrapscan
"Typescript構文の強調表示が遅くて時々止まるので対策
set re=0
set background=dark

au BufRead,BufNewFile *.md set filetype=markdown

"let g:lightline = {'colorscheme': 'default'}
let g:lightline = {
    \ 'colorscheme': 'ayu_dark',
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \ }
    \ }

function! LightlineFilename()
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
        return path[len(root)+1:]
    endif
    return expand('%')
endfunction

"Vimで表示させてる特殊文字に色設定"
hi NonText    ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE
hi SpecialKey ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE

"NERDTreeのボーダーを透過
set fillchars+=vert:\ 

hi SignColumn ctermbg=NONE
hi Pmenu ctermfg=White ctermbg=237
hi PmenuSel ctermfg=White ctermbg=233
hi CocFloating ctermfg=White ctermbg=237
hi CocErrorFloat ctermbg=Red

" NERDTree表示切り替え
nnoremap <C-t> :NERDTreeToggle<CR>

" 前のタブに移動
nnoremap gr :tabprevious<CR>

" over.vimの起動
nnoremap <silent> ,m :OverCommandLine<CR>%s///g<Left><Left><Left>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

"文字の後ろに色をつけない"
"hi Normal ctermbg=NONE
