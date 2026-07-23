#!/bin/bash

# On va dans le dossier vide qu'on a créé pour le site
cd /var/www/wordpress

# On télécharge WP-CLI (l'installateur automatique) et on le rend exécutable
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# On télécharge les fichiers du site WordPress
wp core download --allow-root

# On connecte WordPress à MariaDB en utilisant les mots de passe de ton .env
wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --allow-root

# On installe le site et on crée ton compte administrateur principal
wp core install --url=$DOMAIN_NAME --title="Inception abensaid" --admin_user=$SQL_USER --admin_password=$SQL_PASSWORD --admin_email="admin@abensaid.42.fr" --allow-root

# On crée un 2ème utilisateur classique (souvent exigé par les correcteurs 42)
wp user create abensaid_user user@abensaid.42.fr --role=author --user_pass=motdepasse123 --allow-root

# On lance PHP en premier plan pour garder la boîte allumée (équivalent du daemon off)
exec /usr/sbin/php-fpm8.2 -F
