FROM debian:bookworm

RUN apt update && apt upgrade -y && \
    apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Normandie/L=Le Havre/O=42/OU=42/CN=abensaid.42.fr/UID=abensaid"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
