FROM alpine:3.2

WORKDIR /

ENV DOKUWIKI_VERSION 2015-08-10a
ENV DOKUWIKI_DOWNLOAD_URL http://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz

RUN apk add --update lighttpd php-cgi php-xml php-openssl php-gd php-zlib && rm -rf /var/cache/apk/*
RUN wget -O - $DOKUWIKI_DOWNLOAD_URL | tar -zxf - \
    && mv "dokuwiki-$DOKUWIKI_VERSION" dokuwiki

RUN chown -R lighttpd:lighttpd /dokuwiki
ADD *.conf /etc/lighttpd/

EXPOSE 80
VOLUME ["/dokuwiki/data/","/dokuwiki/lib/plugins/","/dokuwiki/conf/","/dokuwiki/lib/tpl/","/var/log/"]

CMD ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
