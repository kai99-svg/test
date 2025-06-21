FROM nginx:alpine ##apply the nginx version

COPY nginx.conf /etc/nginx/nginx.conf ##Copy from source to destination

COPY touch/ /usr/share/nginx/html/touch/ ## Copy from s to d

COPY ssl/ /etc/nginx/ssl/

EXPOSE 443
