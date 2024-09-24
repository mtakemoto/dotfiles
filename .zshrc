# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda-mod"

# Android Studio Configuration
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# QMK path
export PATH=${PATH}:~/.local/bin

# Google Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH:/local/go/bin

# Load node version manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Fix for Windows/WSL default ugly folder highlighting in `ls`
LS_COLORS='ow=01;36;40'
export LS_COLORS

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

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

# Suppress EOL % mark highlighting
PROMPT_EOL_MARK=''

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git dotenv encode64)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Functions
container-info() {
  if which jq >/dev/null; then
    docker image inspect --format '{{json .Config.Labels}}' $1 | jq
  else
    echo "Command requires jq to parse JSON.  Please install."
  fi
}

function repo_diff {
	if [ -z "$1" ]; then time_range="2 weeks ago"; else time_range="$1"; fi
	if [ -z "$2" ]; then remote="origin"; else remote="$2"; fi

	remote_exists=$(git remote | grep "$remote")
	echo "$remote_exists"
	if [ -z "$remote_exists" ]; then echo "Remote $remote doesn't exist.  Please specify using the 2nd parameter" && return -1; fi

	for branch in $(git branch -r | grep -v '\->'); do
		echo "Branch: $branch"
      git log $branch --since="$time_range" -p ':(exclude)**/package-lock.json' ':(exclude)**/node_modules/**' ':(exclude)**/*.svg' ':(exclude)**/*.png' ':(exclude)**/*.jpg' ':(exclude)**/*.jpeg' ':(exclude)**/*.gif' ':(exclude)**/*.bmp' ':(exclude)**/*.tiff' ':(exclude)**/*.ico' ':(exclude)**/*.webp'
	done
}

function gitReport {
  isGitRepo=$(ls -a | grep ".git")
  if [ -z $isGitRepo ]; then echo "Error: directory \"$(pwd)\" is not a git repo" && return -1; fi
	git fetch --prune
	repo_diff "$@"
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# General
alias zr='source ~/.zshrc; echo "ZSH config reloaded"'
alias ze='nvim ~/.zshrc'
alias vim="nvim"
alias trp="trash-put"
alias trl="trash-list"
alias trr="trash-restore"
alias tre="trash-empty"

# Docker
alias dils="docker image ls"
alias dci="container-info"

# For WSL
alias explorer="explorer.exe"

# Pacman
alias pac='sudo pacman -S' #install
alias pacu='sudo pacman -Syu' #update
alias pacr='sudo pacman -Rs' #remove
alias pacs='sudo pacman -Ss' #search

# Git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gaa='git add -A'
alias gau='git add -u'
alias gnb='git checkout -b'
alias gpnb='git push -u origin HEAD'
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Dig
alias da='dig A'
alias dc='dig CNAME'
alias dt='dig TXT'
alias dmx='dig MX'

# Kubectl
alias k='kubectl'

## Tools
# Convert unix timestamps to something readable
function tsconvert {
  date -d "@$1"
}

# Decode urls to something human readable
function urldecode() {
  : "${*//+/ }"; echo -e "${_//%/\\x}";
}



# Load Angular CLI autocompletion.
source <(ng completion script)
