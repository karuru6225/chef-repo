#!/bin/bash

alias rm='rm -i'
alias mv='mv -i'

#ヒストリー共有の設定
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999

#端末ロックをしない設定
stty stop undef

export EDITOR='vim'
