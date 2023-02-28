FROM nginx:latest

LABEL maintainer="AllenChou <f1470891079@gmail.com>"

RUN apt-get update -y && \
    apt-get install inotify-tools -y

# Nginx config
COPY ./nginx_config/nginx.conf  /etc/nginx/nginx.conf
COPY ./nginx_config/http/  /etc/nginx/conf.d/
COPY ./nginx_config/stream/  /etc/nginx/stream.conf.d/

# Nginx entrypoint
COPY ./index.html /var/www/html/index.html
COPY ./nginx-docker-entrypoint.sh /docker-entrypoint.d/docker-entrypoint.sh
COPY ./nginx-reloader.sh /nginx/nginx-reloader.sh
RUN rm /etc/nginx/conf.d/default.conf

EXPOSE 11578
