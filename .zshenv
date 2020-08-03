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
  "$HOME/.go/bin"
  "$HOME/.cargo/bin"
  "$HOME/bin"
  "/usr/games"
  "/usr/local/games"
  "$HOME/work/tool-repository/stlink/build/Release/_install/usr/local/bin"
)

export GOPATH=$HOME/.go
export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem

bindkey -v
