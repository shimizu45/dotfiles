vim9script
plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'skanehira/preview-markdown.vim'
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'tpope/vim-surround'
Plug 'osyo-manga/vim-over'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'yggdroot/indentline'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'editorconfig/editorconfig-vim'
plug#end()

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
set re=0 # Typescript構文の強調表示が遅くて時々止まるので対策
set guifont=Fira\ Code\ Retina:h12
set cursorline
set clipboard+=unnamed
set noshowmode

g:vim_jsx_pretty_colorful_config = 1

g:lightline = {
    colorscheme: 'gruvbox',
    active: {
        left: [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
    }
}

# 色設定
hi NonText    ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE
hi SpecialKey ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE
hi SignColumn ctermbg=NONE
hi Pmenu ctermfg=White ctermbg=237
hi PmenuSel ctermfg=White ctermbg=233
hi CocFloating ctermfg=White ctermbg=237
hi CocErrorFloat ctermbg=Red
# 行の文字色 & 背景色
hi CursorLine cterm=NONE ctermbg=8
# 行番号
hi CursorLineNr cterm=NONE ctermbg=8

# preservim/nerdtree
# NERDTreeのボーダーを透過
set fillchars+=vert:│
# 隠しファイル表示
var NERDTreeShowHidden = 1
# デフォルトでツリーを表示
g:nerdtree_tabs_open_on_console_startup = 1
nnoremap <silent><C-e> :NERDTreeFocusToggle<CR>
# 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
# NERDTree表示切り替え
nnoremap <C-t> :NERDTreeToggle<CR>
# 前のタブに移動
nnoremap gr :tabprevious<CR>
# アイコン表示
g:webdevicons_enable_nerdtree = 1

# osyo-manga/vim-over
# 文字列をハイライト付きで置換
nnoremap <silent> ,m :OverCommandLine<CR>%s///g<Left><Left><Left>
# カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
# コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

# plasticboy/vim-markdown
# 折りたたみの禁止
g:vim_markdown_folding_disabled = 1
g:vim_markdown_auto_insert_bullets = 0
g:vim_markdown_new_list_item_indent = 0

# kannokanno/previm
autocmd BufRead,BufNewFile *.md set filetype=markdown
# 変数を空にするとopen-browserを使って開こうとしてくれる
g:previm_open_cmd = ''
# ctrl pでプレビュー
nnoremap <silent> <C-p> :PrevimOpen<CR>

# tyru/open-browser.vim
# gxでカーソル下の単語を検/URLを開く
g:netrw_nogx = 1 # disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

# tiagofumo/vim-nerdtree-syntax-highlight
# Highlight folders using exact match
g:NERDTreeHighlightFolders = 1 # enables folder icon highlighting usingexact match
g:NERDTreeHighlightFoldersFullName = 1 # highlights the folder name
# Disable uncommon file extensions highlighting
g:NERDTreeLimitedSyntax = 1

# yggdroot/indentline
g:indentLine_char = '┆'
g:indentLine_concealcursor = ''
g:indentLine_bgcolor_term = "NONE"

#分割時のライン
hi VertSplit cterm=NONE
hi StatusLine cterm=NONE
set fillchars+=vert:│

if filereadable(expand('~/.vimrc.coc'))
  source ~/.vimrc.coc
endif
