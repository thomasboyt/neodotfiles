New dotfiles for a new Vim.

Installation:

```
git clone git@github.com:thomasboyt/neodotfiles.git ~/neodotfiles
ln -s ~/neodotfiles/nvimrc ~/.nvimrc
ln -s ~/neodotfiles/tmux.conf ~/.tmux.conf
ln -s ~/neodotfiles/screen-256color.ti ~/.screen-256color.ti
ln -s ~/neodotfiles/zshrc ~/.zshrc

curl -fLo ~/.nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Todos:

- Move language-specific conf out of `zshrc`
