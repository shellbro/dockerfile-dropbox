FROM fedora:29

RUN dnf -y install wget && dnf clean all
RUN cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" \
    | tar xzf -
