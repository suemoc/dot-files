 " vimrc

 "------------------------------------------------------------
 " init
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
 " Must have options {{{1
 " 強く推奨するオプション
 "------------------------------------------------------------
 
 " バッファを保存しなくても他のバッファを表示できるようにする
 set hidden
 
 " コマンドライン補完を便利に
 set wildmenu
 
 " タイプ途中のコマンドを画面最下行に表示
 set showcmd
 
 " 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
 set hlsearch
 
 " 歴史的にモードラインはセキュリティ上の脆弱性になっていたので、
 " オフにして代わりに上記のsecuremodelinesスクリプトを使うとよい。
 " set nomodeline
 
 
 "------------------------------------------------------------
 " Usability options {{{1
 "------------------------------------------------------------
 
 " 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
 " 混在しているときは区別する
 set ignorecase
 set smartcase
 
 " オートインデント、改行、インサートモード開始直後にバックスペースキーで
 " 削除できるようにする。
 set backspace=indent,eol,start
 
 " オートインデント
 set autoindent
 
 " 移動コマンドを使ったとき、行頭に移動しない
 set nostartofline
 
 " 画面最下行にルーラーを表示する
 set ruler
 
 " ステータスラインを常に表示する
 set laststatus=2

 " ステータスラインの表示フォーマット
 " set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
 
 " バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
 " かどうか確認を求める
 set confirm
 
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
 set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

 " 全角スペース強調
 augroup highlightDoubleByteSpace
  autocmd!
  autocmd VimEnter,Colorscheme * highlight DoubleByteSpace term=underline ctermbg=LightMagenta guibg=LightMagenta
  autocmd VimEnter,WinEnter,BufRead * match DoubleByteSpace /　/
 augroup END
 
 " キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
 set notimeout ttimeout ttimeoutlen=200
 
 " 'paste'と'nopaste'を切り替える
 set pastetoggle=<C-P>
 
 " color
 if !has('gui_running')
   set t_Co=256
 endif

 " ヤンクしたときにクリップボードにコピー
 "set clipboard=unnamed,autoselect
 
 "------------------------------------------------------------
 " Indentation options {{{1
 " インデント関連のオプション {{{1
 "------------------------------------------------------------
 
 " TABをスペースに置換する
 set expandtab
 " 既存のTAB文字をスペース何文字として表示するか
 set tabstop=2
 " TABの入力時に置換されるスペースの数
 set softtabstop=2
 " インデント時に挿入されるスペースの数
 set shiftwidth=2
 
 "------------------------------------------------------------
 " Mappings {{{1
 " マッピング
 "------------------------------------------------------------
 
 " Yの動作をDやCと同じにする
 map Y y$
 
 " <C-L>で検索後の強調表示を解除する
 nnoremap <C-L> :nohl<CR><C-L>

 " edit vimrc
 nnoremap <Leader>. :<C-u>edit $HOME/.vimrc<CR>
 " reload vimrc
 nnoremap <Leader>s. :<C-u>source $HOME/.vimrc<CR>

 " 直前のファイルを開く
 nnoremap <Leader>h :<C-u>b<Space>#<CR>

 "------------------------------------------------------------
 " ファイルタイプごとの対応
 "------------------------------------------------------------

 " PHP
 autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict

 
 "------------------------------------------------------------
 " Plugins 
 "------------------------------------------------------------

 " NeoBundle がインストールされていない時、
 " もしくは、プラグインの初期化に失敗した時の処理
 function! s:WithoutBundles()
   colorscheme desert
 endfunction

 " NeoBundle よるプラグインのロードと各プラグインの初期化
 function! s:LoadBundles()
   " 読み込むプラグインの指定
   NeoBundle 'Shougo/neobundle.vim'
   NeoBundle 'Shougo/neocomplcache'
   NeoBundle 'Shougo/unite.vim'
   NeoBundle 'Shougo/neomru.vim'
   NeoBundle 'Shougo/vimproc.vim'
   NeoBundle 'Shougo/vimfiler.vim'
   NeoBundle 'Shougo/vimshell.vim'
   NeoBundle 'itchyny/lightline.vim'
   NeoBundle 'tpope/vim-surround'
   NeoBundle 'altercation/vim-colors-solarized'
   NeoBundle 'Townk/vim-autoclose'
   NeoBundle 'mattn/emmet-vim'
   NeoBundle 'fuenor/qfixhowm'
   NeoBundle "osyo-manga/unite-qfixhowm"
   NeoBundle "thinca/vim-quickrun"
   " ...
   " 読み込んだプラグインの設定
   " ...
 
 
   "" neocomplcache
   " 補完ウィンドウの設定
   set completeopt=menuone
  
   " 起動時に有効化
   let g:neocomplcache_enable_at_startup = 1
 
   " 大文字が入力されるまで大文字小文字の区別を無視する
   let g:neocomplcache_enable_smart_case = 1
 
   " _(アンダースコア)区切りの補完を有効化
   let g:neocomplcache_enable_underbar_completion = 1
 
   let g:neocomplcache_enable_camel_case_completion  =  1
 
   " ポップアップメニューで表示される候補の数
   let g:neocomplcache_max_list = 5

   " 最初の候補を自動選択
   let g:neocomplcache_enable_auto_select = 1
 
   " シンタックスをキャッシュするときの最小文字長
   let g:neocomplcache_min_syntax_length = 3
 
   " ディクショナリ定義
   let g:neocomplcache_dictionary_filetype_lists = {
         \ 'default' : '',
         \ 'php' : $HOME . '/.vim/dict/php.dict',
         \ 'ctp' : $HOME . '/.vim/dict/php.dict'
         \ }
 
   if !exists('g:neocomplcache_keyword_patterns')
     let g:neocomplcache_keyword_patterns = {}
   endif
   let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
 
   " スニペットを展開する。スニペットが関係しないところでは行末まで削除
   imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
   smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
 
   " 前回行われた補完をキャンセルします
   inoremap <expr><C-g> neocomplcache#undo_completion()
 
   " 補完候補のなかから、共通する部分を補完します
   inoremap <expr><C-l> neocomplcache#complete_common_string()
 
   " 改行で補完ウィンドウを閉じる
   inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
 
   "tabで補完候補の選択を行う
   inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
   inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
 
   " <C-h>や<BS>を押したときに確実にポップアップを削除します
   inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
 
   " 現在選択している候補を確定します
   inoremap <expr><C-y> neocomplcache#close_popup()
 
   " 現在選択している候補をキャンセルし、ポップアップを閉じます
   inoremap <expr><C-e> neocomplcache#cancel_popup()
 

   """ unite.vim
   " start insert mode
   let g:unite_enable_start_insert=1
   " unite prefix key
   nnoremap [unite] <Nop>
   nmap <Leader>f [unite]
   " mappings
   nnoremap [unite]b :<C-u>Unite<Space>buffer<CR>
   nnoremap [unite]f :<C-u>Unite<Space>file<CR>
   "nnoremap [unite]m :<C-u>Unite<Space>file_mru<CR>
   nnoremap [unite]a :<C-u>Unite buffer file file_mru bookmark<CR>
   nnoremap [unite]r :<C-u>Unite<Space>register<CR>
   nnoremap [unite]R :<C-u>UniteResume<CR>

   " agでgrep検索
   nnoremap [unite]g :<C-u>Unite<Space>grep:. -buffer-name=search-buffer<CR>

   " unite grep に ag(The Silver Searcher) を使う
   if executable('ag')
     let g:unite_source_grep_command = 'ag'
     let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
     let g:unite_source_grep_recursive_opt = ''
   endif
 
   """ solarized
   set background=dark
   colorscheme solarized
 
   """ vimfiler
   let g:vimfiler_as_default_explorer=1
   let g:vimfiler_safe_mode_by_default=0
   " mapping
   cnoremap ee <C-u>VimFiler<Space>-split<Space>-simple<Space>-winwidth=35<Space>-no-quit

   """ lightline
   let g:lightline = {
         \ 'colorscheme': 'solarized',
         \ }

   """ emmet
   " keymap
   let g:user_emmet_leader_key='<c-y>'
   "let g:user_emmet_leader_key=' e'

   """ QFixHowm
   "QFixHowmキーマップ
   let g:QFixHowm_Key = 'g'

   "メモファイルの保存先
   let g:howm_dir             = '~/var/storage/Dropbox/docs/howm'
   let g:howm_fileencoding    = 'utf-8'
   let g:howm_fileformat      = 'unix'

   let g:howm_filename          = 'memo_/%Y-%m-%d-%H%M%S.howm'
   let g:QFixHowm_DiaryFile     = 'diary/%Y-%m-%d-000000.howm'
   let g:QFixHowm_QuickMemoFile = "tmp__/0000-00-00-000000.howm"

   " unite mappings
   nnoremap [unite]m :<C-u>Unite<Space>qfixhowm/new<Space>qfixhowm<Space>-hide-source-names<CR>

   """ QickRun
   let g:quickrun_config = {
   \   "_" : {
   \       "outputter/buffer/split" : ":botright",
   \       "outputter/buffer/close_on_empty" : 1
   \   },
   \}
 
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
 " 最後に実行する処理
 "------------------------------------------------------------

 " ファイルタイプ自動識別ON
 filetype indent plugin on
 
