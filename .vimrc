 " vimrc

 "------------------------------------------------------------
 " Init
 "------------------------------------------------------------

 " Vi互換モードをオフ（Vimの拡張機能を有効）
 set nocompatible

 " ファイルタイプ自動識別OFF
 filetype off
 filetype indent plugin off

 " keymap prefix
 let g:mapleader = "\<Space>"

 " 色づけをオン
 syntax enable

 "------------------------------------------------------------
 " File
 "------------------------------------------------------------

" エンコード
set encoding=utf8
" ファイルエンコード
set fileencoding=utf-8

" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" undoファイルを作らない
set noundofile

 " バッファを保存しなくても他のバッファを表示できるようにする
 set hidden
 " バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
 " かどうか確認を求める
 set confirm
 " 外部のエディタで編集中のファイルが変更されたら、自動的に読み直す
 " ファイルが削除された場合は読み直さない
 set autoread

 "------------------------------------------------------------
 " Move
 "------------------------------------------------------------

 " スクロールする時に下が見えるようにする
 set scrolloff=5

 " 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
 set hlsearch

 " 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
 " 混在しているときは区別する
 set ignorecase
 set smartcase

 " 移動コマンドを使ったとき、行頭に移動しない
 set nostartofline

 " バックスペースで各種消せるようにする
 set backspace=indent,eol,start


 "------------------------------------------------------------
 " Display
 "------------------------------------------------------------

 " タイプ途中のコマンドを画面最下行に表示
 set showcmd

 " コマンドライン補完を便利に
 set wildmenu

 " 画面最下行にルーラーを表示する
 set ruler

 " ステータスラインを常に表示する
 set laststatus=2

 " ステータスラインの表示フォーマット
 " set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

 " ビープの代わりにビジュアルベル（画面フラッシュ）を使う
 set visualbell

 " そしてビジュアルベルも無効化する
 set t_vb=

 " 全モードでマウスを有効化
 set mouse=a

 " コマンドラインの高さを2行に
 set cmdheight=2

 " 行番号を表示
 set number

 " スペース・改行を可視化
 set list
 " tab:タブ文字, trail:行末に続くスペース, eol: 改行文字, extends:右を省略,
 " precedes: 左を省略, nbsp:不可視のスペース(&nbsp;)
 set listchars=tab:»-,trail:.,extends:»,precedes:«,nbsp:%

 " 全角スペース強調
 augroup highlightDoubleByteSpace
  autocmd!
  autocmd VimEnter,Colorscheme * highlight DoubleByteSpace term=underline ctermbg=LightMagenta guibg=LightMagenta
  autocmd VimEnter,WinEnter,BufRead * match DoubleByteSpace /　/
 augroup END

 " キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
 set notimeout ttimeout ttimeoutlen=200

 " 括弧を入力したときに対応する括弧を確認する
 set showmatch
 set matchtime=1

 " color
 if !has('gui_running')
   set t_Co=256
 endif

 " 全角の記号を正しく表示する
 set ambiwidth=double

 " カレント行ハイライト
 set cursorline
 " アンダーラインを引く(color terminal)
 highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
 " アンダーラインを引く(gui)
 highlight CursorLine gui=underline guifg=NONE guibg=NONE

 "------------------------------------------------------------
 " Indentation
 "------------------------------------------------------------

 " オートインデント
 set autoindent

 " TABをスペースに置換する
 set expandtab
 " 既存のTAB文字をスペース何文字として表示するか
 set tabstop=2
 " TABの入力時に置換されるスペースの数
 set softtabstop=2
 " インデント時に挿入されるスペースの数
 set shiftwidth=2

 set formatoptions-=or

 "------------------------------------------------------------
 " Mappings
 "------------------------------------------------------------

 " Yの動作をDやCと同じにする
 map Y y$

 " edit vimrc
 nnoremap <Leader>. :<C-u>edit $HOME/.vimrc<CR>
 " reload vimrc
 nnoremap <Leader>s. :<C-u>source $HOME/.vimrc<CR>

 " 直前のファイルを開く
 nnoremap <Leader>h :<C-u>b<Space>#<CR>

 " insertモードを抜ける
 nnoremap <C-j> <Nop>
 inoremap <silent> <C-j> <ESC>
 inoremap <silent> jj <ESC>

 " 挿入モードでのカーソル移動
 inoremap <C-a> <Home>
 inoremap <C-e> <End>
 inoremap <C-d> <Del>

 " 検索時の正規表現で特殊文字をエスケープせずに使う
 nnoremap / /\v

 " 行頭・行末移動方向をキーの相対位置にあわせる
 nnoremap 0 $
 nnoremap 1 0

 " vを二回で行末まで選択
 vnoremap v $h

 " 押しづらいキーを変換
 nnoremap <Leader>/ *

 " 検索結果のハイライトをEsc連打でクリアする
 nnoremap <ESC><ESC> :nohlsearch<CR>

 " クリップボードにコピー
 vnoremap gy "*y
 " クリップボードから書式を無視してペースト
 nnoremap gp :<C-u>a!<CR>

 " Visualモードで数値インクリメント
 vnoremap <c-a> <c-a>gv
 vnoremap <c-x> <c-x>gv

 " コロンセミコロン入れ替え (for US)
 noremap ; :
 noremap : ;

 " s keymap
 nnoremap s <Nop>
 " カーソルを別のウィンドウに移動
 nnoremap sj <C-w>j
 nnoremap sk <C-w>k
 nnoremap sl <C-w>l
 nnoremap sh <C-w>h
 "" カーソルを次のウィンドウに移動
 nnoremap sw <C-w>w
 " ウィンドウを移動
 nnoremap sJ <C-w>J
 nnoremap sK <C-w>K
 nnoremap sL <C-w>L
 nnoremap sH <C-w>H
 "" ウィンドウを回転
 nnoremap sr <C-w>r
 " 新規タブ
 nnoremap st :<C-u>tabnew<CR>
 " タブ切り替え
 nnoremap sn gt
 nnoremap sp gT
 " ウィンドウの大きさを揃える
 nnoremap s= <C-w>=
 nnoremap sO <C-w>=
 " カレントウィンドウを最大化
 nnoremap so <C-w>_<C-w>|
 " バッファ切り替え
 nnoremap sN :<C-u>bn<CR>
 nnoremap sP :<C-u>bp<CR>
 " ウィンドウ分割
 nnoremap ss :<C-u>sp<CR>
 nnoremap sv :<C-u>vs<CR>
 " 閉じる
 nnoremap sq :<C-u>q<CR>
 nnoremap sQ :<C-u>bd<CR>


 "------------------------------------------------------------
 " ファイルタイプごとの対応
 "------------------------------------------------------------

 " PHP
 augroup PHP
   autocmd!
   " 辞書
   autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
 augroup END

 " Ruby
 au FileType ruby,eruby setl tags+=~/gtags

 " markdown
 au BufRead,BufNewFile *.md set filetype=markdown
 au BufRead,BufNewFile *.txt set filetype=markdown


 "------------------------------------------------------------
 " 自作コマンド
 "------------------------------------------------------------
 " 拡張子付きの一時ファイル
 command! -nargs=1 -complete=filetype Tmp edit ~/.vim_tmp/tmp.<args>


 "------------------------------------------------------------
 " Plugins
 "------------------------------------------------------------

 " プラグインがインストールされるディレクトリ
 let s:dein_dir = expand('~/.cache/dein')
 " dein.vim
 let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
 
 " dein.vim がなければ GitHub から落としてくる
 if &runtimepath !~# '/dein.vim'
   if !isdirectory(s:dein_repo_dir)
     execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
   endif
   execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
 endif

 " プラグイン読み込み＆キャッシュ作成
 let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
 if dein#load_state(s:dein_dir)
   call dein#begin(s:dein_dir)
   call dein#load_toml(s:toml_file)
   call dein#end()
   call dein#save_state()
 endif

 " 未インストールのプラグインがあればインストール
 if has('vim_starting') && dein#check_install()
   call dein#install()
 endif


 "------------------------------------------------------------
 " 環境ごとの設定読み込み
 "------------------------------------------------------------
 if filereadable(expand('~/.vimrc.local'))
   source ~/.vimrc.local
 endif


 "------------------------------------------------------------
 " Final
 "------------------------------------------------------------

 " ファイルタイプ自動識別ON
 filetype indent plugin on

