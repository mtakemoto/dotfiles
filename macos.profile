#My base PS1 if there is no git repository
#PS1 Prompt Settings
PS1="\[\e[1;32m\]\u\[\e[1;37m\]@\[\e[1;36m\]\h::\[\e[1;31m\]\W:\[\e[00m\] $ "

#Include the git autocomplete bash script
# Source the git bash completion file
if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.bash
    GIT_PS1_SHOWDIRTYSTATE=true
    PS1="\[\e[1;32m\]\u\[\e[1;37m\]@\[\e[1;36m\]\h::\[\e[1;31m\]\W:\[\e[1;35m\]\$(__git_ps1)\[\e[00m\] $ "
fi

export PS1

#Color settings based on the following superuser thread
# http://superuser.com/questions/399594/color-scheme-not-applied-in-iterm2
#Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

#Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

alias ll='ls -l'
alias la='ls -a'
alias mysql='/Applications/MAMP/Library/bin/mysql'

#Show actual path to current directory (resolve symlinks)
alias pwd='pwd -P'
#-------------------------------------------------------------
# History mod from Jason H.
#-------------------------------------------------------------
# search history via up and down arrow keys
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# Avoid duplicates in the bash command history.
export HISTCONTROL=erasedups

# Increase history size
export HISTSIZE=10000

# Append commands to the bash command history file (~/.bash_history) # instead of overwriting it. This way if you have multiple terminals open # they play nicely with the bash command history.
shopt -s histappend

# Append commands to the history every time a prompt is shown, # instead of after closing the session. This way if you have multiple # terminals open they play nicely with the bash history.
PROMPT_COMMAND='history -a'

#Use colordiff (brew install colordiff)
alias diff=colordiff

#Aliases
alias cc='compass clean'
alias cw='compass watch'
alias becc='bundle exec compass compile'


#Grab my IP address

alias myip='dig +short myip.opendns.com @resolver1.opendns.com'


#Drush 5.9 Fix - Use the proper PHP
export DRUSH_PHP=/Applications/MAMP/bin/php/php5.4.4/bin/php
export PATH=/usr/local/bin:$PATH

#Add Node JS to the path
export PATH=/usr/local/share/npm/bin:$PATH

