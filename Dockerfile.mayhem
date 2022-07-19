FROM --platform=linux/amd64 ubuntu:20.04 as builder

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git

RUN git clone https://github.com/maandree/libkeccak
WORKDIR /libkeccak
RUN make
RUN make install

ADD . /repo
WORKDIR /repo
RUN make -j8

RUN mkdir -p /deps
RUN ldd /repo/keccaksum | tr -s '[:blank:]' '\n' | grep '^/' | xargs -I % sh -c 'cp % /deps;'

FROM ubuntu:20.04 as package

COPY --from=builder /deps /deps
COPY --from=builder /repo/keccaksum /repo/keccaksum
ENV LD_LIBRARY_PATH=/deps
