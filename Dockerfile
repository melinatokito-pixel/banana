FROM alpine:3.19
RUN apk add --no-cache curl unzip ca-certificates
RUN curl -fsSL "https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip" -o /tmp/xray.zip \
    && unzip /tmp/xray.zip xray -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/xray \
    && rm -rf /tmp/xray.zip
RUN mkdir -p /etc/xray
COPY config.json /etc/xray/config.json
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/bin/sh", "/start.sh"]
