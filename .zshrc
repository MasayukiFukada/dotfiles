# Set up the prompt
# vim: ft=sh

# 昔のプロンプト
# autoload -Uz promptinit
# promptinit
# prompt fire red magenta blue white white white

# ----- PROMPT -----
## PROMPT
PROMPT=$'%B[%h]%b %F{cyan}%n%F{white}@%F{magenta}%m %F{blue}[%~] %F{white}(`branch-status-check`)\n%F{yellow}(*・ω・)%F{white}< '
setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する

# {{{ methods for RPROMPT
# fg[color]表記と$reset_colorを使いたい
# @see https://wiki.archlinux.org/index.php/zsh
autoload -U colors; colors
function branch-status-check {
    local prefix branchname suffix
        # .gitの中だから除外
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
            return
        fi
        branchname=`get-branch-name`
        # ブランチ名が無いので除外
        if [[ -z $branchname ]]; then
            return
        fi
        prefix=`get-branch-status` #色だけ返ってくる
        suffix='%{'${reset_color}'%}'
        echo ${prefix}${branchname}${suffix}
}
function get-branch-name {
    # gitディレクトリじゃない場合のエラーは捨てます
    echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}
function get-branch-status {
    local res color
        output=`git status 2> /dev/null`
        if [[ -n `echo $output | grep "^nothing to commit"` ]]; then
            res=':' # status Clean
            color='%{'${fg[green]}'%}'
        elif [[ -n `echo $output | grep "^# Untracked files:"` ]]; then
            res='?:' # Untracked
            color='%{'${fg[yellow]}'%}'
        elif [[ -n `echo $output | grep "^# Changes not staged for commit:"` ]]; then
            res='M:' # Modified
            color='%{'${fg[red]}'%}'
        else
            res='A:' # Added to commit
            color='%{'${fg[cyan]}'%}'
        fi
        # echo ${color}${res}'%{'${reset_color}'%}'
        echo ${color} # 色だけ返す
}
# }}}

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#>>> 以下追加
export EDITOR="vim"
export LANG=ja_JP.UTF-8
export XMODIFIERS=@im=uim
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"

#OSによって存在しないコマンドはコメントアウトしている
alias awk='gawk'
alias chrome-s='google-chrome -disk-cache-dir=/tmp &'
#alias chrome='google-chrome-unstable -disk-cache-dir=/tmp &'
alias chrome='google-chrome -disk-cache-dir=/tmp &'
alias cls='clear'
alias ftp='ftp -in'
alias grep='grep --color=auto -i '
alias hstg='history | grep'
alias la='ls -ahFX --color=auto'
alias ll='ls -alhFX --color=auto'
alias ls='ls -X --color=auto'
alias mytm='gnome-terminal --geometry=132x30 -e "byobu"'
alias ps='ps -ax'
alias psg='ps -ax | grep'
alias rm='rm -i'
alias cp='cp -i'
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

