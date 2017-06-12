# vim: ft=sh
export PYENV_ROOT=/usr/local/.pyenv
export RBENV_ROOT=/usr/local/.rbenv

typeset -U path PATH
path=(
  "$PYENV_ROOT/bin"
  "$PYENV_ROOT/shims"
  "$RBENV_ROOT/bin"
  "$RBENV_ROOT/shims"
  $path
  "/usr/local/sbin"
  "/usr/local/bin"
  "/usr/sbin"
  "/usr/bin"
  "/sbin"
  "/bin"
  "/usr/games"
  "/usr/local/games"
)

export GOROOT=/usr/local/go
export GOPATH=$HOME/.go
export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem
