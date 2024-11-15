get cetificate: sudo docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ -d processorci.ic.unicamp.br

renew:
sudo docker compose run --rm certbot renew

reload nginx:

sudo docker compose exec nginx nginx -s reload