# shellbro/dropbox

Dropbox in a container.

Running Dropbox in a container is a solution for running Dropbox on "older"
Linux systems thanks to container portability. At the end of 2018 Dropbox team
dropped support for Linux operating systems that use `glibc < 2.19` and this
affects CentOS 7 which ships with `glibc 2.17`. This container image is based on
Fedora 29 (the latest Fedora release as of this writing) which runs with much
newer `glibc 2.28`.

# Docker Hub

This image uses automated build service offered by Docker Hub.

https://hub.docker.com/r/shellbro/dropbox/

# Quickstart

```
docker run -d --name=dropbox --restart=always --log-driver=journald shellbro/dropbox
```

# Store files on the host

Note: replace `/home/shellbro/Dropbox` example path with the host path you would
like to use.

```
docker run -d --name=dropbox --restart=always --log-driver=journald -v /home/shellbro/Dropbox:/home/dropbox-user/Dropbox shellbro/dropbox
```

# Check Dropbox status

```
docker exec -it dropbox /home/dropbox-user/bin/dropbox status
```
