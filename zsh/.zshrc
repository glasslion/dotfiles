# ZSH Configs
###################################################################################

[ -f $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Initialize completion
autoload -U compinit; compinit

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Locale
###################################################################################
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Python
###################################################################################

# NodeJS
###################################################################################
eval "$(fnm env --use-on-cd --shell zsh)"

# Golang
###################################################################################
if [ -d "/usr/local/go" ]; then
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
fi

# meituan dianping use go 1.12
if [ -d "/usr/local/opt/go@1.12" ]; then
export GOPATH=$HOME/go
export PATH="$PATH:/usr/local/opt/go@1.12/bin:$GOPATH/bin"
fi

if [ -d "/usr/local/opt/go@1.12" ]; then
export GOPATH=$HOME/go
export GOPRIVATE=git.sankuai.com/*,dianpingoa.com/*
fi

# JDK
###################################################################################
if [ -d "/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home" ]; then
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home"
fi

if [ -d "/Library/Java/JavaVirtualMachines/jdk-1.8.jdk/Contents/Home" ]; then
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-1.8.jdk/Contents/Home"
fi
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# Alias
###################################################################################
# clipboard
if command -v xclip  1>/dev/null 2>&1; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# git
alias git-clean-branches='git checkout master && git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d && git remote prune origin'
alias git-del-remote-branch='git push -d  origin $(git branch --show-current)'


# move the book_id argument to the end, so it's easier to edit it
geektime-download() {  geektime ebook "$1"  --comments-count 100 }

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# '' '/##+sec$/d' /etc/hosts
alias clean-hosts="sudo /usr/bin/sed -i '' '/##+sec$/d' /etc/hosts"


[ -d $HOME/.local/bin ] && export PATH="$PATH:$HOME/.local/bin"


# Added by CatPaw
export PATH="/Users/leo/.catpaw/bin:$PATH"

source ~/.moaextrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Secrets
################################################################################
[ -f $HOME/.zshrc.secret ] && source $HOME/.zshrc.secret

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
