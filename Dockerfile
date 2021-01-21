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
# /app/nngs の下に nngs を入れることにする☆（＾～＾） 絶対パスでの指定が必要☆（＾～＾）？
RUN ./configure --prefix=/app/nngs
# `make` して、また `make install` すんの☆（＾～＾）？
RUN make
RUN make install

# Script at launch
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# とりあえずコピーだけやって、元のも残してみるぜ☆（＾～＾）
WORKDIR /app/nngs/nngssrv
RUN cp -R /app/nngs/data/* /app/nngs/nngssrv/
# RUN rm -rf /app/nngs/data

# `$prefix/nngssrv/stats/logfile` ファイルを見に行くようにハードコーディングされている？
WORKDIR /app/nngs/nngssrv/stats
RUN touch logfile

# Rename files
WORKDIR /app/nngs/nngssrv/lists
RUN mv admin.default admin
RUN mv badname.default badname
RUN mv ban.default ban
RUN mv index.default index

#WORKDIR /app/nngs/nngssrv/help
#RUN touch commands

WORKDIR /app/nngs/nngssrv/ladder
RUN mv ladder9.example ladder9
RUN mv ladder19.example ladder19

WORKDIR /app/nngs/nngssrv/players/a
RUN touch admin

WORKDIR /app/nngs/nngssrv/messages
RUN mv admotd.default admotd
RUN mv login.default login
RUN mv logout.default logout
RUN mv motd.default motd
RUN mv unregistered.default unregistered
RUN mv welcome.default welcome
# RUN touch login
