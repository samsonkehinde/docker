FROM debian:jessie
MAINTAINER Roman Galeev <jamhed@2600hz.com>

COPY build build

RUN build/setup-os.sh
RUN build/setup.sh 

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# Define mountable directories.
# VOLUME ["/usr/local/var/lib/couchdb"]

#EXPOSE 5984
WORKDIR /var/lib/couchdb

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["couchdb"]

COPY etc/local.ini /usr/local/etc/couchdb/local.ini
