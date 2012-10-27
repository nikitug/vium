# Vium

```bash
# say goodbye to tour old .vim
rm -rf ~/.vim ~/.vimrc

# clone this awesome vim distribution
git clone git://github.com/nikitug/vium.git ~/.vim

# setup pathoden
mkdir ~/.vim/autoload
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# and link vimrc
ln -s ~/.vim/vimrc ~/.vimrc
```
