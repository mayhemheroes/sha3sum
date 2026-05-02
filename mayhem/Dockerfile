FROM --platform=linux/amd64 ubuntu:20.04 as builder

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git

RUN git clone https://github.com/maandree/libkeccak
WORKDIR /libkeccak
RUN make
RUN make install

COPY . /repo
WORKDIR /repo
RUN make -j8
ENV DESTDIR=/install
RUN make install

FROM ubuntu:20.04 as package
COPY --from=builder /lib/libkeccak.so.1 /lib/libkeccak.so.1
COPY --from=builder /install /install
