# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM alpine

COPY ./service /
COPY ./my_init /sbin/my_init
#CMD ["/sbin/my_init"]

RUN apk update && apk upgrade && apk add openssh tmux shadow runit
RUN groupadd -r admin
RUN useradd -G admin -mk /etc/skel ahoj
RUN echo 'ahoj:ahoj' | chpasswd

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
#RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Clean up APT when done.
#RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN /sbin/my_init

EXPOSE 22
