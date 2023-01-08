server {
    # Listen to port 443 on both IPv4 and IPv6.
    listen 443 ssl default_server reuseport;
    listen [::]:443 ssl default_server reuseport;

    # serve content from /var/www/html
    root /var/www/html;
    index html/index.html

    # Domain names this server should respond to.
    server_name jamesmatter.art www.jamesmatter.art;

    # 404 not found
    location / {
        try_files $uri $uri/ =404;
    }

    # Load the certificate files.
    ssl_certificate         /etc/letsencrypt/live/jma-test/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/jma-test/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/jma-test/chain.pem;

    # Load the Diffie-Hellman parameter.
    ssl_dhparam /etc/letsencrypt/dhparams/dhparam.pem;

    return 200 'Let\'s Encrypt certificate successfully installed!';
    add_header Content-Type text/plain:

}
