FROM shellbro/centos:8.0-0

ARG UID=1000
ARG GID=1000
ARG LOGIN=dropbox-user

RUN yum makecache && yum -y install python2 python3 libatomic && yum clean all\
    && groupadd -g $GID $LOGIN && useradd -u $UID -g $GID $LOGIN

USER $LOGIN
WORKDIR /home/$LOGIN

RUN mkdir bin Dropbox &&\
    curl -L "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - &&\
    >&2 echo "Dropbox ver.:" $(cat /home/$LOGIN/.dropbox-dist/VERSION) &&\
    curl -L -o bin/dropbox\
    "https://www.dropbox.com/download?dl=packages/dropbox.py" &&\
    chmod u+x bin/dropbox

EXPOSE 17500

ENTRYPOINT ["/home/dropbox-user/.dropbox-dist/dropboxd"]
