#/sbin/bash
#########################################################
# script d'installation  par sbeteta@beteta.org         #
#########################################################

# installation des dependances fonctionnelles 
echo " installation des dependances fonctionnelles"
apt-get install apache2 libapache2-mod-php mariadb-server php-xml php-cli php-cgi php-mysql php-mbstring php-gd php-curl php-zip wget unzip -y
clear

# on relance apache et mariadb
echo "on relance apache et mariadb"
/etc/init.d/apache2 restart
/etc/init.d/mysql restart

# creation de la base de données
echo "creation de la base de données"
mysql -u root -e "create database nextclouddb;"
mysql -u root -e "grant all privileges on nextclouddb.* to 'usernextcloud'@'localhost' identified by 'operations';"
mysql -u root -e "flush privileges;"

# téléchargement de NextCloud
echo "Téléchargement de NextCloud... please wait !"
wget https://download.nextcloud.com/server/releases/nextcloud-22.2.3.zip

# Dezippe de l'archive
echo "On dezippe l'archive..."
unzip nextcloud-22.2.3.zip
clear

# on déplace Nextcloud dans /var/www/html
echo "on déplace Nextcloud dans /var/www/html"
mv nextcloud /var/www/html
clear

# On met les droits sur le dossier nextcloud
echo "On met les droits sur le dossier nextcloud"
chown -R www-data:www-data /var/www/html/nextcloud
echo " Installation de Nextcloud terminé !"
