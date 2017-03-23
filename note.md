# Add plugins method

```sh
mkdir -p ~/.vim/pack/law
cd ~/.vim/pack/law
git submodule init
git submodule add {{url}} ./start/{{plugin name}}
git add .gitmodules ./start/{{plugin name}}
git commit
```

```sh
git submodule update --remote --merge
git commit
```

```sh
git submodule deinit ./start/{{plugin name}}
git rm ./start/{{plugin name}}
rm -Rf ./start/{{plugin name}}
git commit
```

# Plugin needed

vim-tmux-navigator
