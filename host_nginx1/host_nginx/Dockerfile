FROM nginx:alpine ##apply the nginx version

COPY nginx.conf /etc/nginx/nginx.conf

COPY touch/ /usr/share/nginx/html/touch/

COPY ssl/ /etc/nginx/ssl/

EXPOSE 443
