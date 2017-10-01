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
 nnoremap sj <C-w>j
 nnoremap sk <C-w>k
 nnoremap sl <C-w>l
 nnoremap sh <C-w>h
 nnoremap sJ <C-w>J
 nnoremap sK <C-w>K
 nnoremap sL <C-w>L
 nnoremap sH <C-w>H
 nnoremap sn gt
 nnoremap sp gT
 nnoremap sr <C-w>r
 nnoremap s= <C-w>=
 nnoremap sw <C-w>w
 nnoremap so <C-w>_<C-w>|
 nnoremap sO <C-w>=
 nnoremap sN :<C-u>bn<CR>
 nnoremap sP :<C-u>bp<CR>
 nnoremap st :<C-u>tabnew<CR>
 nnoremap ss :<C-u>sp<CR>
 nnoremap sv :<C-u>vs<CR>
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
   call neobundle#begin(expand('~/.vim/bundle/'))

   """ Base
   NeoBundleFetch 'Shougo/neobundle.vim'
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
   " 自動保存
   NeoBundle 'vim-scripts/vim-auto-save'
   " カレントディレクトリを自動的にプロジェクトルートに設定
   NeoBundle 'airblade/vim-rooter'

   """ Unite
   NeoBundle 'Shougo/unite.vim'
   NeoBundle 'Shougo/neomru.vim'

   """ Display
   NeoBundle 'itchyny/lightline.vim'
   NeoBundle 'Yggdroot/indentLine'
   NeoBundle 'kana/vim-submode'
   NeoBundle 'w0ng/vim-hybrid'

   """ memolist
   NeoBundle 'fuenor/qfixgrep'
   NeoBundle 'glidenote/memolist.vim'

   """ Coding
   NeoBundle 'Townk/vim-autoclose'
   NeoBundle 'thinca/vim-quickrun'
   " 保存時に文法チェック
   " NeoBundle 'scrooloose/syntastic'
   NeoBundleLazy 'alpaca-tc/alpaca_tags', {
   \    'depends': ['Shougo/vimproc.vim'],
   \    'autoload' : {
   \       'commands' : [
   \          { 'name' : 'AlpacaTagsBundle', 'complete': 'customlist,alpaca_tags#complete_source' },
   \          { 'name' : 'AlpacaTagsUpdate', 'complete': 'customlist,alpaca_tags#complete_source' },
   \          'AlpacaTagsSet', 'AlpacaTagsCleanCache', 'AlpacaTagsEnable', 'AlpacaTagsDisable', 'AlpacaTagsKillProcess', 'AlpacaTagsProcessStatus',
   \       ],
   \    }
   \ }

   """ ファイルタイプ別
   " html
   NeoBundle 'mattn/emmet-vim'

   " coffee
   NeoBundle 'kchmck/vim-coffee-script'

   " ruby
   NeoBundle 'slim-template/vim-slim'
   NeoBundle 'tpope/vim-rails'
   NeoBundle 'basyura/unite-rails'
   NeoBundle 'tpope/vim-endwise'

   NeoBundle 'marcus/rsense', {
   \ 'autoload': {
   \   'filetypes': 'ruby',
   \ },
   \ }
   NeoBundle 'supermomonga/neocomplete-rsense.vim', {
   \ 'depends': ['Shougo/neocomplete.vim', 'marcus/rsense'],
   \ }

   " scala
   NeoBundle "derekwyatt/vim-scala"

   " Markdown
   NeoBundle 'kannokanno/previm'
   NeoBundle 'tyru/open-browser.vim'

   " JSON
   NeoBundle 'elzr/vim-json'

   """ Test
   " ドキュメント参照
   NeoBundle 'thinca/vim-ref'
   NeoBundle 'yuku-t/vim-ref-ri'
   " メソッド定義元へのジャンプ
   NeoBundle 'szw/vim-tags'

   call neobundle#end()

   "----------------------------
   " 読み込んだプラグインの設定
   "----------------------------

   """ neocomplete
   " 起動時に有効化
   let g:neocomplete#enable_at_startup = 0
   let g:neocomplete#enable_ignore_case = 1
   " 大文字が入力されるまで大文字小文字の区別を無視する
   let g:neocomplete#enable_smart_case = 1
   " 日本語入力時に無効化
   let g:neocomplete#lock_iminsert = 1
   " 最小補完文字数
   " let g:neocomplete#min_keyword_length = 5
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

   " mapping
   nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
   nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
   nnoremap sm :<C-u>Unite<Space>file_mru<CR>
   nnoremap sf :<C-u>Unite<Space>file_rec/async:!<CR>

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
       nmap <buffer> <C-j> <Plug>(unite_exit)
   endfunction"}}}

   " agでgrep検索
   nnoremap <silent> <C-f> :<C-u>Unite<Space>grep:. -buffer-name=search-buffer<CR>

   " unite grep に ag(The Silver Searcher) を使う
   if executable('ag')
     let g:unite_source_grep_command = 'ag'
     let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
     let g:unite_source_grep_recursive_opt = ''
   endif

   """ color scheme - hybrid
   let g:hybrid_use_Xresources = 1
   set background=dark
   colorscheme hybrid

   """ vimfiler
   let g:vimfiler_as_default_explorer=1
   let g:vimfiler_safe_mode_by_default=0
   " mapping
   nnoremap <Leader>ee :<C-u>VimFiler<Space>-split<Space>-simple<Space>-winwidth=35<Space>-no-quit<CR>
   nnoremap se :<C-u>VimFilerBufferDir<Space>-simple<CR>

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
   " 保存時のチェックが重すぎるのでコメントアウト
   " let g:syntastic_enable_signs=1
   " エラーをquickfixで表示
   " let g:syntastic_auto_loc_list=1
   " ファイルを開いた時にチェック
   " let g:syntastic_check_on_open = 1

   " syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
   " active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
   " let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'javascript', 'coffee'] }
   " let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'javascript'] }

   """ rubocop
   " let g:syntastic_ruby_checkers = ['mri', 'rubocop']
   " let g:syntastic_ruby_checkers = ['mri']

   """ eslint (not bundle)
   " let g:syntastic_javascript_checkers = ['eslint']

   """ markdown
   au BufRead,BufNewFile *.md set filetype=markdown
   "autocmd FileType markdown, mkd nnoremap <Leader>r :<C-u>PrevimOpen<CR>

   " 見出しで折りたたまない
   let g:vim_markdown_folding_disabled=1

   """ indentLine
   let g:indentLine_faster = 1

   """ submode
   call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
   call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
   call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
   call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
   call submode#map('bufmove', 'n', '', '>', '<C-w>>')
   call submode#map('bufmove', 'n', '', '<', '<C-w><')
   call submode#map('bufmove', 'n', '', '+', '<C-w>+')
   call submode#map('bufmove', 'n', '', '-', '<C-w>-')

   """ alpaca tags
   let g:alpaca_tags#config = {
   \    '_' : '-R --sort=yes',
   \    'ruby': '--languages=+Ruby',
   \ }

   augroup AlpacaTags
     autocmd!
     if exists(':AlpacaTags')
       " autocmd BufWritePost Gemfile AlpacaTagsBundle
       autocmd BufEnter * AlpacaTagsSet
       " 保存と同時に更新
       " autocmd BufWritePost * AlpacaTagsUpdate
     endif
   augroup END

   """ auto-save
   let g:auto_save = 1
   let g:auto_save_in_insert_mode = 0
   "let g:auto_save_silent = 1
   " 保存する入力間隔
   let g:auto_save_no_updatetime = 1
   " updatetimeを設定すると以降のmapが効かなくなったのでコメントアウト
   "set updatetime = 3000
   
   """ rooter
   let g:rooter_use_lcd = 1
   let g:rooter_patterns = ['tags', '.git', '.git/', 'Gemfile', 'Makefile']
   " Automatically change the directory
   autocmd! BufEnter *.sh,*.rb,*.html,*.css,*.js :Rooter

   """ rails
   " util function
   function! s:current_git()
     return unite#util#path2project_directory(getcwd())
   endfunction
   function! s:detect_rails()
     let root_dir = s:current_git()
     return !empty(root_dir) && filereadable(root_dir . '/config/environments/development.rb')
   endfunction

   function! s:load_vim_rails()
     if s:detect_rails()
       let root_dir = s:current_git()
   
       silent doautocmd User Rails
   
       augroup DetectVimRails
         autocmd!
         autocmd BufNew,BufNewFile,BufRead * silent doautocmd User Rails
       augroup END
     endif
   endfunction

   let g:rails_default_file='config/database.yml'
   let g:rails_level = 4
   let g:rails_mappings=1
   let g:rails_modelines=0
   function! SetUpRailsSetting()
     nnoremap <buffer><Leader>r :R<CR>
     nnoremap <buffer><Leader>a :A<CR>
     nnoremap <buffer><Leader>m :Rmodel<Space>
     nnoremap <buffer><Leader>c :Rcontroller<Space>
     nnoremap <buffer><Leader>v :Rview<Space>
     nnoremap <buffer><Leader>p :Rpreview<CR>
   endfunction
   
   """ unite-rails
   function! UniteRailsSetting()
     nnoremap <buffer><C-H><C-H><C-H>  :<C-U>Unite rails/view<CR>
     nnoremap <buffer><C-H><C-H>       :<C-U>Unite rails/model<CR>
     nnoremap <buffer><C-H>            :<C-U>Unite rails/controller<CR>
     nnoremap <buffer><C-H>c           :<C-U>Unite rails/config<CR>
     nnoremap <buffer><C-H>s           :<C-U>Unite rails/spec<CR>
     nnoremap <buffer><C-H>m           :<C-U>Unite rails/db -input=migrate<CR>
     nnoremap <buffer><C-H>l           :<C-U>Unite rails/lib<CR>
     nnoremap <buffer><expr><C-H>g     ':e '.b:rails_root.'/Gemfile<CR>'
     nnoremap <buffer><expr><C-H>r     ':e '.b:rails_root.'/config/routes.rb<CR>'
     nnoremap <buffer><expr><C-H>se    ':e '.b:rails_root.'/db/seeds.rb<CR>'
     nnoremap <buffer><C-H>ra          :<C-U>Unite rails/rake<CR>
     nnoremap <buffer><C-H>h           :<C-U>Unite rails/heroku<CR>
   endfunction

   aug MyAutoCmd
     au User Rails call SetUpRailsSetting()
     au User Rails call UniteRailsSetting()
   aug END

   call s:load_vim_rails()

   """ open-browser
   let g:netrw_nogx = 1 " disable netrw's gx mapping.
   nmap gx <Plug>(openbrowser-smart-search)
   vmap gx <Plug>(openbrowser-smart-search)

   """ endwise
   "let g:endwise_no_mappings=1

   """ memolist
   function! MyMemoGrep()
     execute 'lcd' g:memolist_path
     execute 'Unite' 'grep:.' g:memolist_unite_option
   endfunction
   command! MyMemoGrep :call MyMemoGrep()

   let g:memolist_path = "~/docs/memo"
   let g:memolist_memo_suffix = "txt"
   let g:memolist_memo_date = "%Y-%m-%d %H:%M"
   let g:memolist_template_dir_path = '~/docs/templates/memo'

   let g:memolist_unite = 1
   let g:memolist_unite_source = "file_rec"
   let g:memolist_unite_option = "-auto-preview -start-insert -auto-resize"
   " メモ一覧を編集時刻順に表示
   call unite#custom_source('file_rec', 'sorters', ['sorter_ftime', 'sorter_reverse'])

   nnoremap mn :<C-u>MemoNew<CR>
   nnoremap ml :<C-u>MemoList<CR>
   nnoremap mg :<C-u>MyMemoGrep<CR>

   """ json
   let g:vim_json_syntax_conceal = 0

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

