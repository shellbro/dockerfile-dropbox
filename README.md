# shellbro/dropbox

Docker in a container.

Docker Hub: https://hub.docker.com/r/shellbro/dropbox/

# Quickstart

```
docker run -d --name=dropbox --restart=always --log-driver=journald shellbro/dropbox
```

# Store files on the host

```
docker run -d --name=dropbox --restart=always --log-driver=journald -v /home/shellbro/Dropbox:/home/dropbox-user/Dropbox shellbro/dropbox
```

# Check Dropbox status

```
docker exec -it dropbox /home/dropbox-user/bin/dropbox status
```
