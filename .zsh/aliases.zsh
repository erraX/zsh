# quick jump
alias ..='cd ../'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'

# quick browser
alias dl='cd ~/Downloads'
alias dc='cd ~/Documents'
alias me='cd ~/Movies'
alias pic='cd ~/Pictures'
alias wk='cd ~/workspace'
alias tc='cd ~/workspace/tencent'
alias gtb='cd ~/workspace/github'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias chmod='chmod -v'
alias chown='chown -v'
alias mkdir='mkdir -pv' # Verbose & Parents mkdir flag

alias vi='nvim'
alias cat='bat'
alias top='htop'
alias ls='exa'
alias ll='ls -al'
alias la='ls -a'

alias path='echo -e ${PATH//:/\\n}' # Formatted path
alias f='open -a Finder ./'
alias qfind="find . -name "
alias cpd='copydir'
alias ip='ipconfig getifaddr en0'
alias grep='grep -b --color=auto'
alias cpwd="pwd |  tr -d '\n' | pbcopy"

# git
alias glogs='git log --stat'
