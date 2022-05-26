FROM --platform=linux/amd64 ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git

RUN git clone https://github.com/maandree/libkeccak
WORKDIR /libkeccak
RUN make
RUN make install

ADD . /repo
WORKDIR /repo
RUN make -j8
