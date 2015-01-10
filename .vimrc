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
 set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

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

 " <C-L>で検索後の強調表示を解除する
 "nnoremap <C-L> :nohl<CR><C-L>

 " edit vimrc
 nnoremap <Leader>. :<C-u>edit $HOME/.vimrc<CR>
 " reload vimrc
 nnoremap <Leader>s. :<C-u>source $HOME/.vimrc<CR>

 " 直前のファイルを開く
 nnoremap <Leader>h :<C-u>b<Space>#<CR>

 " insertモードを抜ける
 "inoremap <silent> jj <ESC>
 "inoremap <silent> <C-j> j

 " 挿入モードでのカーソル移動
 inoremap <C-j> <Down>
 inoremap <C-k> <Up>
 inoremap <C-h> <Left>
 inoremap <C-l> <Right>

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
 imap { {}<LEFT>
 imap [ []<LEFT>
 imap ( ()<LEFT>

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
   NeoBundle 'Shougo/neosnippet'
   NeoBundle 'Shougo/neosnippet-snippets'
   NeoBundle 'itchyny/lightline.vim'
   NeoBundle 'tpope/vim-surround'
   NeoBundle 'altercation/vim-colors-solarized'
   " NeoBundle 'Townk/vim-autoclose'
   NeoBundle 'fuenor/qfixhowm'
   NeoBundle "osyo-manga/unite-qfixhowm"
   NeoBundle "thinca/vim-quickrun"
   NeoBundle "Lokaltog/vim-easymotion"
   NeoBundle 'scrooloose/syntastic.git'
   NeoBundle 'kana/vim-smartword.git'
   NeoBundle 'mattn/emmet-vim'
   NeoBundle 'tomtom/tcomment_vim'
   NeoBundle "kchmck/vim-coffee-script"
   NeoBundle 'marijnh/tern_for_vim', {
     \ 'build': {
     \   'others': 'npm install'
     \}}
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
   "let g:neocomplcache_enable_auto_select = 1

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
   " imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
   " smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"

   " 前回行われた補完をキャンセルします
   inoremap <expr><C-g> neocomplcache#undo_completion()

   " 補完候補のなかから、共通する部分を補完します
   " inoremap <expr><C-l> neocomplcache#complete_common_string()

   " 改行で補完ウィンドウを閉じる
   inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

   "tabで補完候補の選択を行う
   "inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
   inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

   " <C-h>や<BS>を押したときに確実にポップアップを削除します
   " inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”

   " 現在選択している候補を確定します
   inoremap <expr><C-y> neocomplcache#close_popup()

   " 現在選択している候補をキャンセルし、ポップアップを閉じます
   inoremap <expr><C-e> neocomplcache#cancel_popup()


   """ Neosnippet
   " Plugin key-mappings.
   "imap <C-k>     <Plug>(neosnippet_expand_or_jump)
   "smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 
   " SuperTab like snippets behavior.
   "imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
   "\ "\<Plug>(neosnippet_expand_or_jump)"
   "\: pumvisible() ? "\<C-n>" : "\<TAB>"
   "smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
   "\ "\<Plug>(neosnippet_expand_or_jump)"
   "\: "\<TAB>"
   imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
   smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
 
   " For snippet_complete marker.
   if has('conceal')
     set conceallevel=2 concealcursor=i
   endif


   """ unite.eim
   " start insert mode
   let g:unite_enable_start_insert=1
   let g:unite_source_file_mru_limit = 200
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

   " プロジェクト下のファイル検索
   nnoremap <silent> <C-p> :<C-u>Unite<Space>file_rec/async:!<CR>
   " ファイル一覧をキャッシュするファイル数の最小値・最大値
   let g:unite_source_rec_min_cache_files = 100
   let g:unite_source_rec_max_cache_files = 1000
   " 画像を検索しない
   call unite#custom#source('file_rec/async', 'ignore_pattern', '\(png\|gif\|jpeg\|jpg\)$')

   " 最近開いたファイルを検索
   nnoremap <silent> <C-m> :<C-u>Unite<Space>file_mru<CR>

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

   """ solarized
   set background=dark
   colorscheme solarized

   """ vimfiler
   let g:vimfiler_as_default_explorer=1
   let g:vimfiler_safe_mode_by_default=0
   " mapping
   "cnoremap ee <C-u>VimFiler<Space>-split<Space>-simple<Space>-winwidth=35<Space>-no-quit
   nnoremap <Leader>ee :<C-u>VimFiler<Space>-split<Space>-simple<Space>-winwidth=35<Space>-no-quit<CR>

   """ lightline
   let g:lightline = {
           \ 'colorscheme': 'solarized',
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

   " メモの一覧表示
   " let g:QFixHowm_FileList = '**/????-??-??-?????0.howm'
   " let g:QFixHowm_FileList = 'abc.howm'
   " let g:QFixHowm_TitleListCache = 0

   " QFixList表示でファイルへ移動したらウィンドウを閉じる
   " let g:QFixHowm_ListCloseOnJump = 1

   " MRUに登録するファイルの正規表現(設定すると指定ファイル以外登録されない)
   " let g:QFixMRU_RegisterFile = '/memo_/'

   " unite mappings
   nnoremap [unite]m :<C-u>Unite<Space>qfixhowm/new<Space>qfixhowm<Space>-hide-source-names<CR>

   """ QickRun
   let g:quickrun_config = {
   \   "_" : {
   \       "outputter/buffer/split" : ":botright",
   \       "outputter/buffer/close_on_empty" : 1
   \   },
   \}

   """ EasyMotion
   nmap <Leader>s <Plug>(easymotion-s2)

   """ syntastic
   let g:syntastic_enable_signs=1
   let g:syntastic_auto_loc_list=2

   """ smartword
   nmap w <Plug>(smartword-w)
   nmap b <Plug>(smartword-b)
   nmap e <Plug>(smartword-e)

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

