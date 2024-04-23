FROM --platform=linux/amd64 ubuntu:latest

ARG TOOLCHAIN_VERSION=10.3-2021.07
ARG TOOLCHAIN="gcc-arm-${TOOLCHAIN_VERSION}-x86_64-arm-none-eabi"
ARG TOOLCHAIN_BASE_DIR=/home/dev
ARG TOOLCHAIN_DIR=$TOOLCHAIN_BASE_DIR/$TOOLCHAIN/
ARG PROJECT_DIR=/home/app

RUN apt-get update && \
    apt-get clean && \
    apt-get install -y \
        build-essential \
        xz-utils \
        wget \
        curl

WORKDIR $TOOLCHAIN_BASE_DIR
ADD . $TOOLCHAIN_BASE_DIR

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-a/$TOOLCHAIN_VERSION/binrel/$TOOLCHAIN.tar.xz

RUN tar xf ${TOOLCHAIN}.tar.xz

ENV PATH $PATH:$TOOLCHAIN_DIR
ENV USER_TOOLCHAIN_DIR=$TOOLCHAIN_DIR

WORKDIR $PROJECT_DIR
