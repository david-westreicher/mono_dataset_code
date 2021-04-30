FROM ubuntu:18.04

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get -y install libeigen3-dev libopencv-dev zlib1g-dev cmake

COPY ./thirdparty /app/thirdparty
WORKDIR /app/thirdparty
RUN tar -zxvf libzip-1.1.1.tar.gz

WORKDIR /app/thirdparty/libzip-1.1.1/
RUN ./configure
RUN make
RUN make install
RUN cp lib/zipconf.h /usr/local/include/zipconf.h

COPY . /app
WORKDIR /app
RUN cmake . && make
