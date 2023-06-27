#/sbin/bash
#########################################################
# script d'installation auomatisé par sbeteta@beteta.org#
#########################################################

# installation des dependances fonctionnelles 
apt-get install apache2 libapache2-mod-php mariadb-server php-xml php-cli php-cgi php-mysql php-mbstring php-gd php-curl php-zip wget unzip -y

# on relance apache et mariadb
/etc/init.d/apache2 restart
/etc/init.d/mysql restart

# creation de la base de données
mysql -u root -e "create database nextclouddb;"
mysql -u root -e "grant all privileges on nextclouddb.* to 'usernextcloud'@'localhost' identified by 'operations';"
mysql -u root -e "flush privileges;"

# téléchargement de NextCloud
wget https://download.nextcloud.com/server/releases/nextcloud-22.2.3.zip

# Dezippe de l'archive
unzip nextcloud-22.2.3.zip

# on déplace Nextcloud dans /var/www/html
mv nextcloud /var/www/html

# On met les droits sur le dossier nextcloud 
chown -R www-data:www-data /var/www/html/nextcloud
