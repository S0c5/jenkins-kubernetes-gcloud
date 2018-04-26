FROM nginx:latest
COPY ./nginx.conf.tpl /etc/nginx/conf.d/default.conf.tpl
CMD /bin/bash -c  "envsubst '\$HOST_NAME \$APP_PORT' < /etc/nginx/conf.d/default.conf.tpl > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"