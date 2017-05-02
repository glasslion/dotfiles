dotfiles
========

My configrations for common tools, like vim, zsh ,tmux ...

Files are linked to the home directory by GNU Stow.

## Branching
Eash git branch represent a working environment. Because I have multiple working environments, I adapt some kind of *parallel branche* strategy in this repo. Unique changes for a sepcificated environment are committed to that branch directly. Changes shared by all environments are committed to the *common* branch, then merged to other branches.

## Bootstrap

```bash
# Install GNU Stew
sudo apt-get install stow

# Stow different modules
stow zsh
stow python
stow others

# Encrypt secrets
gpg --recipient <keyname> --output <secret>.asc --encrypt <secret> 

# Decrypt secrets
gpg <secret>.asc
```
