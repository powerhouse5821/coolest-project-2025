FROM nginx:latest

COPY ./dist/html/. /usr/share/nginx/html/

# Optionally copy nginx.conf if you have custom configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80