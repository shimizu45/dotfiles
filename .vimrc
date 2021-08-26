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
set background=dark
set re=0 " Typescript構文の強調表示が遅くて時々止まるので対策
set guifont=Fira\ Code\ Retina:h12
colorscheme ron

" tyru/open-browser.vim
" let g:lightline = {'colorscheme': 'default'}
let g:lightline = {
    \ 'colorscheme': 'wombat',
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

" 色設定"
hi NonText    ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE
hi SpecialKey ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE
hi SignColumn ctermbg=NONE
hi Pmenu ctermfg=White ctermbg=237
hi PmenuSel ctermfg=White ctermbg=233
hi CocFloating ctermfg=White ctermbg=237
hi CocErrorFloat ctermbg=Red

" preservim/nerdtree
" NERDTreeのボーダーを透過
set fillchars+=vert:\ 
" NERDTree表示切り替え
nnoremap <C-t> :NERDTreeToggle<CR>
" 前のタブに移動
nnoremap gr :tabprevious<CR>

" osyo-manga/vim-over
" 文字列をハイライト付きで置換
nnoremap <silent> ,m :OverCommandLine<CR>%s///g<Left><Left><Left>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" plasticboy/vim-markdown
" 折りたたみの禁止
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" kannokanno/previm
autocmd BufRead,BufNewFile *.md set filetype=markdown
" 変数を空にするとopen-browserを使って開こうとしてくれる
let g:previm_open_cmd = ''
" ctrl pでプレビュー
nnoremap <silent> <C-p> :PrevimOpen<CR>

" tyru/open-browser.vim
" gxでカーソル下の単語を検/URLを開く
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

set noshowmode
