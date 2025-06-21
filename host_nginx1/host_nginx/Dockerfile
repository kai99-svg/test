FROM nginx:alpine ##apply the nginx version

COPY nginx.conf /etc/nginx/nginx.conf ##Copy from source to destination

COPY touch/ /usr/share/nginx/html/touch/ ##copy

COPY ssl/ /etc/nginx/ssl/

EXPOSE 443
