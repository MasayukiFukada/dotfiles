# Set up the prompt
# vim: ft=sh

typeset -gU path PATH
path=(
  "$HOME/.anyenv/bin"
  $PATH
  "$HOME/.yarn/bin"
  "$HOME/.config/yarn/global/node_modules/.bin"
  "/usr/local/go/bin"
  "/usr/local/sbin"
  "/usr/sbin"
  "/sbin"
  "$HOME/tool/flutter/bin"
  "$HOME/.go/bin"
  "$HOME/.cargo/bin"
  "$HOME/bin"
  "$HOME/.local/bin"
  "/usr/games"
  "/usr/local/games"
  "$HOME/tool/android-studio/bin"
  "$HOME/tool/android_sdk/platform-tools"
  "$HOME/work/tool-repository/stlink/build/Release/_install/usr/local/bin"
  "$HOME/.deno/bin"
)

export GOPATH=$HOME/.go
export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem

bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=200
SAVEHIST=200
HISTFILE=~/.zsh_history

#>>> 以下追加
export EDITOR="vim"
export LANG=ja_JP.UTF-8
#export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export CLASSPATH=.:$CLASSPATH:/usr/share/java/sqlite-jdbc-3.39.2.0.jar

#OSによって存在しないコマンドはコメントアウトしている
alias awk='gawk'
alias chrome-s='google-chrome -disk-cache-dir=/tmp &'
#alias chrome='google-chrome-unstable -disk-cache-dir=/tmp &'
alias chrome='google-chrome -disk-cache-dir=/tmp &'
alias cls='clear'
alias ftp='ftp -in'
alias grep='grep --color=auto '
alias hstg='history | grep'
alias la='ls -ahFX --color=auto'
alias ll='ls -alhFX --color=auto'
alias ls='ls -X --color=auto'
alias mytm='gnome-terminal --geometry=132x30 -e "byobu"'
alias ps='ps -ax'
alias psg='ps -ax | grep'
alias rm='rm -i'
alias cp='cp -i'
alias t='tmux'
alias tlg='~/Dropbox/Work/Perl/TimeEventLog.pl ~/Dropbox/Document/timelog.txt'
alias whereis='whereis -b'
alias dbox='~/.dropbox-dist/dropboxd &'
#ファイル名付き
alias lbfx='libreoffice ~/Dropbox/Document/SpreadSheet/life_MoneyFx.ods &'
alias tmelg='~/Dropbox/Work/Perl/TimeEventLog.pl ~/Dropbox/Document/timelog.txt'

# 先頭がスペースならヒストリーに追加しない。
setopt hist_ignore_space
# ^Iで補完可能な一覧を表示する。(曖昧補完)
setopt auto_list
# cdでpushdする。
setopt auto_pushd
# pushdで同じディレクトリを重複してpushしない。
setopt pushd_ignore_dups
# 補完時にスペルチェックをする。
#setopt auto_correct
# 補完時にヒストリを自動的に展開する。
setopt hist_expand
# pushd を引数無しで実行した時に pushd ~ とする。
setopt pushd_to_home
# ディレクトリ名だけで移動できる。
setopt auto_cd
# rm * を実行する前に確認される。
setopt rmstar_wait
# バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify
# 履歴ファイルに時刻を記録
setopt extended_history
# 履歴をインクリメンタルに追加
setopt inc_append_history
# 履歴の共有
setopt share_history
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

if [ -e ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

# anyenv
#-------------------------------------------------------------------------------
eval "$(anyenv init -)"

#
# fzf
#
export FZF_DEFAULT_OPTS='--reverse --border'

function history-fzf() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(history -n 1 | eval $tac | fzf --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N history-fzf
bindkey '^r' history-fzf

function cd-fzf-ghqlist() {
    local GHQ_ROOT=`ghq root`
    #local REPO=`ghq list -p | sed -e 's;'${GHQ_ROOT}/';;g' | fzf +m`
    local REPO=`ghq list -p | fzf +m`
    if [ -n "${REPO}" ]; then
        BUFFER="cd ${REPO}"
    fi
    zle accept-line
}
zle -N cd-fzf-ghqlist
bindkey '^]' cd-fzf-ghqlist

cd-fzf-find() {
    local DIR=$(find ./ -path '*/\.*' -name .git -prune -o -type d -print 2> /dev/null | fzf +m)
    if [ -n "$DIR" ]; then
        cd $DIR
    fi
}
alias fd=cd-fzf-find

vim-fzf-find() {
    local FILE=$(find ./ -path '*/\.*' -name .git -prune -o -type f -print 2> /dev/null | fzf +m)
    if [ -n "$FILE" ]; then
        ${EDITOR:-vim} $FILE
    fi
}
alias fv=vim-fzf-find

# コマンドプロンプトにシステム情報を OS のロゴ付きで表示する
# archey

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# Starship
#
eval "$(starship init zsh)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/minamo/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/minamo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/minamo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/minamo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

