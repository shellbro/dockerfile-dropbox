FROM fedora:29

ARG UID=1000
ARG GID=1000

ENV PYTHONIOENCODING=UTF-8

RUN dnf makecache && dnf -y install python2 && dnf clean all

RUN groupadd -g $GID dropbox-user && useradd -u $UID -g $GID dropbox-user
USER dropbox-user
WORKDIR /home/dropbox-user

RUN mkdir bin Dropbox
RUN curl -L "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - \
    && >&2 echo "Dropbox ver.:" $(cat /home/dropbox-user/.dropbox-dist/VERSION)
RUN curl -L -o bin/dropbox \
    "https://www.dropbox.com/download?dl=packages/dropbox.py" \
    && chmod u+x bin/dropbox

EXPOSE 17500

CMD ["/home/dropbox-user/.dropbox-dist/dropboxd"]
