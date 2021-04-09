# Minimal Docker image for iVar v1.3.1 using Alpine base
FROM alpine:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install iVar
RUN apk update && \
    apk add autoconf automake bzip2-dev g++ make xz-dev zlib-dev && \
    wget -qO- "https://github.com/samtools/htslib/releases/download/1.12/htslib-1.12.tar.bz2" | tar -xj && \
    cd htslib-1.12 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    wget -qO- "https://github.com/andersen-lab/ivar/archive/refs/tags/v1.3.1.tar.gz" | tar -zx && \
    cd ivar-1.3.1 && \
    sh autogen.sh && \
    ./configure --disable-dependency-tracking && \
    make && \
    make install && \
    cd .. && \
    rm -rf htslib-1.12 ivar-1.3.1
