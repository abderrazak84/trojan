FROM alpine:latest

EXPOSE 8080
WORKDIR /app

RUN apk add --no-cache wget unzip \
    && wget -O v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.20.1/v2ray-linux-64.zip \
    && unzip v2ray.zip -d /app \
    && chmod +x /app/v2ray \
    && rm v2ray.zip

COPY config.json /app/config.json

ENTRYPOINT ["/app/v2ray", "run", "-config", "/app/config.json"]
