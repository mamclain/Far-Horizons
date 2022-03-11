# Use ubuntu
from ubuntu:16.04

# install items needed to build the game
RUN apt-get update \
    && apt-get install -y \
    git \
    bash \
    nano \
    curl \
    wget \
    pandoc \
    make \
    build-essential


# make a folder in the container for the game
RUN mkdir game

# copy files from outside the container to inside the container
COPY bash /game/bash
COPY doc /game/doc
COPY src /game/src
COPY tools /game/tool

# build the manual
#RUN cd /game/doc/manual && \
#    make

RUN cd /game/src && \
    bash make.all

CMD ["bash"]

