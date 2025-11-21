# ZSH Configs
###################################################################################

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew autojump zsh-autosuggestions docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Locale
###################################################################################
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)


# Python
###################################################################################
ZSH_PIP_INDEXES=(https://pypi.mirrors.ustc.edu.cn/simple/)

# Dev tools
alias sourcetree='open -a SourceTree'


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

# Alias
###################################################################################
if command -v ack-grep  1>/dev/null 2>&1; then
  alias ack='ack-grep'
fi

if [ -f $HOME/.agignore ]; then
  alias ag='ag -p $HOME/.agignore --width 150'
fi

# clipboard
if command -v xclip  1>/dev/null 2>&1; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# git
alias git-clean-branches='git checkout master && git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d && git remote prune origin'
alias git-del-remote-branch='git push -d  origin $(git branch --show-current)'

# Secrets
################################################################################
[ -f $HOME/.zshrc.secret ] && source $HOME/.zshrc.secret

# move the book_id argument to the end, so it's easier to edit it
geektime-download() {  geektime ebook "$1"  --comments-count 100 }

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"


# JDK
if [ -d "/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home" ]; then
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home"
fi

if [ -d "/Library/Java/JavaVirtualMachines/jdk-1.8.jdk/Contents/Home" ]; then
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-1.8.jdk/Contents/Home"
fi
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# '' '/##+sec$/d' /etc/hosts
alias clean-hosts="sudo /usr/bin/sed -i '' '/##+sec$/d' /etc/hosts"


[ -d $HOME/.local/bin ] && export PATH="$PATH:$HOME/.local/bin"



# Added by CatPaw
export PATH="/Users/leo/.catpaw/bin:$PATH"

source ~/.moaextrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
