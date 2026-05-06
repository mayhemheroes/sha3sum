FROM --platform=linux/amd64 ubuntu:22.04 AS builder

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git

RUN git clone https://github.com/maandree/libkeccak
WORKDIR /libkeccak
RUN make
RUN make install

COPY . /repo
WORKDIR /repo
RUN make -j8 LDFLAGS="" LDLIBS="-lkeccak"
ENV DESTDIR=/install
RUN make install LDFLAGS="" LDLIBS="-lkeccak"

FROM ubuntu:22.04 AS package
COPY --from=builder /usr/lib/libkeccak.so.1 /lib/libkeccak.so.1
COPY --from=builder /install /install
