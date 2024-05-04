#!/bin/sh

email=$EMAIL
if [ ! -z "$email" ]; then
email="--email $email"
fi
domains=$DOMAINS

readDomains() {
  IFS=','
  for l in $domains; do
    if [ -z "$l" ]; then
      continue
    fi

    cert $l
  done
}

cert() {
  echo $1
  certbot certonly --standalone $email --agree-tos --preferred-challenges http -d $1
}

while true; do
  readDomains
  sleep $WAIT_TIME
  # inotifywait --timeout $WAIT_TIME $domainFile
done