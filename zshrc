# oh-my-zsh config
# ---------------

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

unsetopt correct

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="tboyt"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh



# Powerline
# ---------------

function powerline_precmd() {
  export PS1="$(~/.powerline-shell.py $? --shell zsh --cwd-only) "
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

install_powerline_precmd


# Path
# ---------------

export PATH=/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


# Python
# ---------------
#source /usr/local/bin/virtualenvwrapper_lazy.sh
export PYTHONPATH="/usr/local/lib/python2.7/site-packages/:$PYTHONPATH"


# Ruby
# ---------------
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source /Users/tboyt/.rvm/scripts/rvm


# Go
# ---------------
export GOPATH="$HOME/Coding/go"
export PATH="$HOME/Coding/go/bin:$PATH"



# Postgres
# ---------------
export PGDATA="/usr/local/var/postgres"


# OCaml
# ---------------
. /Users/tboyt/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


# Misc
# ---------------

# Use custom terminfo if exists
[[ -f "~/.$TERM.ti" ]] && tic ~/.$TERM.ti

alias vim='nvim'
alias nw="/Applications/node-webkit.app/Contents/MacOS/node-webkit"

export DROPBOX_PATH="/Users/tboyt/Dropbox"

fancygifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=6 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

