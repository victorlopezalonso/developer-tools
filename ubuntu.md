### LAMP Server

Install Apache module

    sudo apt update && sudo apt install -y apache2

Install PHP and dependencies

    sudo apt update && sudo apt install -y php libapache2-mod-php php-mcrypt php-mysql php-mbstring php-xml php-curl

Install mysql server

    sudo apt update && sudo apt install -y mariadb-server

### Set up MySQL

Enable remote access to MySQL

	nano /etc/mysql/my.cnf
	# add this line
	bind-address = 0.0.0.0

	systemctl restart mariadb

Manage MySQL user
	
    # log in to MySQL server
	sudo mysql -u root -p (sudo mariadb)

    # list of users
	SELECT user,authentication_string,plugin,host FROM mysql.user;

    # Grant permissions to user
	GRANT ALL ON *.* TO 'username' IDENTIFIED BY 'password' WITH GRANT OPTION;

    # Refresh permissions
	FLUSH PRIVILEGES;

### Set up Apache

    sudo chown -R $USER /var/www

    #add index.php to /var/www/html to check apache and php info
    <?php phpinfo(); ?>

    sudo systemctl restart apache2

    #add current user to www-data group
    sudo adduser $USER www-data
    sudo usermod -a -G www-data <user>

    #show groups
    id <user>
    groups <user>

### RSA

Generate RSA Key for ssh user

	ssh-keygen -t rsa
	cat ~/.ssh/id_rsa.pub

Generate RSA Key for www-data user

	cd /var/www
	mkdir .ssh
	sudo chown -R www-data:www-data .ssh
	sudo -u www-data ssh-keygen -t rsa

Add public keys to git server
	
	cat ~/.ssh/id_rsa.pub
	cat /var/www/.ssh/id_rsa.pub

Pull the project from the repo using www-data

	cd /var/www/<project-name>
	sudo -u www-data git pull
    
    # Respond "yes" when asked to add host to the list of known hosts

If you can't execute commands as www-data account

    # create a config file into the www-data ssh folder
	sudo nano cat /var/www/.ssh/config

	# Add these lines
		Host bitbucket.org
		User git
		IdentityFile ~/.ssh/id_rsa

    # Change the file owner to be www-data
	sudo chown www-data:www-data /var/www/.ssh/config

### git

Install

    sudo apt install -y git

Ignore file permission changes

    # For a project
    git config core.filemode false

    # For all projects
    git config --global core.fileMode false

### composer

install

    sudo apt install -y curl
    cd ~
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    sudo chmod +x /usr/local/bin/composer

Add folder to www-data home to execute composer using the Apache user

    mkdir /var/www/.config
    sudo chown -R www-data:www-data /var/www/cache

### Apache Virtual Host

Add virtual host for Laravel project
		
        sudo nano /etc/apache2/sites-available/example.com.conf

        ## example.com.conf start
		<VirtualHost *:80>
		    ServerName project-name.com
		    DocumentRoot /var/www/<project-name>/public
		    ErrorLog ${APACHE_LOG_DIR}/<project-name>-error.log
		    
		    <Directory /var/www/<project-name>/>
		        Options -Indexes
		        AllowOverride All
		    </Directory>

		</VirtualHost>
        ## example.com.conf end

Activate virtual host

		cd /etc/apache2/sites-available
		a2ensite example.com.conf

Deactivate default host

		sudo a2dissite 000-default.conf
	
Reload apache

		service apache2 reload

Add alias to hosts

		sudo nano /etc/hosts
		127.0.0.1 example.com

### oh my zsh

Install

    sudo apt install -y zsh git-core

    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

Activate

    chsh -s `which zsh`

### Laravel permissions

Change owner of app folder

    cd /www/var/<project-name>
    sudo chown -R $USER:www-data storage
    sudo chown -R $USER:www-data bootstrap/cache
    sudo chown -R $USER:www-data .git

Assing directories and files permissions

    find /var/www -type d -exec sudo chmod 2775 {} + 
    find /var/www -type f -exec sudo chmod 0664 {} + 

Change storage and bootstrap/cache folder permissions

    sudo chmod -R 775 storage
    sudo chmod -R 775 bootstrap/cache

### Init Laravel project

Update environment variables

    cp .env.example .env
    nano .env

Install dependencies and

    composer install

Generate app key

    php artisan key:generate

Create symbolic link to storage folder
    
    php artisan storage:link

Run migrations

    php artisan migrate --force

Run seeds

    php artisan db:seed

## Deploy script for Laravel

    # Make this script executable on your server with
    # sudo chmod +x deploy.sh

    # Turn on maintenance mode
    php artisan down || true

    # Pull the latest changes from the git repository
    # git reset --hard
    # git clean -df
    git pull

    # Install/update composer dependecies
    # --no-interaction Do not ask any interactive question
    # --no-dev  Disables installation of require-dev packages.
    # --prefer-dist  Forces installation from package dist even for dev
    cd $PWD && export COMPOSER_HOME=/var/www/.config/composer && composer install --no-interaction --no-dev --prefer-dist --optimize-autoloader

    # Run database migrations
    php artisan migrate --force

    # Clear caches
    php artisan cache:clear

    # Clear caches
    php artisan config:clear

    # Clear expired password reset tokens
    php artisan auth:clear-resets

    # Clear and cache views
    php artisan view:cache

    # Clear and cache routes (not working for closures)
    #php artisan route:cache

    # Clear and cache config (works only if you are calling the env function from within your configuration files)
    # php artisan config:cache

    # Install node modules
    # npm ci

    # Build assets using Laravel Mix
    # npm run production

    # Turn off maintenance mode
    php artisan up

    echo 'Deploy finished.'

### Helpful commands

    # log as www-data user
    sudo -u www-data sh

    # execute command as www-data user
    sudo -u www-data <command>
    
    # restart
    sudo reboot

    # set ubuntu locale
    sudo update-locale LANG=LANG=es_ES.UTF-8 LANGUAGE
