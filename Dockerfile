FROM ubuntu:20.10

RUN apt-get update && apt-get install -y \
    automake \
    # make, gcc
    build-essential \
    git
    # The following is used for development.
    # telnet \
    # vim

COPY ./mlrate-1.2 /app/mlrate
COPY ./nngs-1.1.22 /app/nngs

# Get a cpuid2cpuflags.
WORKDIR /app/mlrate
ARG NNGS_GIT_USER_NAME
ARG NNGS_GIT_USER_EMAIL
RUN git config --global user.name "${NNGS_GIT_USER_NAME}"
RUN git config --global user.email "${NNGS_GIT_USER_EMAIL}"
RUN git clone https://github.com/mgorny/cpuid2cpuflags.git

# Build a cpuid2cpuflags.
WORKDIR /app/mlrate/cpuid2cpuflags
RUN autoreconf --install
RUN ./configure
RUN make
RUN cp /app/mlrate/cpuid2cpuflags/cpuid2cpuflags /usr/local/bin/cpuid2cpuflags

# Build a MLrate
WORKDIR /app/mlrate
RUN make
# RUN mkdir src
RUN cp /app/mlrate/libmlr.a /app/mlrate/src/libmlr.a

# Build a NNGS
WORKDIR /app/nngs
RUN ln -s ../mlrate mlrate
RUN ./configure --prefix=$HOME/go/nngs/
RUN make install

# Script at launch
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Log file
WORKDIR /root/go/nngs/nngssrv/stats
RUN touch logfile
