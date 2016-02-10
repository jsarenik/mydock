# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.9.18

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

#RUN apt-get update && apt-get install -y openssh-server
RUN rm -f /etc/service/sshd/down
RUN useradd -mk /etc/skel -p '$6$LhGLK/Hm$5S4Cj0kWRM2jBhlKsh.BMQQq89UvSfEF8n9fN8ztZQeB6DyM.2.Ml5sRwQeu7M53kLeu3bux7O1zCRt0iyc2g1' ahoj

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
#RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22
