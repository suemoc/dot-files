colorscheme hybrid
set background=dark

if has('mac')
  "set guifont=Ricty:h14
  set guifont=Ricty:h14
	set columns=134		" width
	set lines=200		" line
else
  set guifont=Monaco\ 12
	set columns=160
	set lines=100
endif

set mouse=a			" どのモードでもマウスを利用可能に
set nomousefocus		" マウス移動によるフォーカス切り替えを無効

" 日本語入力時の補完エラー対策
set imdisable

" IME
if has('multi_byte_ime') || has('xim')
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
"    set imactivatekey=C-space
    set imactivatekey=Zenkaku_Hankaku
  endif
  " 挿入モードでのIME状態を記憶させない
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif
