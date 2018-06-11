#!/bin/sh

initdevs() {
    if [ ! -f ./config/devs-envs ]; then
        echo "./config/devs-envs not found! Create file with DEVS environment variables"
        exit 1
    fi
    . ./config/devs-envs
}

initpostgres() {
    if [ ! -f ./config/postgres-envs ]; then
        echo "./config/postgres-envs not found! Create file with POSTGRES environment variables"
        exit 1
    fi
    . ./config/postgres-envs
}

initcustoms() {
    if [ -f ./config/custom-envs ]; then
        . ./config/custom-envs
        echo "Custom ENVS loaded"
    fi
}

initenvs() {
    initdevs
    initpostgres
    initcustoms

}

startgogs() {
    if [ ! -f ${DOCKER_COMPOSE_FILE} ]; then
        echo "${DOCKER_COMPOSE_FILE} not found! Start gogs from directory with docker-compose files"
        exit 1
    fi
    docker-compose -f ${DOCKER_COMPOSE_FILE} up -d
}

stopgogs() {
    docker-compose -f ${DOCKER_COMPOSE_FILE} stop
}

downgogs() {
    docker-compose -f ${DOCKER_COMPOSE_FILE} down
}

initenvs

case "$1" in
    start)   startgogs ;;
    stop)    stopgogs ;;
    down)    downgogs ;;
    restart) downgogs; startgogs ;;
    *) echo "usage: $0 start|stop|restart|down" >&2
       exit 1
       ;;
esac
