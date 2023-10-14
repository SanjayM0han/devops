
FROM ubuntu:22.04


ARG DEBIAN_FRONTEND=noninteractive


RUN apt-get update && \
    apt-get install -y unattended-upgrades && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install pandas && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY 50unattended-upgrades /etc/apt/apt.conf.d/


CMD ["/usr/bin/unattended-upgrades", "--verbose"]
