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

 " バッファを保存しなくても他のバッファを表示できるようにする
 set hidden
 " バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
 " かどうか確認を求める
 set confirm

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
 " Yank
 "------------------------------------------------------------

 " 'paste'と'nopaste'を切り替える
 "set pastetoggle=<C-P>

 " ヤンクしたときにクリップボードにコピー
 "set clipboard=unnamed,autoselect

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
 "inoremap <silent> jj <ESC>
 "inoremap <silent> <C-j> j
 nnoremap <C-j> <Nop>
 inoremap <silent> <C-j> <ESC>

 " 挿入モードでのカーソル移動
 "inoremap <C-j> <Down>
 "inoremap <C-k> <Up>
 "inoremap <C-h> <Left>
 "inoremap <C-l> <Right>
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

 " 自動的に閉じ括弧
 "imap { {}<Left>
 "imap [ []<Left>
 "imap ( ()<Left>

 " クリップボードにコピー
 vnoremap gy "*y
 " クリップボードから書式を無視してペースト
 nnoremap gp :<C-u>a!<CR>

 " タブ移動に使うkeymapを空けておく
 " noremap <C-q> <Nop>
 " noremap! <C-q> <Nop>
 " noremap <C-w> <Nop>
 " noremap! <C-w> <Nop>
 
 "------------------------------------------------------------
 " ファイルタイプごとの対応
 "------------------------------------------------------------

 " PHP
 augroup PHP
   autocmd!
   " 辞書
   autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
   " syntax check
   "autocmd FileType php set makeprg=php\ -l\ %
   "autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
 augroup END


 "------------------------------------------------------------
 " 自作コマンド
 "------------------------------------------------------------
 " 拡張子付きの一時ファイル
 command! -nargs=1 -complete=filetype Tmp edit ~/.vim_tmp/tmp.<args>


 "------------------------------------------------------------
 " Plugins
 "------------------------------------------------------------

 " NeoBundle がインストールされていない時、
 " もしくは、プラグインの初期化に失敗した時の処理
 function! s:WithoutBundles()
   colorscheme desert
 endfunction

 " NeoBundle によるプラグインのロードと各プラグインの初期化
 function! s:LoadBundles()
   "----------------------------
   " 読み込むプラグインの指定
   "----------------------------

   """ Base
   NeoBundle 'Shougo/neobundle.vim'
   NeoBundle 'Shougo/vimproc.vim', {
   \ 'build' : {
   \     'windows' : 'make -f make_mingw32.mak',
   \     'cygwin' : 'make -f make_cygwin.mak',
   \     'mac' : 'make -f make_mac.mak',
   \     'unix' : 'make -f make_unix.mak',
   \    },
   \ }
   NeoBundle 'Shougo/vimfiler.vim'
   NeoBundle 'Shougo/vimshell.vim'

   """ 補完
   NeoBundle 'Shougo/neocomplete.vim'

   """ スニペット
   NeoBundle 'Shougo/neosnippet'
   NeoBundle 'Shougo/neosnippet-snippets'

   """ Utility
   " テキストオブジェクトを囲む/削除する
   NeoBundle 'tpope/vim-surround'
   " fで日本語ヨミ検索 & f連打で次の候補
   NeoBundle 'rhysd/clever-f.vim'
   " 単語移動をスマートに
   NeoBundle 'kana/vim-smartword.git'
   " 「:Alignta <Delimiter>」 で整列
   NeoBundle 'h1mesuke/vim-alignta'

   """ Unite
   NeoBundle 'Shougo/unite.vim'
   NeoBundle 'Shougo/neomru.vim'

   """ Display
   NeoBundle 'itchyny/lightline.vim'
   NeoBundle 'Yggdroot/indentLine'
   "NeoBundle 'altercation/vim-colors-solarized'
   "NeoBundle 'tomasr/molokai'
   NeoBundle 'w0ng/vim-hybrid'

   """ qfixhowm
   NeoBundle 'fuenor/qfixhowm'
   NeoBundle 'osyo-manga/unite-qfixhowm'

   """ Coding
   NeoBundle 'Townk/vim-autoclose'
   NeoBundle 'thinca/vim-quickrun'
   " 保存時に静的解析
   NeoBundle 'scrooloose/syntastic'


   """ ファイルタイプ別
   " html
   NeoBundle 'mattn/emmet-vim'

   " coffee
   NeoBundle 'kchmck/vim-coffee-script'

   " ruby
   NeoBundle "slim-template/vim-slim"

   " scala
   NeoBundle "derekwyatt/vim-scala"

   NeoBundle 'marcus/rsense', {
   \ 'autoload': {
   \   'filetypes': 'ruby',
   \ },
   \ }
   NeoBundle 'supermomonga/neocomplete-rsense.vim', {
   \ 'depends': ['Shougo/neocomplete.vim', 'marcus/rsense'],
   \ }

   " Markdown
   NeoBundle 'plasticboy/vim-markdown'
   NeoBundle 'kannokanno/previm'
   NeoBundle 'tyru/open-browser.vim'

   """ Test
   " ドキュメント参照
   NeoBundle 'thinca/vim-ref'
   NeoBundle 'yuku-t/vim-ref-ri'
   " メソッド定義元へのジャンプ
   NeoBundle 'szw/vim-tags'


   "----------------------------
   " 読み込んだプラグインの設定
   "----------------------------

   """ neocomplete
   " 起動時に有効化
   let g:neocomplete#enable_at_startup = 1
   let g:neocomplete#enable_ignore_case = 1
   " 大文字が入力されるまで大文字小文字の区別を無視する
   let g:neocomplete#enable_smart_case = 1
   " 日本語入力時に無効化
   let g:neocomplete#lock_iminsert = 1
   " 収集するキーワードパターン
   if !exists('g:neocomplete#keyword_patterns')
       let g:neocomplete#keyword_patterns = {}
   endif
   let g:neocomplete#keyword_patterns._ = '\h\w*'
   " 辞書
   if !exists('g:neocomplete#sources#dictionary#dictionaries')
     let g:neocomplete#sources#dictionary#dictionaries = {}
   endif
   let dict = g:neocomplete#sources#dictionary#dictionaries
   " 補完ポップアップを閉じる
   inoremap <expr><C-e>  pumvisible() ? neocomplete#close_popup() : "<End>"


   """ neosnippet
   " Plugin key-mappings.
   imap <C-k>     <Plug>(neosnippet_expand_or_jump)
   smap <C-k>     <Plug>(neosnippet_expand_or_jump)

   imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
   smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

   " For snippet_complete marker.
   if has('conceal')
     set conceallevel=2 concealcursor=i
   endif

   """ unite.vim
   " start insert mode
   let g:unite_enable_start_insert=1
   let g:unite_source_file_mru_limit = 200
   " unite prefix key
   nnoremap [unite] <Nop>
   nmap <Leader>f [unite]
   " mappings
   nnoremap [unite]l :<C-u>Unite<Space>buffer<CR>
   nnoremap [unite]f :<C-u>Unite<Space>file<CR>
   nnoremap [unite]m :<C-u>Unite<Space>file_mru<CR>
   "nnoremap [unite]a :<C-u>Unite buffer file file_mru bookmark<CR>
   nnoremap [unite]r :<C-u>Unite<Space>register<CR>
   "nnoremap [unite]R :<C-u>UniteResume<CR>
   nnoremap [unite]b :<C-u>Unite bookmark<CR>

   " プロジェクト下のファイル検索
   nnoremap <silent> <C-p> :<C-u>Unite<Space>file_rec/async:!<CR>
   " ファイル一覧をキャッシュするファイル数の最小値・最大値
   let g:unite_source_rec_min_cache_files = 100
   let g:unite_source_rec_max_cache_files = 1000
   " 画像を検索しない
   call unite#custom#source('file_rec/async', 'ignore_pattern', '\(png\|gif\|jpeg\|jpg\)$')

   " 最近開いたファイルを検索
   " C-mがautocloseと競合するため一時コメントアウト
   "nnoremap <silent> <C-m> :<C-u>Unite<Space>file_mru<CR>

   "unite.vimを開いている間のキーマッピング
   autocmd FileType unite call s:unite_my_settings()
   function! s:unite_my_settings()"{{{
       " ESCでuniteを終了
       nmap <buffer> <ESC> <Plug>(unite_exit)
   endfunction"}}}

   " agでgrep検索
   nnoremap [unite]g :<C-u>Unite<Space>grep:. -buffer-name=search-buffer<CR>
   nnoremap <silent> <C-f> :<C-u>Unite<Space>grep:. -buffer-name=search-buffer<CR>

   " unite grep に ag(The Silver Searcher) を使う
   if executable('ag')
     let g:unite_source_grep_command = 'ag'
     let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
     let g:unite_source_grep_recursive_opt = ''
   endif

   """ color scheme - solarized
   "set background=dark
   "colorscheme solarized

   """ color scheme - molokai
   "set background=dark
   "colorscheme molokai

   """ color scheme - hybrid
   let g:hybrid_use_Xresources = 1
   set background=dark
   colorscheme hybrid

   """ vimfiler
   let g:vimfiler_as_default_explorer=1
   let g:vimfiler_safe_mode_by_default=0
   " mapping
   nnoremap <Leader>ee :<C-u>VimFiler<Space>-split<Space>-simple<Space>-winwidth=35<Space>-no-quit<CR>

   """ lightline
   let g:lightline = {
           \ 'colorscheme': 'jellybeans',
           \ 'mode_map': {'c': 'NORMAL'},
           \ 'active': {
           \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
           \ },
           \ 'component_function': {
           \   'modified': 'MyModified',
           \   'readonly': 'MyReadonly',
           \   'fugitive': 'MyFugitive',
           \   'filename': 'MyFilename',
           \   'fileformat': 'MyFileformat',
           \   'filetype': 'MyFiletype',
           \   'fileencoding': 'MyFileencoding',
           \   'mode': 'MyMode'
           \ }
           \ }

   function! MyModified()
     return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
   endfunction

   function! MyReadonly()
     return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
   endfunction

   function! MyFilename()
     return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
           \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
           \  &ft == 'unite' ? unite#get_status_string() :
           \  &ft == 'vimshell' ? vimshell#get_status_string() :
           \ '' != expand('%') ? expand('%') : '[No Name]') .
           \ ('' != MyModified() ? ' ' . MyModified() : '')
   endfunction

   function! MyFugitive()
     try
       if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
         return fugitive#head()
       endif
     catch
     endtry
     return ''
   endfunction

   function! MyFileformat()
     return winwidth(0) > 70 ? &fileformat : ''
   endfunction

   function! MyFiletype()
     return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
   endfunction

   function! MyFileencoding()
     return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
   endfunction

   function! MyMode()
     return winwidth(0) > 60 ? lightline#mode() : ''
   endfunction


   """ emmet
   " lang
   let g:user_emmet_settings = {
         \   'lang' : 'ja'
         \ }
   " keymap
   let g:user_emmet_leader_key='<c-y>'

   """ QFixHowm
   "QFixHowmキーマップ
   let g:QFixHowm_Key = 'g'

   "メモファイルの保存先
   let g:howm_dir             = '~/var/storage/Dropbox/docs/howm'
   let g:howm_fileencoding    = 'utf-8'
   let g:howm_fileformat      = 'unix'

   let g:howm_filename          = 'memo_/%Y-%m-%d-%H%M%S.md'
   let g:QFixHowm_DiaryFile     = 'diary/%Y-%m-%d-000000.md'
   let g:QFixHowm_QuickMemoFile = "tmp__/0000-00-00-000000.md"


   " MRU保存先
   let g:QFixMRU_Filename     = '~/var/storage/Dropbox/docs/howm/.qfixmru'
   " MRU表示数
   let g:QFixMRU_Entries      = 30
   " MRUに登録しないファイル名(正規表現)
   let g:QFixMRU_IgnoreFile   = '000000.md'

   " メモの一覧表示
   " let g:QFixHowm_FileList = '**/????-??-??-?????0.howm'
   " let g:QFixHowm_TitleListCache = 0

   " QFixList表示でファイルへ移動したらウィンドウを閉じる
   let g:QFixHowm_ListCloseOnJump = 1

   " unite mappings
   "nnoremap [unite]m :<C-u>Unite<Space>qfixhowm/new<Space>qfixhowm<Space>-hide-source-names<CR>

   " markdown対応
   let g:QFixHowm_FileType = 'markdown'
   let g:QFixHowm_Title = '#'

   """ QickRun
   " <Leader>r で実行
   " すべてのtypeに適用するoption
   " ウィンドウ下部に出力
   " 出力がなければ自動で閉じる
   " vimprocで非同期実行
   let g:quickrun_config = {
   \   "_" : {
   \       "outputter/buffer/split" : ":botright",
   \       "outputter/buffer/close_on_empty" : 1,
   \       "runner" : "vimproc",
   \       "runner/vimproc/updatetime" : 10
   \   },
   \}

   """ smartword
   nmap w <Plug>(smartword-w)
   nmap b <Plug>(smartword-b)
   nmap e <Plug>(smartword-e)

   """ clever-f
   " 大文字を入力した場合のみ大文字小文字を区別する
   let g:clever_f_smart_case = 1
   let g:clever_f_use_migemo = 1

   """ rsense
   " オムニ補完を有効化
   let g:rsenseUseOmniFunc = 1

   if !exists('g:neocomplete#force_omni_input_patterns')
     let g:neocomplete#force_omni_input_patterns = {}
   endif
   let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

   """ syntastic
   " エラーをquickfixで表示
   let g:syntastic_auto_loc_list=1
   " ファイルを開いた時にチェック
   let g:syntastic_check_on_open = 1

   """ rubocop
   " syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
   " active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
   let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
   "let g:syntastic_ruby_checkers = ['rubocop']

   """ markdown
   au BufRead,BufNewFile *.md set filetype=markdown
   autocmd FileType markdown,mkd nnoremap <Leader>r :<C-u>PrevimOpen<CR>

   """ indentLine
   let g:indentLine_faster = 1

 endfunction

 " NeoBundle がインストールされているなら LoadBundles() を呼び出す
 " そうでないなら WithoutBundles() を呼び出す
 function! s:InitNeoBundle()
   if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
     filetype plugin indent off
     if has('vim_starting')
       set runtimepath+=~/.vim/bundle/neobundle.vim/
     endif
     try
       call neobundle#rc(expand('~/.vim/bundle/'))
       call s:LoadBundles()
     catch
       call s:WithoutBundles()
     endtry 
   else
     call s:WithoutBundles()
   endif

 endfunction

 call s:InitNeoBundle()


 "------------------------------------------------------------
 " Final
 "------------------------------------------------------------

 " ファイルタイプ自動識別ON
 filetype indent plugin on

