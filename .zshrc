# .zshrc

#------------------------------------------------------------
# Basic
#------------------------------------------------------------

#文字コード
export LANG=ja_JP.UTF-8
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

# パスの設定
PATH=/usr/local/bin:$HOME/bin:$PATH

#emacsキーバインド
bindkey -e

#ビープ音ならさない
setopt nobeep

#エディタ環境変数
export EDITOR=/usr/bin/vim

#改行のない出力をプロンプトで上書きするのを防ぐ
unsetopt promptcr


#------------------------------------------------------------
# Display
#------------------------------------------------------------

#プロンプト
autoload colors
colors

PROMPT="
 %{${fg[yellow]}%}%~%{${reset_color}%} 
[%n@${HOST%%.*}]$ "

PROMPT2='[%n]> ' 

#ブランチ情報を右プロンプトに表示
autoload -Uz vcs_info

#表示フォーマットの指定
#%b ブランチ情報
#%a アクション名(mergeなど)
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
_update_vcs_info_msg () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_vcs_info_msg

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{green}%1v%f|)"

export TERM=xterm-256color

#ターミナルのタイトル
case "${TERM}" in
kterm*|xterm*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST}\007"
    }
    ;;
esac 

#色の設定
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'


#------------------------------------------------------------
# History & Complement
#------------------------------------------------------------
#補完機能の強化
autoload -U compinit
compinit

#履歴
#履歴を保存するファイル指定
HISTFILE="$HOME/.zsh_history"

#履歴の件数
HISTSIZE=100000
SAVEHIST=100000

#重複した履歴を保存しない
setopt hist_ignore_dups

#履歴を共有する
setopt share_history

#先頭にスペースを入れると履歴に残さない
setopt hist_ignore_space

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# historyコマンドは履歴に登録しない
setopt hist_no_store

#履歴の検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 


#------------------------------------------------------------
# Move
#------------------------------------------------------------
#cdの設定
#ディレクトリ名だけで移動する。
setopt auto_cd

#自動でpushdする
setopt auto_pushd

#pushdの履歴は残さない。
setopt pushd_ignore_dups


#------------------------------------------------------------
# Alias
#------------------------------------------------------------
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls="ls -F --color"
  ;;
esac

alias l='ls -l'
alias ll='ls -l'
alias la='ls -la'
#alias lla='ls -al'
alias llh='ls -hla'

alias po='popd'
alias p='ps auxww | grep'

alias -g L='| less'
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'

alias dgrep='find . -type f -print | xargs grep'

alias up="cd ..; ls -l"
alias st="git status"
alias vi="vim"
alias f="open ."


#------------------------------------------------------------
# Function
#------------------------------------------------------------
# w3mでgoogle検索
function google() {
local str opt
if [ $ != 0 ]; then
for i in $*; do
str="$str+$i"
done
str=`echo $str | sed 's/^\+//'`
opt='search?num=50&hl=ja&lr=lang_ja'
opt="${opt}&q=${str}"
fi
w3m http://www.google.co.jp/$opt
}

# w3mでALC検索
function dic() {
if [ $ != 0 ]; then
w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
else
w3m "http://www.alc.co.jp/"
fi
}

# Finderのアクティブウィンドウのパスに移動
cdf () {
target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
if [ "$target" != "" ]
then
  cd "$target"
  pwd
else
  echo 'No Finder window found' >&2
fi
}

# Grepマッチでディレクトリ移動
jj () {
    if [ $1 ]; then
        JUMPDIR=$(find . -type d -maxdepth 1 | grep $1 | tail -1)
        if [[ -d $JUMPDIR && -n $JUMPDIR ]]; then
            cd $JUMPDIR
        else
            echo "directory not found"
        fi
    fi
}

#------------------------------------------------------------
# 個別設定
#------------------------------------------------------------
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
