ARG NODE_VERSION=16.20.2
ARG ALPINE_VERSION=3.19.1

FROM node:${NODE_VERSION}-alpine AS node

FROM alpine:${ALPINE_VERSION}

# Sử dụng hình ảnh gốc từ ghcr.io
FROM ghcr.io/pterodactyl/panel:latest

# Đặt môi trường và cấu hình
ENV APP_ENV=production
ENV APP_ENVIRONMENT_ONLY=false
ENV APP_DEBUG=true
ENV APP_URL=http://nhinguyenmc.ddns.net
ENV APP_TIMEZONE="Asia/Ho_Chi_Minh"
ENV APP_KEY=y1gOUtQKhBqouzVORzx9OFbF7Lyvimlq
ENV HASHIDS_SALT=contackemauxanhmaudo
ENV DB_CONNECTION=mysql
ENV DB_HOST=db
ENV DB_PORT=3306
ENV DB_DATABASE=pterodactyl
ENV DB_USERNAME=sa
ENV DB_PASSWORD=sapassword
ENV REDIS_HOST=redis
ENV REDIS_PORT=6379
ENV CACHE_DRIVER=redis
ENV SESSION_DRIVER=redis
ENV QUEUE_DRIVER=redis

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

RUN node -v
RUN npm install -g yarn --force
RUN yarn -v

# Đặt thư mục làm việc
# WORKDIR /app

# Khối lệnh để copy plugin vào thư mục /app
# COPY ./addons/plugin-manager/* .
# RUN yarn
# RUN npx --yes --unsafe-perm=true update-browserslist-db@latest
# RUN yarn build:production

# Expose các cổng mà ứng dụng sẽ chạy
EXPOSE 80 443

# Đặt lệnh khởi động mặc định
# COPY ./init.sh /app/init.sh
# RUN chmod +x /app/init.sh
# ENTRYPOINT ["/bin/sh", "./init.sh"]
CMD [ "supervisord", "-n", "-c", "/etc/supervisord.conf" ]