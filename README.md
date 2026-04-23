dotfiles
========

这是我常用工具的配置，包括 vim、zsh、tmux 等。

文件通过 GNU Stow 链接到用户目录。

## 目录

- [GNU Stow 介绍](#gnu-stow-介绍)
- [快速上手](#快速上手)
- [管理 packages](#管理-packages)
- [可用 packages](#可用-packages)

## GNU Stow 介绍

GNU Stow 是一个符号链接管理器，可以轻松管理配置文件。Stow 不会将文件复制到目标位置，而是从 dotfiles 仓库创建符号链接到用户目录。

**为什么用 Stow:**
- **简单**: 无需模板，无外部数据存储，只有符号链接
- **可读**: 直接编辑仓库中的实际文件，无需渲染模板
- **就地编辑**: 文件通过符号链接管理，可以直接在原位置编辑

### Stow 工作原理

```
dotfiles/
├── dev/          # package "dev"
│   └── .gitconfig  → ~/.gitconfig
├── python/       # package "python"
│   └── .pythonrc  → ~/.pythonrc
└── zsh/          # package "zsh"
    └── .zshrc    → ~/.zshrc
```

每个子目录是一个 **package**。运行 `stow dev` 会将 `dev/` 下的所有文件符号链接到 `../`（即用户目录）。

## 快速上手

```bash
# 链接所有 packages
stow dev python zsh

# 或者逐个链接
stow dev
stow python
stow zsh

# 取消链接 (删除符号链接)
stow -D dev
stow -D python
stow -D zsh
```

## 管理 Packages

```bash
# 链接一个 package
stow <package>

# 取消链接 (删除符号链接)
stow -D <package>

# 重新链接 (修改后重新生效)
stow -R <package>

# 预览将要链接的内容 (dry-run)
stow -n <package>

# 详细输出
stow -v <package>
```

### 环境特定配置

对于不同环境（家里、公司），可以使用 bootstrap 脚本控制链接哪些 packages：

```bash
# 示例: bootstrap/meituan.sh
stow meituan
stow dev
stow zsh
```

## 可用 Packages

| Package | 说明 |
|---------|------|
| `dev` | 开发工具 (.gitconfig, .ackrc, .ideavimrc 等) |
| `python` | Python 配置 |
| `zsh` | Zsh 配置和插件 |
| `tmux` | Tmux 配置 |
| `meituan` | 美团特定配置 (工作环境) |

## Bootstrap

每个环境需要执行对应的 bootstrap 脚本（位于 `bootstrap` 目录）。

```bash
# 加密 secrets
gpg --recipient <keyname> --output <secret>.asc --encrypt <secret>

# 解密 secrets
gpg <secret>.asc
```

## 为什么要用 GNU Stow（不用 ansible、confd、puppet 等）

1. 我喜欢简单直接。ansible 等配置管理工具功能更强大、更可定制，但也更复杂。
2. 可读性很重要。CM 工具依赖模板和外部数据存储，很难想象最终渲染出来的配置文件是什么样子。
3. 就地编辑。GNU Stow 使用符号链接，这是一个巨大的优势。对于 CM 工具，我们必须记住要在 dotfiles 仓库内的模板文件中编辑，而不是在原位置。此外，有些文件会被其他工具修改，比如 vscode 配置、git 配置。

## 解决环境差异

我们可能有不同的运行环境，比如家里、公司……不同环境对同一个文件可能有不同的配置。为了解决这个问题，可以为每个环境创建目录，将环境特定的文件放在对应的目录中，然后用 bootstrap 脚本控制哪些目录需要在当前环境链接。