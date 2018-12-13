# shellbro/dropbox

Dropbox in a container.

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
