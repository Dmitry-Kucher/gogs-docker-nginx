#!/bin/sh

initenvs() {
    if [ ! -f ./config/postgres-envs ]; then
        echo "./config/postgres-envs not found! Create file with POSTGRES environment variables"
        exit 1
    fi
    . ./config/postgres-envs
}

startgogs() {
    if [ ! -f docker-compose.dev.yml ]; then
        echo "docker-compose.dev.yml not found! Start gogs from directory with docker-compose files"
        exit 1
    fi
    docker-compose -f docker-compose.dev.yml up -d
}

stopgogs() {
    docker-compose stop
}

initenvs

case "$1" in
    start)   startgogs ;;
    stop)    stopgogs ;;
    restart) stopme; startme ;;
    *) echo "usage: $0 start|stop|restart" >&2
       exit 1
       ;;
esac
