# JumpServer with certbot and nginx proxy


## Usage
* certbot challenge by http-01
* must fill environments in .env file
  * DOMAINS
    * domains now only support one domain
  * EMAIL
    * email for certbot
* already dump all database in version v3.10.9, can skip upgrade db

run install.sh to auto start

## Infos

### [JumpServer](https://docs.jumpserver.org/zh/v3/)
### [JumpServer Docker](https://github.com/jumpserver/Dockerfile)
### [JumpServer Proxy](https://docs.jumpserver.org/zh/master/admin-guide/proxy/#1-nginx-ssl)

## Other

### default version

* Nginx: 1.25-alpine
* certbot: v2.10.0
* Mysql: 8
* redis: 7.2.2-alpine

## NOTICE
if start second time, can only run script
```shell
docker compose -f docker-compose.yaml -f docker-compose-proxy.yaml up -d
```