# shellbro/dropbox

[![](https://img.shields.io/docker/build/shellbro/dropbox.svg)](https://hub.docker.com/r/shellbro/dropbox/)

Dropbox in a (Docker) container.

Running Dropbox in a container is an easy solution for running Dropbox on
older Linux systems thanks to container portability. At the end of 2018 Dropbox
team dropped support for Linux operating systems that use `glibc < 2.19` and
this affects CentOS 7 which ships with `glibc 2.17`. This container image is
based on Fedora 29 (the latest Fedora release as of this writing) which runs
with much newer `glibc 2.28`.

# Docker Hub

This image uses automated build service offered by Docker Hub.

https://hub.docker.com/r/shellbro/dropbox/

# Quick start (store files inside a container)

```
docker run --name=dropbox -d --log-driver=journald --restart=always shellbro/dropbox
```

After container creation see `docker logs dropbox` to link your Dropbox account.

# Quick start (store files on the host)

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
alias dropbox='docker exec -ti -e "LANG=en_US.UTF-8" dropbox /home/dropbox-user/bin/dropbox'
```

and simply use it like:

```
dropbox status
```

# Auto-update issue

Unfortunately, it happens that Dropbox tries to uppdate itself inside
a container periodically but that process fails when running inside a container.
You can see when this happens by running `dropbox status` or
`docker logs dropbox` command. The only workaround I know about at the moment
is to follow the procedure of manual Dropbox update from the section below.

# Manual update

Every time this image is built, the latest Dropbox version is utilized.
I rebuild this image each time the new Dropbox version is released. To update
your setup just run:

```
docker pull shellbro/dropbox
docker stop dropbox
docker rm dropbox
```

and start your container from the new image as in the `Quick start` section.
