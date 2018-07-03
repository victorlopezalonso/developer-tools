# Laravel

### Dependencies

	brew update
	brew upgrade
	brew doctor
	brew install composer php-cs-fixer php-code-sniffer nginx php72 dnsmasq mysql node yarn
    brew services start mysql

### MySQL 8 fix for "caching_sha2_password..."

	subl /usr/local/etc/my.cnf
	add this line to [mysqld] section -> default_authentication_plugin=mysql_native_password
	mysql -uroot
	ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';
	reboot system

### Valet

	composer global require laravel/valet
	valet install
	valet domain test
	valet park <projects_dir>
