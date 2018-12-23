# shellbro/dropbox

[![](https://img.shields.io/docker/build/shellbro/dropbox.svg)](https://hub.docker.com/r/shellbro/dropbox/)

Dropbox in a (Docker) container.

Running Dropbox in a container is a solution for running Dropbox on "older"
Linux systems thanks to container portability. At the end of 2018 Dropbox team
dropped support for Linux operating systems that use `glibc < 2.19` and this
affects CentOS 7 which ships with `glibc 2.17`. This container image is based on
Fedora 29 (the latest Fedora release as of this writing) which runs with much
newer `glibc 2.28`.

# Docker Hub

This image uses automated build service offered by Docker Hub.

https://hub.docker.com/r/shellbro/dropbox/

# Quick start

```
docker run --name=dropbox -d --log-driver=journald --restart=always shellbro/dropbox
```

After container creation see `docker logs dropbox` to link your Dropbox account.

# Store files on the host

Note: replace `/home/shellbro/Dropbox` example path with the host path you would
like to use.

```
docker run --name=dropbox -d -v /home/shellbro/Dropbox:/home/dropbox-user/Dropbox --log-driver=journald --restart=always shellbro/dropbox
```

# Check Dropbox status

```
docker exec -ti -e "LANG=en_US.UTF-8" dropbox /home/dropbox-user/bin/dropbox status
```

You might want to put the following shell alias in your `~/.bashrc` file:

```
alias dropbox='sudo docker exec -ti -e "LANG=en_US.UTF-8" dropbox /home/dropbox-user/bin/dropbox'
```

and simply use it like:

```
dropbox status
```
