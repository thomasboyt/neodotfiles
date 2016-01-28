New dotfiles for a new Vim.

## Installation

* Install powerline shell to `~/powerline-shell`: https://github.com/milkbikis/powerline-shell
* Get patched Monaco for Powerline from Dropbox
* Install iTerm 2 Solarized: https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
* Import and use Solarized and patched Monaco

```
git clone git@github.com:thomasboyt/neodotfiles.git ~/neodotfiles
ln -s ~/neodotfiles/nvimrc ~/.nvimrc
ln -s ~/neodotfiles/tmux.conf ~/.tmux.conf
ln -s ~/neodotfiles/screen-256color.ti ~/.screen-256color.ti
ln -s ~/neodotfiles/zshrc ~/.zshrc

curl -fLo ~/.nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Plugin Installation

In VIM:

```
:PlugInstall
```

In tmux: `C-a I`

### Karabiner

* Download: https://pqrs.org/osx/karabiner/
* Run `karabiner.sh`

Keybindings:

* Poker 3: escape rebound to backtick
* All devices: Pressing L_Ctrl and nothing else acts as escape

## Todos

- Move language-specific conf out of `zshrc`
