dotfiles
========

My configrations for common tools, like vim, zsh ,tmux ...

Files are linked to the home directory by GNU Stow.

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
