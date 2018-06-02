# Laravel

### Dependencies

	brew update
	brew upgrade
	brew doctor
	brew install composer php-cs-fixer nginx php72 dnsmasq mysql node yarn
    brew services start mysql

### Valet

	composer global require laravel/valet
	valet install
	valet domain test
	valet park <projects_dir>
