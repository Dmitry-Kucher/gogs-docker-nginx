# Dockerized [gogs](https://gogs.io/) with nginx and postgreSQL

Repository contains executable `gogs-shell.sh` file, which help to automate startup of your own instance [gogs](https://gogs.io)

## The simplest way to startup gogs-server

By default you can simply run:

1. `git clone https://github.com/Dmitry-Kucher/gogs-docker-nginx.git`
1. `cd gogs-docker-nginx`
1. `./gogs-shell.sh start`

 > **WARNING**: The simplest way will work only if you have no running any _webserver_ on `80` port
 
 To stop `gogs-server` just run:
 `./gogs-shell.sh stop` from `gogs-docker-nginx` path
 
 