# Vium

Vim distribution I use to get shit done.

Here is how it looks with [twilight\_n](http://github.com/nikitug/twilight_n.vim) theme.
Also check this theme out even if you are not going to use vium.

![Vium screenshot](http://nikitug.com/projects/vium/vium4.png)

## Installation

```bash
# say goodbye to your old .vim
mv ~/.vim ~/.vim.bak
mv ~/.vimrc ~/.vimrc.bak

# clone this awesome vim distribution and setup submodules
git clone git://github.com/nikitug/vium.git ~/.vim
cd ~/.vim
git submodule init
git submodule update

# and link vimrc
ln -s ~/.vim/vimrc ~/.vimrc
```

## Key Bindings

Check out `Bindings` section in `vimrc` to learn more.
