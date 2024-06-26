#/sbin/bash
#########################################################
# script d'installation  par sbeteta@beteta.org         #
#########################################################

# Maj de Debian
echo "Maj de votre Debian... please wait ! "
sleep 3
apt update -y && apt upgrade -y
clear

# installation des dependances fonctionnelles 
echo " Installation des dependances fonctionnelles"
sleep 3
apt-get install apache2 libapache2-mod-php mariadb-server php-xml php-cli php-cgi php-mysql php-mbstring php-gd php-curl php-zip wget unzip -y
clear

# on relance apache et mariadb
echo "on relance apache et mariadb"
sleep 3
/etc/init.d/apache2 restart
/etc/init.d/mysql restart

# creation de la base de données
echo "creation de la base de données"
sleep 3
mysql -u root -e "create database nextclouddb;"
mysql -u root -e "grant all privileges on nextclouddb.* to 'usernextcloud'@'localhost' identified by 'operations';"
mysql -u root -e "flush privileges;"

# téléchargement de NextCloud
echo "Téléchargement de NextCloud... please wait !"
sleep 3
curl -o nextcloud.zip https://download.nextcloud.com/server/releases/latest.zip

# Dezippe de l'archive
echo "On dezippe l'archive..."
sleep 3
unzip nextcloud.zip
clear

# on déplace Nextcloud dans /var/www/html
echo "on déplace Nextcloud dans /var/www/html"
sleep 3
mv nextcloud /var/www/html
clear

# On met les droits sur le dossier nextcloud
echo "On met les droits sur le dossier nextcloud"
sleep 3
chown -R www-data:www-data /var/www/html/nextcloud
echo " Installation de Nextcloud terminé !"
