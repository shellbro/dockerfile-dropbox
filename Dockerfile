FROM rockylinux:8.5

ARG HOST_UID=1001
ARG HOST_GID=1001

RUN yum makecache && yum -y install python2 python3 libatomic mesa-libglapi\
    libXext libXdamage libxshmfence libXxf86vm && yum clean all &&\
    groupadd -g $HOST_GID dropbox-user &&\
    useradd -u $HOST_UID -g $HOST_GID dropbox-user

USER dropbox-user
WORKDIR /home/dropbox-user

RUN mkdir bin Dropbox &&\
    curl -L "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - &&\
    >&2 echo "Dropbox ver.:" $(cat /home/dropbox-user/.dropbox-dist/VERSION) &&\
    curl -L -o bin/dropbox\
    "https://www.dropbox.com/download?dl=packages/dropbox.py" &&\
    chmod u+x bin/dropbox

EXPOSE 17500

ENTRYPOINT ["/home/dropbox-user/.dropbox-dist/dropboxd"]
