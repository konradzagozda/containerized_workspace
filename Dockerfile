FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV USR_LOCAL=/usr/local/
ENV NODE_VERSION=v24.14.1
ENV PANDOC_VERSION=3.9.0.2

RUN apt-get update && \
    apt-get install -y man-db manpages-posix wget curl xz-utils tree && \
    yes | unminimize && \
    wget https://github.com/jgm/pandoc/releases/download/$PANDOC_VERSION/pandoc-$PANDOC_VERSION-1-arm64.deb && \
    dpkg -i pandoc-$PANDOC_VERSION-1-arm64.deb && \
    rm pandoc-$PANDOC_VERSION-1-arm64.deb && \
    wget https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-arm64.tar.xz && \
    tar -xJf node-$NODE_VERSION-linux-arm64.tar.xz && \
    bin/bash -c "cp -rn node-$NODE_VERSION-linux-arm64/{bin,include,lib,share} $USR_LOCAL" && \
    rm node-$NODE_VERSION-linux-arm64.tar.xz && rm -rf node-$NODE_VERSION-linux-arm64 && \
    npm install -g @google/gemini-cli


CMD ["tail", "-f", "/dev/null"]
