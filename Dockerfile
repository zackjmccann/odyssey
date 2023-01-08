FROM nginx:1.23.2
COPY ./client//var/www/html usr/share/nginx/html
RUN apt-get update && apt-get install -y procps
