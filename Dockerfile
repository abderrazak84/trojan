FROM alpine:latest

# فتح المنفذ
EXPOSE 8080

# مجلد العمل
WORKDIR /app

# تثبيت wget و unzip
RUN apk add --no-cache wget unzip

# تنزيل وتشغيل v2ray
RUN wget -O v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip v2ray.zip -d /app \
    && chmod +x /app/v2ray \
    && rm v2ray.zip

# نسخ ملف الإعداد
COPY config.json /app/config.json

# تشغيل السيرفر
ENTRYPOINT ["/app/v2ray", "run", "-config", "/app/config.json"]

