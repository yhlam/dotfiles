dotfiles
========

Unix profile files for various applications


## Installation

### Setup syslink to various configuration files

`./install.sh`

### Install vim plugins

`git submodule update --init --recursive`

### Install difftastic

[difftastic](https://difftastic.wilfred.me.uk/) is used as git diff tool.

### Install fzf

[fzf](https://github.com/junegunn/fzf) is used for searching file in vim.

### Download a nerd font

The vim-airline plugin uses special characters and requires a font supporting
those characters.

1. Download a [nerd font](https://www.nerdfonts.com/)
2. Extract and copy the fonts into `/usr/local/share/fonts/` to install
   globally or `~/.fonts` to install for the user only.
3. Run `sudo fc-cache -f -v` or `fc-cache -f -v` to update the font cache.
   Restart if you still don't see the new fonts.

### Install pyenv

[pyenv](https://github.com/pyenv/pyenv) is used for managing python versions.

### Install mcfly

[mcfly](https://github.com/cantino/mcfly) is used for seaching command history.

### Install tmux plugin manager

[Tumx Plugin Manager](https://github.com/tmux-plugins/tpm) is used for
managing tmux plugins.


## VIM Plugins

### Installation
`git submodule update --init --recursive`

### Add a package
```
cd ~/.vim/pack/plugins/start
git submodule add <repo>
```

### Update packages
`git submodule update --remote --merge`


### Remove a package
1. Delete the relevant line from the .gitmodules file.
2. Delete the relevant section from .git/config.
3. Run `git rm --cached path_to_submodule` (no trailing slash).
4. Commit and delete the now untracked submodule files.
