# vim: ft=sh
export PYENV_ROOT=/usr/local/.pyenv
export RBENV_ROOT=/usr/local/.rbenv

export ANDROID_HOME=/home/minamo/Android/Sdk

typeset -U path PATH
path=(
  "$PYENV_ROOT/bin"
  "$PYENV_ROOT/shims"
  "$RBENV_ROOT/bin"
  "$RBENV_ROOT/shims"
  "/usr/local/go/bin"
  "$ANDROID_HOME/tools"
  "$ANDROID_HOME/platform-tools"
  $path
  "/usr/local/sbin"
  "/usr/sbin"
  "/sbin"
  "$HOME/.go/bin"
  "$HOME/.cargo/bin"
  "/usr/games"
  "/usr/local/games"
)

export GOPATH=$HOME/.go
export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem

bindkey -v
