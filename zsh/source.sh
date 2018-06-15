#!/bin/zsh

export PATH=~/.composer/vendor/bin:$PATH

#powerlevel9k Theme
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print_icon "LEFT_SUBSEGMENT_SEPARATOR") "
POWERLEVEL9K_CONTEXT_TEMPLATE=whoami
POWERLEVEL9K_HOME_ICON=$'\UE12C '

#plugins
# plugins=(colored-man colorize github jira vagrant virtualenv pip python osx zsh-syntax-highlighting zsh-autosuggestions)
plugins=(colored-man colorize github osx zsh-syntax-highlighting zsh-autosuggestions)

#sublime as default editor
export EDITOR='subl -w'

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Aliases
alias cl="clear && printf '\e[3J'"
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias nah="git reset --hard;git clean -df;"
alias gitapprove="gapprove develop"
# alias glog="git log --pretty=format:'%h - %an, %ar : %s'"

function gitpush() 
{ 
	if [[ $1 ]]; then
		branch="$(git rev-parse --abbrev-ref HEAD)"
		git add . 
		git commit -m $1
		git push --set-upstream origin ${branch}
	else
		echo 'please write a commit message as the first param';
	fi
}

function gapprove()
{
	if [[ $1 ]]; then
		branch="$(git rev-parse --abbrev-ref HEAD)"
		git checkout $1
		git branch -D ${branch}
		git pull --prune
	else
		echo 'please enter source branch for correct execution';
	fi
}

function apicontroller()
{
	php artisan make:controller $1 --api
}

function apirequest()
{
	php artisan make:request Api/$1
}

function apiresource()
{
	php artisan make:resource Api/$1
}

function admincontroller()
{
	php artisan make:controller Admin/$1 --api
}

function adminrequest()
{
	php artisan make:request Admin/$1
}

function adminresource()
{
	php artisan make:resource Admin/$1
}