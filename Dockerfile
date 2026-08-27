FROM alpine:3.18

# نصب ابزارهای مورد نیاز برای اجرای پنل
RUN apk update && apk add --no-cache \
    curl \
    wget \
    bash \
    tzdata \
    ca-certificates

# دانلود و نصب خودکار پنل 3X-UI
RUN wget -N https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh && \
    bash install.sh <<< "y"

EXPOSE 2053 8080

# دستور اجرای پنل هنگام استارت کانتینر
CMD ["/usr/local/x-ui/bin/x-ui"]
