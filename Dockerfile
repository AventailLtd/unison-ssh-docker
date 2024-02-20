# https://hub.docker.com/_/ubuntu/tags?page=1&name=jammy
FROM library/ubuntu:jammy-20240212

#WORKDIR /usr/local/lib

ARG UNISON_VERSION=2.51.5+1

# Note: we want the build to break if the specific veresion doesn't exist because unison is volatile if the versions differ.
RUN apt-get update && apt-get install -y -q --no-install-recommends rsync pv iotop curl openssh-client unison=$UNISON_VERSION screen mc && apt-get clean && rm -r /var/lib/apt/lists/*

RUN useradd -m -u 1000 -G users -s /bin/bash unison