# dotfiles
## prerequisites

### zsh
```
$ sudo vim /etc/shells
# add the result of the command $ which zsh at the bottom
$ chsh -s $(which zsh)
```

### youcompleteme

```
$ cd $HOME/.cache/dein/repos/github.com/valloric/youcompleteme/
$ ./install.py --clang-completer
```

## installment

```
$ cd ~/
$ git clone https://github.com/Sean0628/dotfiles.git
$ sh ~/dotfiles/install.sh
```
