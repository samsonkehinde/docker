FROM couchdb:3.3.1
LABEL Author="Samson Kehinde <samson.kehinde@cloudpractice.cloud>"

WORKDIR /var/lib/couchdb

COPY etc/local.ini /opt/couchdb/etc/local.d/local.ini
COPY build/setup.sh build/setup.sh

ENTRYPOINT ["tini", "--", "/setup.sh"]
