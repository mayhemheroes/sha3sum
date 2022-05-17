# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim less man wget tar git gzip unzip make cmake software-properties-common curl

RUN git clone https://github.com/maandree/libkeccak
WORKDIR /libkeccak
RUN make
RUN make install

ADD . /repo
WORKDIR /repo
RUN make -j8
