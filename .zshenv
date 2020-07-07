# vim: ft=sh

export ANDROID_HOME=/home/minamo/Android/Sdk

typeset -U path PATH
path=(
  "/opt/anyenv/bin"
  "/usr/local/go/bin"
  "$ANDROID_HOME/tools"
  "$ANDROID_HOME/platform-tools"
  $path
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
