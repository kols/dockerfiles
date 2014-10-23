FROM debian:wheezy

COPY sources.list /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y build-essential git-core wget

# install ruby using rbenv
ENV RBENV_ROOT /usr/local/rbenv
ENV RUBY_VERSION 2.1.3
RUN apt-get install -y \
        libreadline-dev libssl-dev libsqlite3-dev sqlite3 libyaml-dev \
        libxml2-dev libxslt1-dev zlib1g-dev
RUN git clone https://github.com/sstephenson/rbenv.git $RBENV_ROOT && \
    echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile && \
    echo 'eval "$(rbenv init -)"' >> /etc/profile && \
    git clone https://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build
RUN bash -l -c "rbenv install $RUBY_VERSION && rbenv global $RUBY_VERSION"
RUN bash -l -c "gem install --no-ri --no-rdoc bundler && rbenv rehash"

# install python
RUN apt-get -y install python-dev && \
    wget https://bootstrap.pypa.io/ez_setup.py -O - | python && \
    easy_install pip && \
    pip install virtualenv virtualenvwrapper

RUN useradd kane -u 1000 -s /bin/bash --no-create-home
WORKDIR /home/kane/
ENV HOME /home/kane
VOLUME ["/home"]
CMD ["/bin/bash", "-l"]

USER kane
