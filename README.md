# Vium

Vim distribution I use to get shit done.

## Installation

```bash
# say goodbye to your old .vim
mv ~/.vim ~/.vim.bak
mv ~/.vimrc ~/.vimrc.bak

git clone git://github.com/nikitug/vium.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/.vim/vimrc ~/.vimrc

# install plugins
vim +PluginInstall +qall
```
