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
plugins=(git brew pip autojump zsh-autosuggestions docker fabric)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Locale
###################################################################################
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
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
export PATH="$PATH:$HOME/.local/bin"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)";
fi

ZSH_PIP_INDEXES=(https://pypi.mirrors.ustc.edu.cn/simple/)

# Dev tools
alias sourcetree='open -a SourceTree'


# NodeJS
###################################################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Golang
###################################################################################
if [ -d "/usr/local/go" ]; then
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
fi

# meituan dianping use go 1.11
if [ -d "/usr/local/opt/go@1.11" ]; then
export GOPATH=$HOME/go
export PATH="$PATH:/usr/local/opt/go@1.11/bin:$GOPATH/bin"
fi


# Alias
###################################################################################
if command -v ack-grep  1>/dev/null 2>&1; then
  alias ack='ack-grep'
fi

if [ -f $HOME/.agignore ]; then
  alias ag='ag -p $HOME/.agignore --width 150'
fi

# Show open ports
alias ports='netstat -tulanp'

alias apt-get="sudo apt-get"

# become root #
alias su='sudo -i'

# safe delete
alias del='rm -I –preserve_root'

# cd into the current directory, useful under mounted locatons
alias cpd='cd ${PWD##*/}'

# the fuck: https://github.com/nvbn/thefuck
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

# added by travis gem
[ -f ~/.travis/travis.sh ] && source $HOME/.travis/travis.sh

alias restart-kde='kquitapp5 plasmashell || kstart plasmashell'

# clipboard
if command -v xclip  1>/dev/null 2>&1; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# docker
alias dc='sudo docker'
alias dc-shell='sudo docker run --rm -i -t'
alias dc-killall='docker kill $(docker ps -q)'
alias dc-cleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias dc-cleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
[ -f $HOME/.zsh_docker ] && . $HOME/.zsh_docker

# proxy
alias pwget='proxychains wget'
alias paria2c='proxychains aria2c'

alias rerun='python ~/src/brainhole/rerun.py'
alias rpyt='python ~/src/brainhole/rerun.py proxychains youtube-dl'

# git
alias git-clean-branches='git checkout master && git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d && git remote prune origin'


# added by Anaconda2 2.4.0 installer
###################################################################################
[ -d $HOME/anaconda2 ] && export PATH="$PATH:$HOME/anaconda2/bin"

# Secrets
################################################################################
[ -f $HOME/.zshrc.secret ] && source $HOME/.zshrc.secret

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# cuda
if [ -d "/usr/local/cuda-8.0" ]; then
export CUDA_HOME=/usr/local/cuda-8.0
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi
