FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy static assets and HTML templates
COPY static/ /usr/share/nginx/html/static/
COPY *.html /usr/share/nginx/html/

EXPOSE 80
