#!/bin/zsh

#--------------------------------------------------------
# Theme
#--------------------------------------------------------
prompt_context() {
  # Custom prompt (Random emoji)
  emojis=("⚡️" "😎" "🚀")
  RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1))
  prompt_segment black default "${emojis[$RAND_EMOJI_N]} "
}

#--------------------------------------------------------
# Paths
#--------------------------------------------------------
export PATH=~/.composer/vendor/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH="/usr/local/opt/php@7.3/bin:$PATH"'
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"'

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/apache-maven-3.6.0/bin

#--------------------------------------------------------
# Terminal
#--------------------------------------------------------
plugins=(brew colored-man colorize github osx zsh-syntax-highlighting zsh-autosuggestions)
export EDITOR='subl -w'
alias cl="clear && printf '\e[3J'"
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

#--------------------------------------------------------
# React Native
#--------------------------------------------------------
alias rn="npx react-native"

# android
alias emu="emulator -avd"
alias aemus="emulator -list-avds"
alias shake="adb shell input keyevent KEYCODE_MENU"
alias rnra="recompile-android && npx react-native run-android"
alias rnba="recompile-android && cd android && ./gradlew assembleDebug && cd .."
alias rnbar="recompile-android && cd android && ./gradlew assembleRelease && cd .."
alias recompile-android="react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res"

#ios
alias iemus="xcrun simctl list devices"
alias rnisim="react-native run-ios --simulator="
alias rnri="npx react-native run-ios"
alias record="xcrun simctl io booted recordVideo"

#--------------------------------------------------------
# Git
#--------------------------------------------------------
# delete merged local branches
alias gcu="git branch --merged | egrep -v 'master|develop|development' | xargs git branch -d"
alias gitapprove="gapprove develop"
alias gitwho="git config --local -l"
alias nah="git reset --hard;git clean -df;"

function gitcommit() 
{ 
	if [[ $1 ]]; then
		git add . 
		git commit -m $1
	else
		echo 'please write a commit message as the first param';
	fi
}

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

#--------------------------------------------------------
# Laravel
#--------------------------------------------------------
alias pa="php artisan"

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

composer-link() {  
    composer config repositories.local '{"type": "path", "url": "'$1'"}' --file composer.json
}

#--------------------------------------------------------
# Third party
#--------------------------------------------------------
alias mp3from="youtube-dl -x --audio-format 'mp3' --audio-quality '320K' --embed-thumbnail -o '%(title)s.%(ext)s' --metadata-from-title \"(?P<artist>.+?) - (?P<title>.+)\" "
