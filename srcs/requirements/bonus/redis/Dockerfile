FROM alpine:3.10

RUN apk add redis

COPY tools/script.sh /
COPY conf/redis.conf /etc/

RUN chmod +x script.sh

EXPOSE 6379

ENTRYPOINT ["./script.sh"]