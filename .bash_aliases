# aliases
alias ls='ls -al --show-control-chars'
alias rm='rm -i'
alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"

