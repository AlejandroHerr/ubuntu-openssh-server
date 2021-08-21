FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

LABEL maintainer="Alejandro Hernández <hola@alejandroherr.io"

RUN apt-get update && \
  apt-get install -y sudo openssh-server

RUN usermod --shell /bin/bash abc
RUN mkdir -p -m0755 /run/sshd

COPY /root /

ENTRYPOINT ["/init"]

CMD ["/usr/sbin/sshd", "-D"]
