[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

source ~/.zsh/exports.zsh
source ~/.zsh/history.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/aliases.zsh

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
