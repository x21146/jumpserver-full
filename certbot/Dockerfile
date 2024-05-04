FROM certbot/certbot:v2.10.0

RUN apk add inotify-tools

WORKDIR /letsencrypt

COPY --chmod=777 ./run.sh ./run.sh

ENTRYPOINT ./run.sh