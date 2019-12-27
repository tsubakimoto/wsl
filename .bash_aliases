# aliases
## console
alias ls='ls -al --show-control-chars'
alias rm='rm -i'
alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"
alias untar='tar -zxvf'
alias wget='wget -c'
alias getpass='openssl rand -base64 20'
alias ping='ping -c 5'
alias ipe='curl ipinfo.io/ip'
alias ipi='ipconfig getifaddr NIC'
alias c='clear'
