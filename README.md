dotfiles
========

My configrations for common tools, like vim, zsh ,tmux ...

Files are linked to the home directory by GNU Stow.

## Bootstrap

For each environment, execute the bootstrap script(under the `bootstrap` dir).

```bash
# Encrypt secrets
gpg --recipient <keyname> --output <secret>.asc --encrypt <secret> 

# Decrypt secrets
gpg <secret>.asc
```

## Why GNU stow(not ansible, confd, puppet ...)
1. I want to keep things simple and stupid. Configuration management tools like ansible are more powerful, more customizable, however they are all too complex.
2. Readability counts. CM tools rely on templates and external data store. It's harder to guess how the final rendered conf file looks like.
3. Inplace editing. GNU stow use symbol links. This is a huge advantage! For CM tools, we need to remember to edit the template file inside the dotfiles repo instead of the original location. Besides some files can be changed by other tools, e.g. vscode conf, git conf.


## Resolve environment differences
We may have different work environments like home, company ... Different environments may have different configs for the same file. To resolve this issue,
we can create dirs for each environment and put environment-specific files inside those dirs. Then use bootstrap script to control which dirs should be stowed in an environment.
 