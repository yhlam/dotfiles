#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/tmux.conf $HOME/.tmux.conf
ln -s $DIR/gitconfig $HOME/.gitconfig
ln -s $DIR/inputrc $HOME/.inputrc
ln -s $DIR/bashrc_extras $HOME/.bashrc_extras
ln -s $DIR/zshrc $HOME/.zshrc
mkdir -p $HOME/.vim/pack
ln -s -T $DIR/vim-plugins $HOME/.vim/pack/plugins


SOURCE_BASHRC_EXTRAS="source $HOME/.bashrc_extras"
BASHRC="$HOME/.bashrc"
grep -qF -- "$SOURCE_BASHRC_EXTRAS" "$BASHRC" || echo "$SOURCE_BASHRC_EXTRAS" >> "$BASHRC"
