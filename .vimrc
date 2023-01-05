vim9script
plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
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

# ---------------------------------------------
# 全般
# ---------------------------------------------
syntax enable # 構文ハイライト
set t_md= # 太字無効化
set nu # 行番号表示
set rnu # 相対的な行番号の表示
set ruler # カーソルの位置表示(画面右下)
set expandtab # タブをスペースに変換
set tabstop=4 # タブ文字をスペース4つにする
set shiftwidth=4 # インデントの幅をスペース4つにする
set ignorecase # 検索時の大小文字区別無効化
set smartcase # 小文字で検索した場合のみ大小文字区別無効化
set incsearch # インクリメンタルサーチ有効化
set laststatus=2 # 常にステータスラインを表示
set autoindent # 改行時にインデントをキープ
set list # 不可視文字を表示
set listchars=tab:»-,trail:-,nbsp:% # 不可視文字のフォーマット
set showcmd # 入力中のコマンドを表示
set nowrapscan # 検索時にファイル内のループを無効化
set re=0 # 正規表現エンジンの自動切替有効化
set guifont=Cica\ Retina # gvimでのフォント指定
set cursorline # カーソルライン表示
set clipboard=unnamedplus # クリップボードとヤンクレジスタの共有
set noshowmode # モード非表示(lightlineで表示)
set fillchars+=vert:│

# ---------------------------------------------
# 色
# ---------------------------------------------
hi VertSplit cterm=NONE
hi StatusLine cterm=NONE
hi NonText    ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE
hi SpecialKey ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE
hi SignColumn ctermbg=NONE
hi Pmenu ctermfg=White ctermbg=237
hi PmenuSel ctermfg=White ctermbg=233
hi CocFloating ctermfg=White ctermbg=237
hi CocErrorFloat ctermbg=Red

# ---------------------------------------------
# preservim/nerdtree
# ---------------------------------------------
# 隠しファイル表示
var NERDTreeShowHidden = 1
# デフォルトでツリーを表示
g:nerdtree_tabs_open_on_console_startup = 1
# アイコン表示
g:webdevicons_enable_nerdtree = 1
# 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
# NERDTreeにフォーカス
nnoremap <silent><C-e> :NERDTreeFocusToggle<CR>
# NERDTree表示切り替え
nnoremap <C-t> :NERDTreeToggle<CR>
# 前のタブに移動
nnoremap gr :tabprevious<CR>

# ---------------------------------------------
# osyo-manga/vim-over
# ---------------------------------------------
# 文字列をハイライト付きで置換
nnoremap <silent> ,m :OverCommandLine<CR>%s///g<Left><Left><Left>
# カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
# コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

# ---------------------------------------------
# maxmellon/vim-jsx-pretty
# ---------------------------------------------
g:vim_jsx_pretty_colorful_config = 1

# ---------------------------------------------
# plasticboy/vim-markdown
# ---------------------------------------------
# 折りたたみの禁止
g:vim_markdown_folding_disabled = 1
g:vim_markdown_auto_insert_bullets = 0
g:vim_markdown_new_list_item_indent = 0
g:vim_markdown_conceal = 0
g:vim_markdown_conceal_code_blocks = 0

# ---------------------------------------------
# kannokanno/previm
# ---------------------------------------------
autocmd BufRead,BufNewFile *.md set filetype=markdown
# 変数を空にするとopen-browserを使って開こうとしてくれる
g:previm_open_cmd = ''
# ctrl pでプレビュー
nnoremap <silent> <C-p> :PrevimOpen<CR>

# ---------------------------------------------
# tyru/open-browser.vim
# ---------------------------------------------
# gxでカーソル下の単語を検/URLを開く
g:netrw_nogx = 1 # disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

# ---------------------------------------------
# tiagofumo/vim-nerdtree-syntax-highlight
# ---------------------------------------------
# Highlight folders using exact match
g:NERDTreeHighlightFolders = 1 # enables folder icon highlighting usingexact match
g:NERDTreeHighlightFoldersFullName = 1 # highlights the folder name
# Disable uncommon file extensions highlighting
g:NERDTreeLimitedSyntax = 1

# ---------------------------------------------
# yggdroot/indentline
# ---------------------------------------------
g:lightline = {
    colorscheme: 'Tomorrow_Night_Eighties',
    active: {
        left: [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
    }
}
g:indentLine_char = '┆'
g:indentLine_concealcursor = ''
g:indentLine_bgcolor_term = "NONE"

# ---------------------------------------------
# 別ファイル読み込み
# ---------------------------------------------
if filereadable(expand('~/.vimrc.coc'))
  source ~/.vimrc.coc
endif
