# Set up the prompt
# vim: ft=sh

# Path to your oh-my-zsh installation.
export ZSH=/home/minamo/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kphoen"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

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

