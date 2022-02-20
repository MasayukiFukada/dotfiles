#!/usr/bin/bash

# ------------------------------------------------------------------------------
# 全タスクの Completed を Deleted に変更する
# ------------------------------------------------------------------------------

# 一時的に確認を不要にする設定に変更する。yes と答えること
task config confirmation no

# gawk を使って Completed を Deleted に変える
task all | gawk '$2=="C"{ system("task "$3" delete"); }'

# 確認設定を元に戻しておく
task config confirmation yes

