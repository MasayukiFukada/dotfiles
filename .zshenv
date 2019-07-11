# vim: ft=sh
export PYENV_ROOT=$HOME/.anyenv/envs/pyenv
export RBENV_ROOT=$HOME/.anyenv/envs/rbenv

export ANDROID_HOME=/home/minamo/Android/Sdk
export ANDROID_HOME=$HOME/Android/

export GOPATH=$HOME/.go
export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem

typeset -U path PATH
path=(
  "$ANDROID_HOME/platform-tools"
  "$ANDROID_HOME/tools"
  "$HOME/.cargo/bin"
  "$HOME/.go/bin"
  "$HOME/bin"
  "$PYENV_ROOT/bin"
  "$PYENV_ROOT/shims"
  "$GEM_HOME/bin"
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

bindkey -v

