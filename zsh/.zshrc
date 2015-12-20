# ZSH Configs
###################################################################################

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="clean"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)


ZSH_CUSTOM="~/.zsh_custom"

plugins=(git pip python colored-man autojump tmuxinator docker fabric)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
###################################################################################


# Locale
###################################################################################
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


export EDITOR='subl -n -w'



# Python
###################################################################################
ZSH_PIP_INDEXES=(https://pypi.mirrors.ustc.edu.cn/simple/)

# virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh


# Alias
###################################################################################

alias ack='ack-grep'

# Show open ports
alias ports='netstat -tulanp'

alias apt-get="sudo apt-get"
alias update='sudo apt-get update && sudo apt-get upgrade'

# become root #
alias su='sudo -i'

# safe delete
alias del='rm -I –preserve_root'

# cd into the current directory, useful under mounted locatons
alias cpd='cd ${PWD##*/}'

# the fuck: https://github.com/nvbn/thefuck
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# clipboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# docker
alias dc='sudo docker'
alias dc-shell='sudo docker run --rm -i -t'
alias dc-killall='docker kill $(docker ps -q)'
alias dc-cleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias dc-cleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
[ -f ~/.zsh_docker ] && . ~/.zsh_docker

# added by Anaconda2 2.4.0 installer
[ -d $HOME/anaconda2 ] && export PATH="$PATH:$HOME/anaconda2/bin"

# Secrets
################################################################################
[ -f ~/.zshrc.secret ] && source ~/.zshrc.secret
