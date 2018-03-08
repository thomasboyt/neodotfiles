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

export PATH=/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Add ~/bin
export PATH="$HOME/bin:$PATH"

alias rm=trash

source ~/.zshrc.local
