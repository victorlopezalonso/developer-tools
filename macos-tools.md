# MacOS tools for development

1. [Homebrew](#homebrew)
2. [Sublime Text](#sublime-text)
3. [iTerm](#iterm)
4. [Oh My Zsh](#oh-my-zsh)
5. [PHP Storm](#phpstorm)

# Homebrew
[https://brew.sh/index_es](https://brew.sh/index_es)

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew upgrade
	brew doctor

# Sublime Text
[https://www.sublimetext.com/3](https://www.sublimetext.com/3)

##### Install Materialize Theme

1. <kbd>cmd</kbd>+<kbd>shift</kbd>+<kbd>P</kbd> -> `Install Package Control`
2. <kbd>cmd</kbd>+<kbd>shift</kbd>+<kbd>P</kbd> -> `Package Control: Install Package` -> Search for `Material Theme`
3. <kbd>cmd</kbd>+<kbd>shift</kbd>+<kbd>P</kbd> -> `Material Theme: Activate theme`

##### Copy your keymap and preferences

	cp sublime/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
	cp sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

##### Install Markdown preview and live reload

1. <kbd>cmd</kbd>+<kbd>shift</kbd>+<kbd>P</kbd> -> `Package Control: Install Package` -> Search for `Markdown Preview`
2. <kbd>cmd</kbd>+<kbd>shift</kbd>+<kbd>P</kbd> -> `Package Control: Install Package` -> Search for `LiveReload`
3. <kbd>cmd</kbd>+<kbd>shift</kbd>+<kbd>P</kbd> -> `LiveReload: Enable/disable plug-ins` -> Select `Simple Reload with delay (400ms)`
4. <kbd>cmd</kbd>+<kbd>shift</kbd>+<kbd>P</kbd> -> `Key Bindings`-> add this line
	`{"enable_autoreload": true}`

# iTerm

##### install from download page

https://www.iterm2.com/downloads.html

##### install using brew

	brew cask install iterm2
	
##### install Powerline fonts

    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

##### preferences

	preferences -> general -> Deactivate "Native full screen windows"
	preferences -> profiles -> colors -> color presets -> Solarized Dark
	preferences -> profiles -> text -> change font -> 15pt Meslo LG M Regular for Powerline
	preferences -> profiles -> window -> Columns: 150 | Rows: 30
	preferences -> keys -> Activate Show/hide all windows whith a system-wide hotkey -> alt + F12

# Oh My Zsh

##### install on Mac

	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

##### install on Ubuntu

	apt-get install zsh
	apt-get install git-core

	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
	chsh -s `which zsh`
	sudo shutdown -r 0

##### Powerlevel9k theme

	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
	cp zsh/source.sh ~/source.sh
	echo "source ~/source.sh" >> ~/.zshrc
	Change "ZSH_THEME" in ~/.zshrc -> ZSH_THEME="powerlevel9k/powerlevel9k"

##### Change default shell to zsh

	chsh -s $(which zsh)

##### tweaks

highlighting

	brew install zsh-syntax-highlighting

open in sublime

	ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# PHPStorm

[http://www.jetbrains.com/phpstorm/eap/](http://www.jetbrains.com/phpstorm/eap/)

##### import settings

`Go to File -> import settings -> select "phpstorm/phpstorm-settings.jar"`
