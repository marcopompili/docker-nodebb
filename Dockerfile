FROM emarcs/debian-minit

MAINTAINER Marco Pompili <docker@emarcs.org>

ENV NODEBB_VERSION 1.0.0

EXPOSE 4567

RUN apt-get -q -q update && \
    apt-get -q -y install curl git

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get install -y nodejs

RUN curl -L https://github.com/NodeBB/NodeBB/archive/v$NODEBB_VERSION.tar.gz > nodebb-$NODEBB_VERSION.tar.gz

RUN tar xzf nodebb-$NODEBB_VERSION.tar.gz

RUN cd NodeBB-$NODEBB_VERSION && \
    npm install

RUN ln -s /NodeBB-$NODEBB_VERSION nodebb

COPY ./startup /etc/minit/
