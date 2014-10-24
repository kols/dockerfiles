# version: 0.1

FROM debian:jessie
MAINTAINER Kane Dou <douqilong@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ADD sources.list /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y \
            build-essential \
            git-core \
            wget \
    && rm -rf /var/lib/apt/lists/*

RUN useradd kane -u 1000 -s /bin/bash --no-create-home
WORKDIR /home/kane
ENV HOME /home/kane
VOLUME ["/home"]

USER kane
