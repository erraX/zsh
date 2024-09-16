# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit snippet OMZP::git
autoload -U compinit && compinit
zinit cdreplay -q


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
eval "$(zoxide init --cmd cd zsh)"

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

source ~/completion-for-pnpom.zsh

# Run `$(brew --prefix)/opt/fzf/install`
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=';;'

export BAT_THEME="ansi"

export ENHANCD_COMMAND=cdd
source ~/.local/share/enhancd/init.sh

pokemonsay -p Gengar Hello World

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# History auto suggestions
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

cd ~/workspace
