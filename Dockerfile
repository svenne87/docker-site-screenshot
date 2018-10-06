FROM debian:jessie

MAINTAINER Emil Svensson <svenne87@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV PHANTOM_JS_VERSION 2.1.1-linux-x86_64

RUN apt-get update
RUN apt-get install -y curl bzip2 libfreetype6 libfontconfig
RUN curl -sSL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOM_JS_VERSION.tar.bz2 | tar xjC /
RUN ln -s phantomjs-$PHANTOM_JS_VERSION /phantomjs

ADD https://raw.githubusercontent.com/ariya/phantomjs/master/examples/rasterize.js /rasterize.js

VOLUME ["/srv"]
WORKDIR /srv

ENTRYPOINT ["/phantomjs/bin/phantomjs", "/rasterize.js"]
