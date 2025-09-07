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
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

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

alias zshrc='vi ~/.zshrc'

alias cat='bat'
alias ls='eza'

alias gcb="git branch | fzf --preview 'git show --color=always {-1}' \
                 --bind 'enter:become(git checkout {-1})' \
                 --tmux
"
# Unbind ALT-C (escape + c)
bindkey -r '^[c'
# Rebind to e.g. CTRL-F (replace with whatever key sequence you want)
bindkey '^F' fzf-cd-widget
#
# Unbind ALT-C (escape + c)
bindkey -r '^[t'
# Rebind to e.g. CTRL-F (replace with whatever key sequence you want)
bindkey '^O' fzf-file-widget

# tokyo day
# export FZF_DEFAULT_OPTS="
#   --color=fg:#3760bf,bg:#e1e2e7,hl:#b15c00 \
#   --color=fg+:#3760bf,bg+:#d5d6db,hl+:#b15c00 \
#   --color=info:#007197,prompt:#9854f1,pointer:#007197 \
#   --color=marker:#9854f1,spinner:#b15c00,header:#587539 \
#   --color=border:#c4c5cf
# "

# Dayfox
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --color=fg:#3d2b5a,bg:#f6f2ee,hl:#2848a9 \
  --color=fg+:#3d2b5a,bg+:#e7d2be,hl+:#4863b6 \
  --color=info:#ac5402,prompt:#2848a9,pointer:#6e33ce,marker:#396847 \
  --color=spinner:#287980,header:#955f61,border:#d3c7bb \
  --border --height=70% --layout=reverse"

# fzf-tab configuration
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
#
# fzf-tab configuration

# eval $(thefuck --alias)
# eval "$(zoxide init --cmd cd zsh)"

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# source ~/completion-for-pnpom.zsh

# Run `$(brew --prefix)/opt/fzf/install`
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=';;'

export BAT_THEME="ansi"

# export ENHANCD_COMMAND=cdd
# source ~/.local/share/enhancd/init.sh

# pokemonsay -p Gengar Hello World

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
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# cd ~/workspace

# bun completions
[ -s "/Users/niminjie/.bun/_bun" ] && source "/Users/niminjie/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$HOME/.cargo/bin:$PATH"

# fco() {
#   local commit
#   commit=$(git log --oneline --decorate --graph --color=always \
#            | fzf --ansi --no-sort --reverse --preview 'git show --color=always {1}' \
#            | awk '{print $1}') || return
#   git checkout "$commit"
# }
