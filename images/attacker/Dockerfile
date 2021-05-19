FROM amd64/ubuntu:latest
WORKDIR /

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y install \
    iputils-ping \
    net-tools \
    iproute2 \
    ssh \
    nmap