FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

# PosgreSQL DB
COPY ./images/attacker/scripts/db.sql /tmp/

# Startup script
COPY ./images/attacker/scripts/init.sh /init.sh

WORKDIR /opt

# Installation
RUN apt-get -qq update \
  && apt-get -yq install --no-install-recommends build-essential patch ruby-bundler ruby-dev zlib1g-dev liblzma-dev git autoconf build-essential libpcap-dev libpq-dev libsqlite3-dev \
    postgresql postgresql-contrib postgresql-client \
    ruby python \
    dialog apt-utils \
    nmap nasm\
    ssh \
  && echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && git clone https://github.com/rapid7/metasploit-framework.git \
  && cd metasploit-framework \
  && git fetch --tags \
  && latestTag=$(git describe --tags `git rev-list --tags --max-count=1`) \
  && git checkout $latestTag \
  && rm Gemfile.lock \
  && bundle install \
  && /etc/init.d/postgresql start && su postgres -c "psql -f /tmp/db.sql" \
  && apt-get -y remove --purge build-essential patch ruby-dev zlib1g-dev liblzma-dev git autoconf build-essential libpcap-dev libpq-dev libsqlite3-dev \
  dialog apt-utils \
  && apt-get -y autoremove \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

# DB config
COPY ./images/attacker/conf/database.yml /opt/metasploit-framework/config/

# Configuration and sharing folders
VOLUME /root/.msf4/
VOLUME /tmp/data/

# Locales for tmux
ENV LANG C.UTF-8
WORKDIR /opt/metasploit-framework


RUN chmod +x /init.sh
# fix /bin/bash^M: bad interpreter:
RUN sed -i -e 's/\r$//' /init.sh 

ENTRYPOINT /bin/bash -x /init.sh && /bin/bash
