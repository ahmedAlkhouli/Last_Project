FROM nginx:alpine

# Copy Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy static assets (CSS/JS)
COPY static/ /usr/share/nginx/html/static/

EXPOSE 80
