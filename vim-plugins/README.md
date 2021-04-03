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
```
cd ~/.vim/pack/plugins
git submodule deinit <plugin>
rm -rf .git/modules/<plugin>
```
