source ~/.zsh/exports.zsh

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle command-not-found
antigen bundle colored-man-pages
antigen bundle magic-enter
antigen bundle extract
antigen bundle tmux
antigen bundle git
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme oskarkrawczyk/honukai-iterm-zsh

antigen apply

# Set Spaceship ZSH as a prompt
# SPACESHIP_PROMPT_ORDER=(user dir git exec_time line_sep jobs exit_code char)
# SPACESHIP_CHAR_SYMBOL="❯ "
# autoload -U promptinit; promptinit
# prompt spaceship


# Set pure prompt
autoload -U promptinit; promptinit
prompt pure

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

source ~/.zsh/history.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/aliases.zsh

# If local.zsh exists, source it
if [ -e "$HOME/.zsh/local.zsh" ]; then
  source ~/.zsh/local.zsh
fi
