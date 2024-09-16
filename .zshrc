#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
source ~/completion-for-pnpom.zsh
eval "$(starship init zsh)"
pokemonsay -p Gengar Hello World

alias vi=nvim
alias src='source ~/.zshrc'
alias a=ls
alias c=clear
alias su='su -m'
alias df='df -h'
alias du='du -h -d 2'
alias tf='tail -f'

# common directories
alias wk='cd ~/workspace'
alias home='cd ~'
alias dl='cd ~/Downloads'
alias github='cd ~/workspace/github'

# alias git
alias g=git
alias gd='git diff'
alias gc='git clean'
alias gdc='git diff --cached'
alias gco='git checkout'
alias gre='git reset'
alias greh='git reset --hard'
alias gres='git reset --soft'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gp='git push'
alias gl='git pull'
alias glr='git pull --rebase'
alias gri='git rebase -i'
alias gst='git status'
alias grmaster='git fetch && git rebase origin/master'
alias gremaster='git fetch && git reset --hard origin/master'

# alias cd
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias prez='vi ~/.zpreztorc'
alias zshrc='vi ~/.zshrc'

alias cat='bat'
alias ls='exa'

eval $(thefuck --alias)

# Run `$(brew --prefix)/opt/fzf/install`
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=';;'

export BAT_THEME="ansi"

export ENHANCD_COMMAND=cdd
source /Users/niminjie/workspace/github/guitar-practice-routine/enhancd/init.sh
