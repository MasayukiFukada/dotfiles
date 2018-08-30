# vim: ft=sh
export PYENV_ROOT=/usr/local/.pyenv
export RBENV_ROOT=/usr/local/.rbenv

export ANDROID_HOME=/home/minamo/Android/Sdk

export ANDROID_HOME=$HOME/Android/

typeset -U path PATH
path=(
  "$ANDROID_HOME/platform-tools"
  "$ANDROID_HOME/tools"
  "$HOME/.cargo/bin"
  "$HOME/.go/bin"
  "$HOME/bin"
  "$PYENV_ROOT/bin"
  "$PYENV_ROOT/shims"
  "$RBENV_ROOT/bin"
  "$RBENV_ROOT/shims"
  "/sbin"
  "/usr/games"
  "/usr/local/games"
  "/usr/local/go/bin"
  "/usr/local/sbin"
  "/usr/sbin"
  $path
)

export GOPATH=$HOME/.go
export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem

bindkey -v

