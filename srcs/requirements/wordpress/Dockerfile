FROM debian:bookworm

# 1. On installe PHP (la version 8.2 est celle par défaut sur Bookworm) et les outils pour télécharger
RUN apt update && apt upgrade -y && \
    apt install -y php-fpm php-mysql wget curl default-mysql-client

# 2. On copie ton fichier de configuration PHP à la bonne place
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# 3. On crée le dossier qui va contenir les fichiers de ton site web
RUN mkdir -p /var/www/wordpress

# 4. On crée le dossier temporaire pour que PHP puisse s'exécuter correctement
RUN mkdir -p /run/php

# 5. On copie le script d'installation automatisée
COPY tools/wp.sh /usr/local/bin/wp.sh
RUN chmod +x /usr/local/bin/wp.sh

# 6. On ouvre le port 9000 pour discuter avec NGINX
EXPOSE 9000

# 7. On lance le script au démarrage
CMD ["wp.sh"]
