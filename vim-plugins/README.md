# VIM Plugins

## Installation
`git submodule update --init --recursive`

## Add a package
```
cd ~/.vim/pack/plugins/start
git submodule add <repo>
```

## Update packages
`git submodule update --remote --merge`


## Remove a package
1. Delete the relevant line from the .gitmodules file.
2. Delete the relevant section from .git/config.
3. Run `git rm --cached path_to_submodule` (no trailing slash).
4. Commit and delete the now untracked submodule files.
