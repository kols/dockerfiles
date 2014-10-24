# version 0.1
# ruby version: 2.1.3

FROM kane/devbase:0.1
MAINTAINER Kane Dou <douqilong@gmail.com>

WORKDIR /

USER root

# deps
RUN apt-get update \
    && apt-get install -y \
            libreadline-dev \
            libssl-dev \
            libsqlite3-dev \
            libyaml-dev \
            libxml2-dev \
            libxslt1-dev \
            zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ENV RBENV_ROOT /usr/local/rbenv
ENV RUBY_VERSION 2.1.3
RUN git clone https://github.com/sstephenson/rbenv.git $RBENV_ROOT \
    && git clone https://github.com/sstephenson/ruby-build.git \
        $RBENV_ROOT/plugins/ruby-build

ADD rbenv.sh /etc/profile.d/rbenv.sh

# strace gem source 2>&1 | grep gemrc
ADD gemrc $RBENV_ROOT/versions/$RUBY_VERSION/etc/gemrc

RUN chown -R kane $RBENV_ROOT

USER kane

RUN /bin/bash -l -c "rbenv install $RUBY_VERSION \
        && rbenv global $RUBY_VERSION"
RUN /bin/bash -l -c "gem install bundler"

WORKDIR $HOME
CMD ["/bin/bash", "-l"]
