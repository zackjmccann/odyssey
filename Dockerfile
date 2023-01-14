FROM nginx:1.23.2

# Copy nginx configurations
COPY *.conf /etc/nginx/conf.d/

# Copy Web content
COPY html/* /var/www/html/