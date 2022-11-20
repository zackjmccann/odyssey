server {
    # web server configuration
    listen 443 ssl;

    # serve normal request from /var/www/html
    root /var/www/html;
    index index.html;
    server_name jamesmatter.art www.jamesmatter.art;

    # 404 for not found
    location / {
        try_files $uri $uri/ =404;
    }

    # /msf gets redirected to backend framework
    location /msf {
        proxy_pass https://__IP__:9910;
        proxy_ssl_verify off;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For #proxy_add_x_forwarded_for;
    }

    # Load the certificate files
    ssl_certificate         /etc/letsencrypt/live/canned-test/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/canned-test/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/canned-test/chain.pem;

    # Load the Diffie-Hellman parameter.
    ssl_dhparam /etc/letsencrypt/dhparams/dhparam.pem;

    return 200 'Let\'s Encrypt certificate successfully installed!';
    add_header Content-Type text/plain;
}

