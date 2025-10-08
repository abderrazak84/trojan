# استخدم صورة خفيفة من ألباين
FROM alpine:latest

# فتح المنفذ المستخدم في config.json
EXPOSE 8080

# مجلد العمل داخل الحاوية
WORKDIR /app

# تثبيت الأدوات الأساسية وتنزيل v2ray
RUN apk add --no-cache wget unzip \
    && wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip v2ray-linux-64.zip -d /app \
    && rm v2ray-linux-64.zip

# نسخ ملف إعداد trojan-ws
COPY config.json /app/config.json

# تشغيل v2ray باستخدام ملف الإعداد
ENTRYPOINT ["./v2ray", "run", "-config", "config.json"]

