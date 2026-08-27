FROM alpine:3.18

RUN apk update && apk add --no-cache bash curl wget tzdata ca-certificates openssl

WORKDIR /app

RUN wget https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh -O install.sh && \
    chmod +x install.sh && \
    yes y | bash install.sh

EXPOSE 2053 8080

CMD ["/usr/local/x-ui/bin/x-ui"]
