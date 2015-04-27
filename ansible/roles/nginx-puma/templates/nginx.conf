user {{nginx_user}} {{nginx_group}};
worker_processes  {{nginx_workers}};
pid /var/run/nginx.pid;

events {
  worker_connections {{nginx_connections}};
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format main '$remote_addr - $remote_user [$time_local] '
                    '"$request" $status  $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';

    sendfile            on;
    keepalive_requests  {{nginx_keepalive_requests}};
    keepalive_timeout   {{nginx_keepalive_timeout}};
    tcp_nodelay         off;
    tcp_nopush          on;

    server_tokens off;
    client_header_timeout 60;
    client_body_timeout 60;
    ignore_invalid_headers on;
    send_timeout 60;
    server_name_in_redirect off;
    server_names_hash_bucket_size 128;

    gzip  on;
    gzip_http_version 1.0;
    gzip_comp_level 6;
    gzip_proxied any;
    gzip_types  text/plain text/css application/x-javascript text/xml
                application/xml application/xml+rss text/javascript
                image/svg+xml;
    gzip_disable "MSIE [1-6] \.";

    include /etc/nginx/sites-avaliable/*;
}

