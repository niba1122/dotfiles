# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Adding the PATH for git 
export PATH=$HOME/.dotfiles/.mygit/bin:$PATH

alias tmux="TERM=screen-256color-bce tmux"

bindkey -e

zstyle ':completion:*:default' menu select=2

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

zmodload zsh/complist
bindkey -M menuselect '^B' vi-backward-char
bindkey -M menuselect '^N' vi-down-line-or-history
bindkey -M menuselect '^P' vi-up-line-or-history
bindkey -M menuselect '^F' vi-forward-char

# git-completion
#source $HOME/.dotfiles/.mygit/git-completion.zsh
#source $HOME/.dotfiles/.mygit/git-prompt.sh

# カーソルキーを無効にする
do-nothing() {
}
zle -N do-nothing
bindkey '^[OA' do-nothing
bindkey '^[OB' do-nothing
bindkey '^[OC' do-nothing
bindkey '^[OD' do-nothing

bindkey -M menuselect '^[OA' do-nothing
bindkey -M menuselect '^[OB' do-nothing
bindkey -M menuselect '^[OC' do-nothing
bindkey -M menuselect '^[OD' do-nothing

# ----------------------
# Git Aliases
# ----------------------

alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gbd='git branch -D'
alias gco='git commit -m'
alias gcoa='git commit -a -m'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdv='git diff | vim -'
alias gdcv='git diff --cached | vim -'
alias gf='git fetch'
alias gl='git log'
alias gpl='git pull-current'
alias gps='git push-current'
alias gr='git reset'
alias gss='git stash'
alias gssl='git stash list'
alias gssp='git stash pop'
alias gst='git status'


# ----------------------
# Git Functions
# ----------------------

function gchr() { git checkout -b $1 origin/$1 }

function _gchr() {
  local -a branches
  branches=($( git branch -a | grep -E '^ *remotes/origin/' | sed -E 's/^ *remotes\/origin\///' | grep -v -E '^HEAD' ))
  compadd $branches
}

compdef _gchr gchr
